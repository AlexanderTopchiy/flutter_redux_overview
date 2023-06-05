import 'package:dio/dio.dart';
import 'package:flutter_redux_overview/app/app_state.dart';
import 'package:flutter_redux_overview/app/app_store.dart';
import 'package:flutter_redux_overview/data/api_constants.dart';
import 'package:flutter_redux_overview/data/data_repository.dart';
import 'package:flutter_redux_overview/features/post/redux/post_middleware.dart';
import 'package:flutter_redux_overview/features/user/redux/user_middleware.dart';
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
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    final dataRepository = DataRepository(client: dio);
    _di.registerLazySingleton<UserMiddleware>(() => UserMiddleware(repository: dataRepository));
    _di.registerLazySingleton<PostMiddleware>(() => PostMiddleware(repository: dataRepository));

    _di.registerLazySingleton<Store<AppState>>(createStore);
  }
}
