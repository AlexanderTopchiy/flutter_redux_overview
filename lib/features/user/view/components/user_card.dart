import 'package:flutter/material.dart';
import 'package:flutter_redux_overview/features/user/model/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(user.name),
      ),
    );
  }
}
