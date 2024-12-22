import 'package:flutter/material.dart';
import 'package:glive_minimal/state_app.dart';
import 'package:glive_minimal/widget_boxed_display.dart';
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
            if (appState.error != "") BoxedDisplay(title: appState.error),

            // TODO: Format as table
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Text("Логин"),
            //     const SizedBox(width: 10),
            //     Text("LOGIN"),
            //   ],
            // ),

            const Text("Логин:"),
            TextField(
              onChanged: (value) => appState.username = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'email/username',
              ),
            ),

            const Text("Пароль:"),
            TextField(
              onChanged: (value) => appState.password = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '********',
              ),
            ),

            ElevatedButton(
              onPressed: () {
                appState.login();
              },
              child: Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
