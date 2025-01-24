import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_demo/page_list.dart';
import 'package:flutter_map_demo/state_app.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    Widget body;
    if (!appState.isLoggedIn) {
      body = const Center(child: Text("Вы не авторизованы"));
    } else {
      var map = MapWidget();
      body = Stack(
        children: [
          map,
          Positioned(
            top: 16,
            right: 16,
            bottom: 16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  icon: const Icon(Icons.add_location, semanticLabel: "Добавить точку"),
                  tooltip: "Добавить точку",
                  onPressed: () {
                    appState.addItem(map.getPoint());
                  },
                ),
                SizedBox(height: 16),
                IconButton.filled(
                  icon: Icon(Icons.list),
                  tooltip: "Список точек",
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListPage()),
                  );
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: body,
    );
  }
}

class MapWidget extends StatelessWidget {
  MapWidget({super.key});
  final _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    List<Marker> allMarkers = [];
    var appState = context.watch<AppState>();
    var center = LatLng(56.838248, 60.606589);
    for(var i=0; i < appState.savedPoints.length; i++) {
      var point = appState.savedPoints.entries.elementAt(i);
      allMarkers.add(Marker(
        point: point.value,
        height: 80,
        width: 100,
        child: Column(
          children: [
            Text(point.key),
            Icon(Icons.location_pin),
          ],
        ),
       ));
    }
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        // keepAlive: true,
        initialCenter: center,
        initialZoom: 15,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        MarkerLayer(
          markers: allMarkers,
        ),
      ],
    );
  }

  LatLng getPoint() => _mapController.camera.center;
}
