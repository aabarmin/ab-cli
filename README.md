# AB CLI (MacOS Version only)

## Reasoning

Configuration of the development environment is always a complicated task, it always takes a lot of time to configure
everything properly and from the first time. Configuration of the environment for Java development is complicated as well. 

The main intention of this project is to have a few simple scripts that allows having a very simplified installation
and configuration process, as simple as running the `abc_install.sh` file. 

Current version of the AB CLI includes automatic installation and configuration of the following tools:
* AdoptOpenJDK 8
* AdoptOpenJDK 11
* Maven 3.6.3

## Installation

### Cloning and installing

In order to install the AB CLI clone this repository and execute the following command:

```shell script
$ ./abc_install.sh
```

As a result, in your home directory the `dev-tools` folder will be created and all the mentioned software will be
automatically downloaded, installed and configured there

### Configuration for the day-to-day usage

In order to improve the development experience, it's recommended adding the following lines to your `~/.zshrc` file:

```shell script
export AB_CLI_HOME=<PUT PATH TO THE CLONED REPOSITORY HERE like ${PATH}/dev-code/ab-cli>
source ${AB_CLI_HOME}/abc_completion.sh
```

As a result, the following functions will be available in the terminal:
* `abc_java_8` - switch JDK version to 8
* `abc_java_11` - switch JDK version to 11

## Contribution

Feel free to send pull-requests if you have something to add to this repository
