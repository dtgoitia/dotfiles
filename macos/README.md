## Using `.macos`

`.macos` is a BASH script that you can run without needing to stow it.

It's in the dotfile because it's related to setting up the environment.

## Using `defaults` CLI tool

* Read all the settings in the system:

  ```shell
  $ defaults read
  {
      "Apple Global Domain" =     {
          AKLastIDMSEnvironment = 0;
          AppleActionOnDoubleClick = Maximize;
          AppleAntiAliasingThreshold = 4;
          AppleInterfaceStyle = Dark;
          AppleKeyboardUIMode = 0;
          AppleLanguages =         (
              "en-GB",
              "es-ES"
          );
          AppleLanguagesDidMigrate = "10.15.7";
          AppleLanguagesSchemaVersion = 1001;
          (...)
      }
      (...)
  }
  ```

* Read a specific domain settings:

  ```shell
  $ defaults read "Apple Global Domain"
  {
      AKLastIDMSEnvironment = 0;
      AppleActionOnDoubleClick = Maximize;
      AppleAntiAliasingThreshold = 4;
      AppleInterfaceStyle = Dark;
      AppleKeyboardUIMode = 0;
      AppleLanguages =         (
          "en-GB",
          "es-ES"
      );
      AppleLanguagesDidMigrate = "10.15.7";
      AppleLanguagesSchemaVersion = 1001;
      (...)
  }
  ```

* Read a specific setting:

  ```shell
  $ defaults read "Apple Global Domain" AppleLanguages
  (
      "en-GB",
      "es-ES"
  )
  ```

## Useful information

* You can use `NSGlobalDomain` instead of `Apple Global Domain`.
