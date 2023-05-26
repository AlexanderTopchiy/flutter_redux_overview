import 'package:flutter/material.dart';
import 'package:flutter_redux_overview/features/user/model/user.dart';
import 'package:flutter_redux_overview/features/user/view/components/user_card.dart';

class UserList extends StatelessWidget {
  final List<User> userList;

  const UserList({
    super.key,
    required this.userList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemBuilder: (_, index) {
        final item = UserCard(user: userList[index]);

        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(top: 24),
            child: item,
          );
        }

        if (index == userList.length - 1) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: item,
          );
        }

        return item;
      },
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: userList.length,
    );
  }
}
