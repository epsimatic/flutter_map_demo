import 'package:flutter/material.dart';
import 'package:glive_minimal/state_app.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    Widget body;
    if (!appState.isLoggedIn) {
      body = const Center(child: Text("Вы не авторизованы"));
    } else if (appState.savedPoints.isEmpty) {
      body = const Center(child: Text('Нет сохранённых точек'));
    } else {
      body = ListView.builder(
        itemCount: appState.savedPoints.length,
        itemBuilder: (context, index) {
          MapEntry entry = appState.savedPoints.entries.elementAt(index);
          return PointTile(point: entry, state: appState);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Список точек'),
      ),
      body: body,
    );
  }
}

class PointTile extends StatelessWidget {
  const PointTile({
    super.key,
    required this.point,
    required this.state,
  });

  final MapEntry point;
  final AppState state;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${point.key}'),
      subtitle: Text('${point.value.latitude}, ${point.value.longitude}'),
      trailing: ElevatedButton(
        child: const Text("Удалить"),
        onPressed: () {
          state.deleteItem(point.key);
        },
      ),
    );
  }
}
