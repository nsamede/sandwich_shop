# Sandwich Shop Application
An application that allows users to purchase sandwiches from a sandwich shop.

Users can:
- Choose from two types of sandwichs - footlong and six-inch.
- Choose from three types of bread - white, wheat, and wholemeal.
- Add notes to the order (e.g., no onion).
- Add up to 5 sandwiches of the same type.

## Installation and Setup

### Prerequisites
- Dart/Flutter SDK version ^3.9.2
- Google Chrome (if running in browser)

### Installation
1. First, clone the repository and change the working directory:
```bash
git clone https://github.com/nsamede/sandwich_shop.git
cd sandwich_shop
```
2. Next, verify your flutter installation is working by running `flutter doctor`.
3. Finally, run the application with `flutter run` and select either web (chrome) or desktop.

## Usage
- Sandwiches can be added and removed using the `Add` and `Remove` buttons respectively.
- The type of sandwich (six-inch or footlong) can be selected using the slider below the order notes.
- The bread type can be selected by clicking the dropdown menu below the slider and selecting a bread type.
- Order notes are optional and are added by typing them into the text field above the Add and Remove buttons.

### Running the Tests
Tests can be ran by running `flutter test` (you will have to stop the app or run the command in a seperate terminal window).
