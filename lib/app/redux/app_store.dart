import 'package:flutter_redux_overview/app/redux/app_reducer.dart';
import 'package:flutter_redux_overview/app/redux/app_state.dart';
import 'package:flutter_redux_overview/core/di.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore() => Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      middleware: [
        DI.get(),
        DI.get(),
      ],
    );
