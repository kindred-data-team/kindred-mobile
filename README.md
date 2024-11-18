# kindred_mobile


# Architecture Overview

The project is structured based on the Clean Architecture principles and from @ResoCoder's [Flutter TDD Clean Architecture](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/) explanation. It provides a clear and modular structure for building applications by dividing them into distinct layers.


# PROJECT STRUCTURE
```
 lib
 ├─ config
 │  ├─ routing
 │  ├─ theme
 │  ├─ localization
 │  └─ exceptions
 ├─ core
 │  ├─ constants
 │  ├─ resources
 │  ├─ usecases
 │  └─ utils
 ├─ features
 │  ├─feature1
 │  │  ├─ data
 │  │  │  ├─ data_sources
 │  │  │  ├─ models
 │  │  │  └─ repository
 │  │  ├─ domain
 │  │  │  ├─ entities
 │  │  │  ├─ repository
 │  │  │  └─ usecases
 │  │  └─ presentation
 │  │     ├─ bloc
 │  │     ├─ pages/views
 │  │     └─ widgets
 │  └─feature2
 │     ├─ data
 │     │  ├─ data_sources
 │     │  ├─ models
 │     │  └─ repository
 │     ├─ domain
 │     │  ├─ entities
 │     │  ├─ repository
 │     │  └─ usecases
 │     └─ presentation
 │        ├─ bloc
 │        ├─ pages/views
 │        └─ widgets
 └─ main.dart
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
  `fvm flutter pub get`, `` and `fvm dart run build_runner build --delete-conflicting-outputs`
 
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
fvm dart run intl_utils:generate


