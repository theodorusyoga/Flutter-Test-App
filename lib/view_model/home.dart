import 'package:redux/redux.dart';

import '../redux/actions.dart';
import '../redux/state.dart';

class HomeViewModel {
  final bool isLoading;
  final void Function(bool isLoading) setIsLoading;

  HomeViewModel({required this.isLoading, required this.setIsLoading});

  static HomeViewModel fromStore(Store<TvlkTestAppState> store) {
    return HomeViewModel(
        isLoading: store.state.isLoading,
        setIsLoading: (loading) {
          store.dispatch(SetGlobalLoadingAction(loading));
        });
  }
}
