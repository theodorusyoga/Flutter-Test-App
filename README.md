# TVLK Clone App

A clone of Traveloka landing page (but not everything 👀). My first project using Flutter.

## Quick Preview

The GIF says it all~
Basically, the app consists of 2 screens: `Home` and `Search` screen. You can go to `Search` screen by clicking the search box on the header section.
Bonus: the placeholder of the search input box is animated to match the behavior of TVLK app (for research purposes 🙈), using `Tween<Offset>`.

![demo-app](https://github.com/theodorusyoga/Flutter-Test-App/blob/master/demo.gif?raw=true)

## Folder Structure

> Contains folder structure for the current app

    .
    ├── ...
    ├── lib                 # Source files
      ├── assets            # Assets files
        ├── fonts           # Font files
        ├── images          # Image files
      ├── helpers           # Helpers files (currently used for currency converter)
      ├── mocks             # Since API is not provided, we have this folder to store any example data
      ├── model             # MVVM Model
      ├── redux             # Redux files (Action, State, Reducers) using Redux Thunk
      ├── routes            # Screen route list for the app
      ├── view              # MVVM View
       ├── ...              # View name
        ├── ...             # Component name
         ├── components     # Small widgets from respective screen or components
      ├── view_model        # MVVM View Model, since no API is provided, we use view model to retrieve data from mocks
      ├── test              # Test files
         ├── mocks          # Mock data for test files
         ├── ...            # Widget folder to be tested

## Getting Started

To run the project, simply run: `flutter run`

## Unit Test Coverage

What has been accomplished:

- Redux unit test
- View model unit test
- Widget test only on: `MenuItem` and `ExploreItem`

What can be improved:

- Functional test
- Integration test (we need a working API)

To run unit test with code coverage without including assets and styles, please run below command.

```
flutter test --coverage && lcov --remove coverage/lcov.info '**/styles.dart' 'lib/assets/*'  -o coverage/new_lcov.info && genhtml coverage/new_lcov.info -o coverage/html
```

To see your code coverage, go to `coverage/html/index.html`.

### Coverage status:

![cov-stat](https://github.com/theodorusyoga/Flutter-Test-App/blob/master/cov_status.png?raw=true)

## Packages Used

- `carousel_slider`: used for 4x3 menu list. The user can swipe right and left through different list of menu
- `flutter_spinkit`: for loading indicator
- `flutter_redux` and `redux`: used for centralized state management. In the app, redux is only used to determine whether loading indicator is shown
- `intl`: for currency converter
- `redux_thunk`: middleware for redux, making action execution easier
- `scroll_snap_list`: to display horizontal list view for food/services list, which is the extension of `ListView`
- `sticky_headers`: to display the title of food/services list
