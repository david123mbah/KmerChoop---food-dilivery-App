import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:musicapp/components/delivercard_info.dart';
import 'package:musicapp/components/map_services.dart';
import 'package:provider/provider.dart';
import 'package:musicapp/utils/restuarant.dart';

class DeliveryMap extends StatefulWidget {
  
  const DeliveryMap({super.key});

  @override
  State<DeliveryMap> createState() => _DeliveryMapState();
}

class _DeliveryMapState extends State<DeliveryMap> {
  final MapService _mapService = MapService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateMap();
    });
  }

  void _updateMap() async {
    final restaurant = context.read<Restaurant>();
    await _mapService.updateRoute(restaurant.diliveryAddress); // Update the route based on the restaurant's delivery address
    setState(() {}); // Refresh the UI to show the updated markers and polylines
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: _mapService.currentLocation,
              zoom: 13,
            ),
            onMapCreated: _mapService.onMapCreated,
            polylines: Set<Polyline>.of(_mapService.polylines.values), // Draw the polyline on the map
            markers: _mapService.markers, // Display the markers
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.primary),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: DeliveryInfoCard(), // Your delivery info card widget
          ),
        ],
      ),
    );
  }
}



