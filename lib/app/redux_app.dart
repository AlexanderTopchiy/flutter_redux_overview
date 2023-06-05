import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_overview/app/app_state.dart';
import 'package:flutter_redux_overview/core/di.dart';
import 'package:flutter_redux_overview/feature/user/view/user_screen.dart';
import 'package:flutter_redux_overview/generated/l10n.dart';
import 'package:redux/redux.dart';

class ReduxApp extends StatelessWidget {
  const ReduxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: DI.get<Store<AppState>>(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const UserScreen(),
      ),
    );
  }
}
