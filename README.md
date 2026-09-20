# Flutter Food

Production-oriented Flutter food delivery application.

> The current repository contains the customer-app foundation. Backend, restaurant operations, delivery, payments and administration are being added incrementally behind a versioned API.

## Current status

**Phase 1 — Production Foundation**

- Flutter/Dart project identity standardized to Flutter Food.
- Android application ID: `com.ibrahimshoshaaa.flutterfood`.
- iOS bundle identifier: `com.ibrahimshoshaaa.flutterfood`.
- Release builds no longer fall back to debug signing; production signing must be supplied through ignored `android/key.properties` or CI secrets.
- Baseline widget test added.
- GitHub Actions CI runs dependency installation, static analysis, tests and a debug Android build.
- Production architecture documented in `docs/PRODUCTION_ARCHITECTURE.md`.

## Planned product scope

- Customer authentication and profile
- Restaurant discovery and menus
- Search, categories and favorites
- Cart and checkout
- Payments
- Orders and order history
- Delivery tracking
- Push notifications
- Restaurant operations
- Admin operations

## Development

Requirements:

- Flutter stable
- Dart SDK compatible with `pubspec.yaml`
- Android Studio/SDK for Android development
- Xcode for iOS development

Run:

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

## Android release signing

Copy `android/key.properties.example` to `android/key.properties` and provide a real release keystore. The real file is ignored by Git and must never be committed.

## Architecture

See `docs/PRODUCTION_ARCHITECTURE.md`.

## Repository workflow

Production changes should be developed on feature/fix branches, validated by CI, reviewed, and then merged into `main`.

## License

See `LICENSE`.
