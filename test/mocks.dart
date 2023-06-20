import 'package:flutter_redux_overview/app/redux/app_state.dart';
import 'package:flutter_redux_overview/data/data_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:redux/redux.dart';

class MockStore extends Mock implements Store<AppState> {}

class MockDataRepository extends Mock implements DataRepository {}
