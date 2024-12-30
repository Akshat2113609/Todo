# Flutter To-Do App

This is a simple To-Do app built with Flutter. The app allows users to add, delete, and mark tasks as complete. It also supports theme switching (Dark/Light mode) and persists data using `SharedPreferences`.

## Features
- Add, delete, and mark tasks as completed.
- Toggle between Dark and Light mode.
- Save tasks persistently using `SharedPreferences`.
- Fetch data from an external API (optional feature for API posts).

## Prerequisites

Before running the app, make sure you have the following installed:

1. **Flutter**:
   - Follow the [official installation guide](https://flutter.dev/docs/get-started/install) to install Flutter on your machine.
   
2. **Android Studio or VS Code** (for Flutter development):
   - [Android Studio](https://developer.android.com/studio) is the recommended IDE for Flutter development, but you can also use VS Code with the Flutter plugin.

3. **Dart SDK**:
   - Dart is bundled with Flutter, so when you install Flutter, Dart will be installed as well.

4. **SharedPreferences** package:
   - This app uses the `shared_preferences` package to persist data across app sessions. Ensure the following dependency is added to your `pubspec.yaml`:
     ```yaml
     dependencies:
       flutter:
         sdk: flutter
       shared_preferences: ^2.0.0
     ```

## Installation

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/flutter-todo-app.git
2. Navigate to the project directory:
   ```bash
   cd flutter-todo-app
3. Install dependencies:
   ```bash
   flutter pub get
4. Open the project in your preferred editor (e.g., Android Studio or VS Code).

## Running the App
1. Run on an Emulator/Simulator:
       Open your preferred emulator (Android/iOS) and in your terminal, run the following command:
   ```bash
   flutter run
2. Run on a Physical Device:
       Connect your physical device to your computer via USB and ensure USB debugging is enabled then run the following command:
   ```bash
   flutter run
##images


  Home Page: Light theme   
  
  ![WhatsApp Image 2024-12-29 at 11 35 25 PM](https://github.com/user-attachments/assets/7e4c7fb8-99fc-424b-a65d-bb7f05c35a4b)
  
  Home Page: Dark theme  
  
  ![WhatsApp Image 2024-12-29 at 11 41 16 PM](https://github.com/user-attachments/assets/30de39bf-d1b8-42de-9dc5-217bd970a04b)


   API Posts Screen:

  

 ![WhatsApp Image 2024-12-29 at 11 43 19 PM](https://github.com/user-attachments/assets/22a227da-8396-45f5-a956-0fc7972ea0e4)


  Filtering by UserID:


  ![WhatsApp Image 2024-12-29 at 11 44 07 PM](https://github.com/user-attachments/assets/baf0e3cd-1472-4ac8-a39b-f03e3affdeb6)




