import 'package:flutter/material.dart';

const int count = 10;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, int index) {
        return ListTile(
          title: Text('Item: ${(index + 1)}'),
          leading: const Icon(Icons.percent),
          trailing: const Icon(Icons.select_all),
          onTap: () {
            
          },
        );
      },
    );
  }
}
