import 'package:flutter_redux_overview/app/app_state.dart';
import 'package:flutter_redux_overview/app/app_store.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

abstract class DI {
  static final _di = GetIt.I;

  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
    Type? type,
  }) =>
      _di.get<T>(
        instanceName: instanceName,
        param1: param1,
        param2: param2,
        type: type,
      );

  static void register() {
    _di.registerLazySingleton<Store<AppState>>(createStore);
  }
}
