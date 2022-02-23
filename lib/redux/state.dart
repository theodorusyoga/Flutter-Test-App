import 'package:flutter/cupertino.dart';

@immutable
class TvlkTestAppState {
  final bool isLoading;

  const TvlkTestAppState({required this.isLoading});

  factory TvlkTestAppState.initial() {
    return const TvlkTestAppState(isLoading: true);
  }
}