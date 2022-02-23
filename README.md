# TVLK Clone App

A clone of Traveloka landing page (but not everything 👀). My first project using Flutter.

## Quick Preview

The GIF says it all~

![Demo App](https://media.giphy.com/media/8c0gfSv26F0pN0tub3/giphy.gif)

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

## Getting Started

To run the project, simply run: `flutter run`

## Packages Used

- `carousel_slider`: used for 4x3 menu list. The user can swipe right and left through different list of menu
- `flutter_spinkit`: for loading indicator
- `flutter_redux` and `redux`: used for centralized state management. In the app, redux is only used to determine whether loading indicator is shown
- `intl`: for currency converter
- `provider`: for InheritedWidget wrapper
- `redux_thunk`: middleware for redux, making action execution easier
- `scroll_snap_list`: to display horizontal list view for food/services list, which is the extension of `ListView`
- `sticky_headers`: to display the title of food/services list
