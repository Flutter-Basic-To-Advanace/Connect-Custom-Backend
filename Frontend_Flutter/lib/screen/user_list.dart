import 'package:flutter/material.dart';
import 'package:frontend_flutter/provider/user_provider.dart';
import 'package:frontend_flutter/screen/add_user.dart';
import 'package:frontend_flutter/screen/edit_user.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddUserScreen()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, UserProvider, child) {
          if (UserProvider.users.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: UserProvider.users.length,
            itemBuilder: (context, index) {
              final user = UserProvider.users[index];

              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: IconButton(
                  onPressed: () {
                    UserProvider.deleteUser(user.id);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("User Deleted")));
                  },
                  icon: const Icon(Icons.delete),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditUser(user: user),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
