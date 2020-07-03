# Cloud Foundry Waratek Buildpack

## Description
The `waratek-buildpack` is a [Cloud Foundry](https://www.cloudfoundry.org/) buildpack for running [Waratek](https://www.waratek.com/).
It installs Java 8 (OpenJDK) and Waratek Secure and if supplied, uses the `waratek.properties` & `rules.armr` files for configuration.

## Supported platforms
This buildpack is tested with Cloud Foundry 6.51.0+2acd15650.2020-04-07.

## How to use
To use this buildpack, specify the URI of this repository when pushing a waratek.properties file to Cloud Foundry.

1. In your application directory, execute ```touch waratek.enable```.  This file must exist or the build pack will skip processing.

2. **Important**: You need to specify `WARATEK_VERSION` and `WARATEK_DIST_URL` as environment variables in your `manifest.yml` or on the command line, e.g.:

    ```yaml
    env:
      WARATEK_VERSION: '19.0.0'
      WARATEK_DIST_URL: 'https://waratek-downloads/waratek-secure/waratek-secure-19.0.0.zip'
    ```

    ```bash
    cf set-env <APP_NAME> WARATEK_VERSION '19.0.0'
    cd set-env <APP_NAME> WARATEK_DIST_URL 'https://waratek-downloads/waratek-secure/waratek-secure-19.0.0.zip'
    ```

3. **Optional**: Place your user defined `waratek.properties` file in the application directory. The build pack will use this in preference to
the default copy supplied by Waratek.

4. **Optional**: Place your user defined `rules.armr` file in the application directory. The build pack will use this in preference to
the default copy supplied by Waratek.

5. In your application directory, push your application with the build pack:

    ```bash
    $ cf push <APP-NAME> -p waratek.enable -b https://github.com/mbagnall/cf-waratek-buildpack.git
    ```

### Configuration

The buildpack automatically configures the `JAVA_OPTS` required for running Waratek Secure with the application to be protected. Everything else can be configured in your `waratek.properties` file. Please refer to the Waratek Secure User Guide for details on setting configuration values. A default `waratek.properties` file is shipped with the product.

## Acknowledgements

This buildpack was developed based on the examples listed in the [Community created](https://github.com/cloudfoundry-community/cf-docs-contrib/wiki/Buildpacks#community-created) set of buildpacks.

## Licensing
This buildpack is released under [MIT License](LICENSE).

## Maintenance
This buildpack is maintained by Waratek.
