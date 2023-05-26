import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_overview/app/app_state.dart';
import 'package:flutter_redux_overview/core/di.dart';
import 'package:flutter_redux_overview/features/user/view/user_screen.dart';
import 'package:redux/redux.dart';

class ReduxApp extends StatelessWidget {
  const ReduxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: DI.get<Store<AppState>>(),
      child: MaterialApp(
        title: 'Redux overview',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        ),
        home: const UserScreen(),
        // TODO Localization
      ),
    );
  }
}
