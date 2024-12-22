import 'package:flutter/material.dart';
import 'package:glive_minimal/state_app.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    if (!appState.isLoggedIn) return const Placeholder(color: Colors.red,);
    
    return Scaffold(
      body: 
        appState.savedItems.isEmpty ? 
          Center(child: Text('Нет сохранённых точек')) :
          ListView.builder(
              itemCount: appState.savedItems.length,
              itemBuilder: (context, index) {
                var savedItem = appState.savedItems[index];
                return Text(savedItem);
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.pop(context);          
        },
        tooltip: 'Назад',
        child: const Icon(Icons.arrow_back)
      ),
    );
  }
}
