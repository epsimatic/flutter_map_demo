import 'package:flutter/material.dart';
import 'package:flutter_map_demo/page_map.dart';
import 'package:flutter_map_demo/state_app.dart';
import 'package:flutter_map_demo/widget_error_message.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (appState.error != "") ErrorMessage(title: appState.error),

            // TODO: Format as table
            const Text("Логин:"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => appState.username = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'email/username',
                ),
              ),
            ),

            const Text("Пароль:"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (value) => appState.password = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '********',
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                if (appState.login()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapPage()),
                  );
                }
              },
              child: Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
