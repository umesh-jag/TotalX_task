import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_task/models/provider.dart';

class ListTileMy extends StatelessWidget {
  const ListTileMy({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        final users = userProvider.users;
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Container(
              margin: const EdgeInsets.all(12),
              // height: 80,
              // width: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                leading: CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(user.imageFile),
                ),
                title: Text(
                  user.name,
                  style: const TextStyle(fontSize: 25),
                ),
                subtitle: Text(
                  'Age: ${user.age}',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
