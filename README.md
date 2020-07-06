# Cloud Foundry Waratek Buildpack

## Description
The `waratek-buildpack` is a [Cloud Foundry](https://www.cloudfoundry.org/) buildpack for running [Waratek](https://www.waratek.com/).
It installs Waratek Secure and configures it for use as a java agent to protect a java application.

By default it will also install Java 8 (OpenJDK JRE) - this behaviour may be switched off as described below.

## Supported platforms
This buildpack is tested with Cloud Foundry 6.51.0+2acd15650.2020-04-07.

## How to use
To use this buildpack, specify the URI of this repository when pushing a waratek.properties file to Cloud Foundry.

1. In your application directory, execute ```touch waratek.enable```.  This file must exist or the build pack will skip processing.

2. **Important**: You need to specify `WARATEK_VERSION`, `WARATEK_DIST_URL` and `APP_LAUNCH_CMD` as environment variables in your `manifest.yml` or on the command line, e.g.:

    ```yaml
    env:
      WARATEK_VERSION: '16.3.1'
      WARATEK_DIST_URL: 'https://waratek-downloads/waratek-secure/waratek-secure-16.3.1-b85.zip'
      APP_LAUNCH_CMD: 'java -cp /home/vcap/app/. org.springframework.boot.loader.JarLauncher'
    ```

    ```bash
    cf set-env <APP_NAME> WARATEK_VERSION '16.3.1'
    cf set-env <APP_NAME> WARATEK_DIST_URL 'https://waratek-downloads/waratek-secure/waratek-secure-16.3.1-b85.zip'
    cf set-env <APP_NAME> APP_LAUNCH_CMD 'java -cp /home/vcap/app/. org.springframework.boot.loader.JarLauncher'
    ```
**Important**: `APP_LAUNCH_CMD` is the usual command or start script used to start the Application that Waratek will protect.

3. In your application directory, push your application with the build pack:

    ```bash
    $ cf push <APP-NAME> -b https://github.com/mbagnall/cf-waratek-buildpack.git
    ```

**NOTE**: A sample manifest file is included in this repo for reference.

### Configuration

The buildpack automatically configures the `JAVA_OPTS` required for running Waratek Secure with the application to be protected. Everything else can be configured in your `waratek.properties` file. Please refer to the Waratek Secure User Guide for details on setting configuration values. A default `waratek.properties` file is shipped with the product.

### Disable Java download

This buildpack will download and install Java 8 by default. If you wish to disable this behaviour set the following in your `manifest.yml` or on the command line:

    ```yaml
    env:
      USE_JAVA: 'false'
    ```

    ```bash
    cf set-env <APP_NAME> USE_JAVA 'false'
    ``
**Important**: Java *is* required. This option is provided to facilitate a deployment where Java is sourced elsewhere e.g. via the Java BuildPack.

## Acknowledgements

This buildpack was developed based on the examples listed in the [Community created](https://github.com/cloudfoundry-community/cf-docs-contrib/wiki/Buildpacks#community-created) set of buildpacks.

## Licensing
This buildpack is released under [MIT License](LICENSE).

## Maintenance
This buildpack is maintained by Waratek.
