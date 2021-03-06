# flutter_with_getx

A new Flutter project.

![ios build](https://github.com/Thirosue/flutter_with_getx/actions/workflows/build-ios.yml/badge.svg)
![android build](https://github.com/Thirosue/flutter_with_getx/actions/workflows/build-dndroid.yml/badge.svg)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### required

* VS Code

### Flutter Setup

https://docs.flutter.dev/get-started/install

### Set up an editor

* use VS Code

https://docs.flutter.dev/get-started/editor?tab=vscode

### fvm setup

https://fvm.app/docs/getting_started/installation

### Set up the version of Flutter used in your project

```bash
$ fvm install
```

## run application with debug

```bash
$ fvm flutter run
```

## run test

```bash
$ fvm flutter test
```

## analyze code

```bash
$ fvm flutter analyze
```

## Code Generate

```
$ fvm flutter pub run build_runner build --delete-conflicting-outputs
```

## XCode

### Open

```
$ open ios/Runner.xcodeproj 
```

## Build

### Android

* Android Application Package

```bash
$ fvm flutter build apk --flavor production
```

* Android App Bundle

```bash
$ fvm flutter build appbundle --flavor production
```