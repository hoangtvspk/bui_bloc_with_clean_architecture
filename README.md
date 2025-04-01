# Bloc with clean architector

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Remove git locally:

- rm -rf .git

Change package name:

- dart run change_app_package_name:main com.new.package.name

Flutter run generate:

- flutter pub run build_runner build --delete-conflicting-outputs

- dart run build_runner build --delete-conflicting-outputs

Change app's icon:

- dart run flutter_launcher_icons

Change native splash:

- flutter pub run flutter_native_splash:create


## Environment Commands

### Running the App

Run the app in different environments:

```bash
# Development
flutter run --flavor dev --dart-define=ENVIRONMENT=dev

# Staging
flutter run --flavor staging --dart-define=ENVIRONMENT=staging

# Production
flutter run --flavor prod --dart-define=ENVIRONMENT=prod
```

### Building APK

Build APK for different environments:

```bash
# Development APK
flutter build apk --flavor dev --dart-define=ENVIRONMENT=dev

# Staging APK
flutter build apk --flavor staging --dart-define=ENVIRONMENT=staging

# Production APK
flutter build apk --flavor prod --dart-define=ENVIRONMENT=prod
```

### Building iOS

Build iOS for different environments:

```bash
# Development iOS
flutter build ios --flavor dev --dart-define=ENVIRONMENT=dev

# Staging iOS
flutter build ios --flavor staging --dart-define=ENVIRONMENT=staging

# Production iOS
flutter build ios --flavor prod --dart-define=ENVIRONMENT=prod
```


Note: Make sure you have the appropriate environment files (.env.dev, .env.staging, .env.prod) set up in the lib/core/config directory before running these commands.
