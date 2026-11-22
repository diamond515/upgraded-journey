# أنا المؤمن

Flutter Android-first, offline-first Islamic app.

## Current state
This is the initial build scaffold only. It establishes:
- Flutter application entry point
- Arabic RTL app shell
- Initial navigation structure
- Android APK build workflow using GitHub Actions

The approved detailed screen designs and content specifications must be applied before treating this as a finished app. Quran text, recitations, tafsir, adhkar, stories, and media must be added with verified sources and compatible licenses.

## Build
Run `flutter pub get`, then `flutter build apk --release`.

GitHub Actions workflow: `.github/workflows/android-apk.yml`
