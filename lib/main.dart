import 'package:flutter/material.dart';
import 'package:flutter_redux_overview/app/redux_app.dart';
import 'package:flutter_redux_overview/core/di.dart';

void main() {
  DI.register();

  runApp(const ReduxApp());
}
