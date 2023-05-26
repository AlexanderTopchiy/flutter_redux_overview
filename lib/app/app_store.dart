import 'package:flutter_redux_overview/app/app_reducer.dart';
import 'package:flutter_redux_overview/app/app_state.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore() => Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
    );
