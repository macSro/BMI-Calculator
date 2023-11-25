<a name="top"></a>

# BMI Calculator

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#run">Run</a></li>
        <li><a href="#test">Test</a></li>
      </ul>
    </li>
    <li><a href="#features">Features</a></li>
    <li><a href="#demo">Demo</a></li>
  </ol>
</details>

## About The Project

This project is a very simple <a href="https://en.wikipedia.org/wiki/Body_mass_index">Body Mass Index</a> calculator implemented in compliance with <a href="https://m2.material.io/">Material Design</a>. It was originally created for a laboratory class as part of _Mobile and Multimedia Systems_ course at _Wrocław University of Science and Technology_.

_For example of use, please refer to the <a href="#demo">Demo</a> section._

### Built With

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)

State management: <a href="https://pub.dev/packages/flutter_bloc">BloC</a>

<p align="right">(<a href="#top">back to top</a>)</p>



## Getting Started

To get a copy of this project running on your machine follow these steps.

### Prerequisites

* Flutter SDK installed

* Dart SDK installed

* IDE configured for development of Flutter applications _(e.g., VS Code)_

### Installation

1. Clone this repository:

   ```
   git clone https://github.com/macSro/BMI-Calculator.git
   ```

2. Navigate to the cloned directory:

   ```
   cd BMI-Calculator
   ```

3. Install the dependencies:

   ```
   flutter pub get
   ```

### Run

1. Inside your IDE select the target device

2. Run the app with IDE "Run" button _(VS Code: F5)_ or by executing:

```
flutter run
```

### Test

In order to execute unit tests, navigate to ```test/unit_test.dart``` and then run tests with IDE "Run" button _(VS Code: F5)_ or simply execute:

```
flutter test
```

<p align="right">(<a href="#top">back to top</a>)</p>



## Features 

* BMI calculation
* BMI categorization
* Storage of previous results in shared preferences
* Metric and imperial units support



## Demo

[demo.webm](https://github.com/macSro/BMI-Calculator/assets/56345054/04b94a03-6bb9-4b37-bdf3-f6286c6c93cd)

<p align="right">(<a href="#top">back to top</a>)</p>
