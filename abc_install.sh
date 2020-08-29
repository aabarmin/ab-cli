#!/bin/zsh

if [ -z "${AB_CLI_HOME}" ]; then
  echo "AB_CLI_HOME environment variable is not set"
  echo "Setting to $(pwd)"
  export AB_CLI_HOME=$(pwd)
fi

source ${AB_CLI_HOME}/environment.sh

function create_dev_tools() {
  # Check if dev-tools directory exists
  if [ -d "${DEV_TOOLS}" ]; then
    echo "${DEV_TOOLS} directory exists, do nothing"
  else
    echo "Creating ${DEV_TOOLS} directory"
    mkdir "${DEV_TOOLS}"
  fi
}

function create_java_tools() {
  # Check if dev-tools/java directory exists
  if [ -d "${JAVA_TOOLS}" ]; then
    echo "${JAVA_TOOLS} directory exists, do nothing"
  else
    echo "Creating ${JAVA_TOOLS} directory"
    mkdir "${JAVA_TOOLS}"
  fi
}

function install_jdk_8() {
  # Check if dev-tools/java/jdk_8 directory exists
  if [ -d "${JAVA_TOOLS_JDK_8}" ]; then
    echo "JDK 8 is installed in ${JAVA_TOOLS_JDK_8}"
    echo "Skipping install"
  else
    if [ -f "${JAVA_TOOLS_JDK_8}.tar.gz" ]; then
      echo "JDK 8 was already downloaded, skipping this step"
    else
      echo "Downloading JDK 8"
      curl -L https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u265-b01/OpenJDK8U-jdk_x64_mac_hotspot_8u265b01.tar.gz --output ${JAVA_TOOLS_JDK_8}.tar.gz
    fi

    tar --cd ${JAVA_TOOLS} -zxvf ${JAVA_TOOLS_JDK_8}.tar.gz
    mv ${JAVA_TOOLS}/jdk8u265-b01/Contents/Home ${JAVA_TOOLS_JDK_8}
    rm -rf ${JAVA_TOOLS}/jdk8u265-b01
    rm -f ${JAVA_TOOLS_JDK_8}.tar.gz
  fi
}

function install_jdk_11() {
  # Check if dev-tools/java/jdk_11 directory exists
  if [ -d "${JAVA_TOOLS_JDK_11}" ]; then
    echo "JDK 11 is installed in ${JAVA_TOOLS_JDK_11}"
    echo "Skipping install"
  else
    if [ -d "${JAVA_TOOLS_JDK_11}.tar.gz" ]; then
      echo "JDK 11 was already downloaded, skipping this step"
    else
      echo "Downloading JDK 11"
      curl -L https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.8%2B10/OpenJDK11U-jdk_x64_mac_hotspot_11.0.8_10.tar.gz --output ${JAVA_TOOLS_JDK_11}.tar.gz
    fi

    tar --cd ${JAVA_TOOLS} -zxvf ${JAVA_TOOLS_JDK_11}.tar.gz
    mv ${JAVA_TOOLS}/jdk-11.0.8+10/Contents/Home ${JAVA_TOOLS_JDK_11}
    rm -rf ${JAVA_TOOLS}/jdk-11.0.8+10
    rm -f ${JAVA_TOOLS_JDK_11}.tar.gz
  fi
}

function install_maven() {
  # Check if dev-tools/java/maven_363 directory exists
  if [ -d "${JAVA_TOOLS_MAVEN}" ]; then
    echo "Maven 3.6.3 is already installed in ${JAVA_TOOLS_MAVEN}"
    echo "Skipping install"
  else
    if [ -d "${JAVA_TOOLS_MAVEN}.tar.gz" ]; then
      echo "Maven 3.6.3 was already downloaded, skipping this step"
    else
      echo "Downloading Maven 3.6.3"
      curl https://apache-mirror.rbc.ru/pub/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz --output ${JAVA_TOOLS_MAVEN}.tar.gz
    fi

    tar --cd ${JAVA_TOOLS} -zxvf ${JAVA_TOOLS_MAVEN}.tar.gz
    mv ${JAVA_TOOLS}/apache-maven-3.6.3 ${JAVA_TOOLS_MAVEN}
    rm -f ${JAVA_TOOLS_MAVEN}.tar.gz
  fi
}

create_dev_tools
create_java_tools
install_jdk_8
install_jdk_11
install_maven
