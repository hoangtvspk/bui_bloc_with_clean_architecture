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

## Build

Build dev:

- flutter build apk --dart-define=BUILD_TYPE=testing
- flutter build appbundle --dart-define=BUILD_TYPE=testing

Build prod:

- flutter build apk --dart-define=BUILD_TYPE=production
- flutter build appbundle --dart-define=BUILD_TYPE=production

Change package name:

- dart run change_app_package_name:main com.new.package.name
