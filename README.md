# kindred_mobile


# Architecture Overview

The project is structured based on the MVC (Model View Controller) pattern and from @Faiz_Rhm's [Understanding MVC Architecture in Flutter](https://medium.com/@Faiz_Rhm/understanding-mvc-architecture-in-flutter-a-comprehensive-guide-with-examples-5d1a372c7eaf) explanation. It's a design pattern that separates an application into three components, allowing for better organization and modularization of code.


# PROJECT STRUCTURE
```
kindred_mobile

├─ lib
│  ├─ common
│  │  ├─ constants 
│  │  ├─ exceptions
│  │  ├─ resources
│  │  ├─ theme
│  │  ├─ translations
│  │  ├─ utils
│  │  └─ validators
│  ├─ core
│  │  ├─ data
│  │  │  ├─ api
│  │  │  └─ resources
│  │  ├─ infrastructure
│  │  │  ├─ environment
│  │  │  ├─ platform
│  │  │  └─ storage
│  │  └─ presentation
│  │     ├─ navigation
│  │     ├─ views
│  │     └─ widgets
│  ├─ features
│  │  └─ feature1
│  │     ├─ bloc
│  │     ├─ data
│  │     │  ├─ models
│  │     │  ├─ repository
│  │     │  └─ service
│  │     └─ presentation
│  │        ├─ pages
│  │        └─ widgets
│  └─ main.dart
```
# Environment Variables

Add the environment variables on the `.secrets` folder.

|Environment|File|
|---|---|
|Development|dev.json|
|Staging|stg.json|
|Production|prod.json|

On most cases `development` and `staging` uses the same values.

# Running app on different environment

|Android | |
|-|-|
|Installing on device (release mode)|rps launch dev|
||rps launch stg|
||rps launch prod|
|Generating an APK|rps build apk dev|
||rps build apk stg|
||rps build apk prod|
|Generating an AAB file|rps build aab dev|
||rps build aab stg|
||rps build aab prod|


## Project Initial Setup 
- For MacOS: Make sure that you have atleast MacOS 13 Ventura or later to run this project.
- Follow the installation setup in [Flutter Official Docs](https://docs.flutter.dev/get-started/install) except installing the Flutter SDK because we will use FVM to manage the flutter versions.
- Download Latest [Android Studio](https://developer.android.com/studio).
- Download [XCode](https://developer.apple.com/download/all/) from the App Store.
- Download [Visual Studio Code](https://code.visualstudio.com/download).
- Open the `project` folder in Visual Studio Code.
- Install all recommended extensions that will pop up or press (`command` + `shift` + x) and install it manually
- Create `.secrets` folder inside `project` folder and place the json files. Follow the instruction here to get the json [Environment Variables](https://ekcms.atlassian.net/l/cp/VAG0NLiq)
- After the setup run the following command in the terminal:
  `rps pub-get`, `` and `rps gen`
 
## Code Analysis 

We use [Dart Code Linter](https://github.com/bancolombia/dart-code-linter) to identify code smells in the project.

To run the command: 

Command for code metrics, rules and anti-patterns violations:

```sh
fvm dart run dart_code_linter:metrics analyze lib
```

Command for checking unnecessary nullable parameters:

```sh
fvm dart run dart_code_linter:metrics check-unnecessary-nullable lib
```

Command for checking unused file in the project:

```sh
fvm dart run dart_code_linter:metrics check-unused-files lib
```

## Translations

We use [intl_utils](https://github.com/localizely/intl_utils) for binding the translations to the app. Generated code can be found on `lib/common/translations/generated`. To add or edit the translations go to `lib/common/translations/`.

To generate the translations run this command:

```sh
rps gen-intl
``` 

