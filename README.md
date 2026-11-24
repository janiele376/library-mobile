# Library Mobile

A mobile application developed with Flutter for a library management system. It provides an interface for users to access library services and for administrators to manage the library's operations.

## Technologies

- Flutter
- Dart
- Material Design
- REST API
- HTTP
- Shared Preferences
- Flutter Localization (l10n)

## Features

### Authentication
- User login.
- User registration.
- Password recovery.
- Session management.

### User Features
- View and update personal information.
- Change password.
- Access personal profile.
- Navigate through the application.

### Accessibility and Settings
- Light and dark themes.
- System theme support.
- Adjustable font size.
- Multiple language support:
  - Portuguese
  - English
  - Spanish

### Administrative Features

Administrators have access to dedicated management pages.

**Users**
- View registered users.
- Search users.
- Edit user information.
- Delete users.
- Paginated user listing.

**Books**
- Register books.
- View and search books.
- Edit book information.
- Delete books.
- Manage book quantities.

**Publishers**
- Register publishers.
- View and search publishers.
- Edit publisher information.
- Delete publishers.

**Rentals**
- Register rentals.
- View and search rentals.
- Edit rental information.
- Renew rentals.
- Register book returns.
- Delete rentals.

## Project Structure

The project follows a feature-based architecture:

```text
lib/
├── core/
│   ├── services/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── auth/
│   ├── users/
│   ├── books/
│   ├── publishers/
│   ├── rentals/
│   ├── accessibility/
│   └── adjustments/
└── l10n/
```

## Requirements

- Flutter SDK
- Dart SDK
- Android Studio or Visual Studio Code
- A running instance of the Library Backend API

## Installation

Clone the repository:

```bash
git clone YOUR_REPOSITORY_URL
```

Navigate to the project directory:

```bash
cd library-mobile
```

Install dependencies:

```bash
flutter pub get
```

Generate localization files:

```bash
flutter gen-l10n
```

Run the application:

```bash
flutter run
```

## Backend Integration

The application communicates with the Library Backend through HTTP requests.

Before running the mobile application, make sure the backend is running and that the API base URL is correctly configured in the project.

## Localization

The application supports three languages:

- Portuguese (pt)
- English (en)
- Spanish (es)

Localization files are stored in the `lib/l10n/` directory.

## Project Status

The project is under development.

## Author

Developed as part of a library management system project.
