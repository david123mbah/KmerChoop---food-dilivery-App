import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapService {
  final LatLng currentLocation = const LatLng(3.866667, 11.516667);
  LatLng destinationLocation = const LatLng(3.866667, 11.516667);
  final Map<PolylineId, Polyline> polylines = {};
  Set<Marker> markers = {};

  Future<void> onMapCreated(GoogleMapController controller) async {
    String mapStyle = await rootBundle.loadString('lib/assets/images/map/map_styles.json');
    await controller.setMapStyle(mapStyle);
  }

  Future<void> updateRoute(String address) async {
    if (address.isNotEmpty) {
      try {
        final locations = await locationFromAddress(address);
        destinationLocation = LatLng(locations.first.latitude, locations.first.longitude);
        await _getRoute(currentLocation, destinationLocation);
        _updateMarkers();
      } catch (e) {
        print("Error finding location: $e");
      }
    }
  }

  Future<void> _getRoute(LatLng start, LatLng end) async {
    final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY']; // Replace with your API key
    final url = 'https://maps.googleapis.com/maps/api/directions/json'
        '?origin=${start.latitude},${start.longitude}'
        '&destination=${end.latitude},${end.longitude}'
        '&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final route = data['routes'][0]['overview_polyline']['points'];
        final polylinePoints = _decodePolyline(route);
        
        polylines[PolylineId('route')] = Polyline(
          polylineId: PolylineId('route'),
          color: Colors.green,
          width: 5,
          points: polylinePoints,
        );
      }
    } catch (e) {
      print('Error fetching route: $e');
    }
  }

  void _updateMarkers() {
    markers = {
       Marker(
        markerId: MarkerId('start'),
        position: LatLng(3.866667, 11.516667), // Use the currentLocation directly
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
      Marker(
        markerId: const MarkerId('end'),
        position: destinationLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    };
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63; 
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result >> 1) ^ (~(result >> 1) << 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result >> 1) ^ (~(result >> 1) << 1));
      lng += dlng;

      polyline.add(LatLng((lat / 1E5), (lng / 1E5)));
    }
    return polyline;
  }
}