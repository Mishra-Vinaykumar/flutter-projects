// lib/screens/registration_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final username = _usernameController.text;
                final password = _passwordController.text;
                final userProvider =
                    Provider.of<UserProvider>(context, listen: false);

                await userProvider.register(username, password);
                Navigator.pop(context);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
