# Tradly

Tradly is a Flutter shopping app prototype for browsing products, managing a cart and wishlist, and completing a checkout flow. It includes English and Arabic localization and uses sample API services for product and account data.

## Features

- Browse, search, and view product details
- Sign in, create an account, and request a password reset
- Add products to a locally persisted cart and wishlist
- Select a delivery address and review checkout details
- Stripe payment-sheet integration
- English (`en-US`) and Arabic (`ar-SA`) translations
- Responsive Flutter UI with Riverpod state management

## Technology

- Flutter and Dart
- Riverpod for presentation state
- Dio and Retrofit for HTTP APIs
- GetIt for dependency injection
- Hive CE and SharedPreferences for local persistence
- Easy Localization for translations
- Stripe for payment-sheet checkout

## Requirements

- Flutter SDK with Dart **3.11.3 or newer** (see the SDK constraint in [`pubspec.yaml`](pubspec.yaml))
- Android Studio or Xcode for the platform you want to run
- A Stripe account and API keys to exercise checkout

## Getting started

1. Clone the repository and open its root directory:

   ```bash
   git clone <repository-url>
   cd tradly
   ```

2. Install the Flutter dependencies:

   ```bash
   flutter pub get
   ```

3. Create a `.env` file at the project root with the variables Envied expects:

   ```dotenv
   secret_key=sk_test_replace_with_your_stripe_secret_key
   publishable_key=pk_test_replace_with_your_stripe_publishable_key
   ```

   Replace the example values with your Stripe **test-mode** keys. Keep `.env` private: it is ignored by Git and must not be committed.

4. Generate the Envied source used by the app:

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. Run the app on a connected device or emulator:

   ```bash
   flutter run
   ```

The app initializes Stripe during startup, so configure the environment file and run code generation before launching it.

## API configuration

The current project uses hosted sample services:

- Product listing, category browsing, search, and product details use the [DummyJSON products API](https://dummyjson.com/products).
- Login, registration, and password-reset requests use a WireMock endpoint configured in [`lib/core/utils/constants.dart`](lib/core/utils/constants.dart).

These services are for development/demo use and may not provide real user accounts or durable application data. To connect your own backend, update the base URLs and request/response models in [`lib/core/utils/constants.dart`](lib/core/utils/constants.dart), [`lib/core/network/app_api.dart`](lib/core/network/app_api.dart), and [`lib/core/network/test_api.dart`](lib/core/network/test_api.dart), keeping the Retrofit definitions and generated clients in sync.

## Payments and production security

The app configures Stripe with a publishable key and includes a payment-intent data source. **Do not ship a Stripe secret key in a mobile app**—obfuscation or a local `.env` file does not make a client-side secret safe. For a production deployment, create PaymentIntents on a trusted backend, return only the client secret to the app, and use Stripe test keys until your integration is ready for live payments.

## Localization

Translations are stored in [`assets/translations`](assets/translations). The supported locales are English (`en-US`) and Arabic (`ar-SA`); locale selection is available in the app's profile/settings flow.

## Project layout

```text
lib/
  core/         App setup, networking, dependency injection, and shared utilities
  env/          Envied environment configuration
  features/     Authentication, products, browse, cart, wishlist, and checkout
  presentation/ App navigation, shared UI resources, and main screens
assets/
  images/       App illustrations and image assets
  json/         Lottie animation assets
  translations/ English and Arabic translation files
```

## Checks

Run static analysis and the test suite from the project root:

```bash
flutter analyze
flutter test
```
