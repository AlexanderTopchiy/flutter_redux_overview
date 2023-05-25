import 'package:flutter_redux_overview/app/app_state.dart';
import 'package:flutter_redux_overview/features/post/redux/post_reducer.dart';
import 'package:flutter_redux_overview/features/user/redux/user_reducer.dart';

AppState appReducer(AppState state, action) => AppState(
      userState: userReducer(state.userState, action),
      postState: postReducer(state.postState, action),
    );
