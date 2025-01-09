# Synapsis  #

## Getting Started

### Requirements

- Flutter SDK 3.27.1
- Android SDK

### Installation

Clone the repository :

```bash
git clone https://github.com/alpinnz/synapsis-challenge
```

Install Dependency :

```bash
flutter pub get 
```

Generate  :

```bash
dart run build_runner build -d
```

Unit Testing  :

```bash
flutter test
```

Unit Testing Coverage  :

```bash
# Generate `coverage/lcov.info` file
flutter test --coverage
# Generate HTML report
# Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:
genhtml coverage/lcov.info -o coverage/html
# Open the report
open coverage/html/index.html
```

## Structure Project

## Naming Convention