# Rive Mascot App

An interactive Flutter application that showcases Rive animations with a customizable mascot character.

## Features

- Animated splash screen with smooth transitions
- Interactive mascot character with customizable attributes
- Multiple animation states (jump, wave)
- Customizable hats for the mascot (fun hat, birthday hat, cap)
- Ability to rename the mascot
- Fluid animations powered by Rive

## Screenshots

## Technologies Used

- Flutter SDK (^3.7.2)
- [Rive](https://rive.app/) for interactive animations
- Flutter Riverpod for state management
- Flutter Animate for additional animation effects

## Getting Started

### Prerequisites

- Flutter SDK (^3.7.2)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository

```bash
git clone <repository-url>
cd rive_app
```

2. Install dependencies

```bash
flutter pub get
```

3. Run the app

```bash
flutter run
```

## Project Structure

- `lib/`
  - `helpers/` - Utility functions for Rive animations
  - `models/` - Data models and enums
  - `pages/` - Main application screens
  - `providers/` - State management with Riverpod
  - `widgets/` - Reusable UI components

## Usage

The app starts with a landing page featuring the animated mascot, then transitions to the main mascot customization page where you can:

- Change the mascot's hat
- Trigger jump and wave animations
- Rename the mascot

## License

This project is licensed under the MIT License - see the LICENSE file for details.
