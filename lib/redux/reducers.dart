import 'package:redux/redux.dart';

import './actions.dart';
import './state.dart';

// define any state setter here
TvlkTestAppState _setGlobalLoading(
    TvlkTestAppState state, SetGlobalLoadingAction action) {
  return TvlkTestAppState(isLoading: action.isLoading);
}

// global reducer 
final reducer = combineReducers<TvlkTestAppState>([
  TypedReducer<TvlkTestAppState, SetGlobalLoadingAction>(_setGlobalLoading)
]);
