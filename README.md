# 해충 박멸 V0.1.0

First Android app scaffold.

## Important
This package contains Flutter source + the validated local HTML game engine.
A release APK still requires a Flutter SDK/Android build environment.

## Build
```bash
flutter create . --platforms=android --org com.pesteradication
flutter pub get
flutter test
flutter build apk --release
```
APK output: `build/app/outputs/flutter-apk/app-release.apk`
