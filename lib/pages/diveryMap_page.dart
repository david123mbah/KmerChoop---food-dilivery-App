import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:musicapp/utils/restuarant.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeliveryMap extends StatefulWidget {
  const DeliveryMap({super.key});

  @override
  State<DeliveryMap> createState() => _DeliveryMapState();
}

class _DeliveryMapState extends State<DeliveryMap> {
  final Completer<GoogleMapController> _controller = Completer();
  String _mapStyleString = '';
  final LatLng _currentLocation = const LatLng(3.866667, 11.516667); // Post Centrale, Yaounde, Cameroon
  LatLng _destinationLocation = const LatLng(3.866667, 11.516667); // Default same as current
  final Map<PolylineId, Polyline> _polylines = {};
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateMap();
    });
  }

  Future<void> _loadMapStyle() async {
    _mapStyleString = await rootBundle.loadString('lib/assets/images/map/map_styles.json');
  }

  Future<void> _setMapStyle(GoogleMapController controller) async {
    if (_mapStyleString.isNotEmpty) {
      // ignore: deprecated_member_use
      await controller.setMapStyle(_mapStyleString);
    }
  }

  Future<void> _getRoute(LatLng start, LatLng end) async {
    const apiKey = 'AIzaSyDS2FebHg8r3ewfdq8U5_REb0h22lFaLiE'; //actual API key
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
        setState(() {
          _polylines[const PolylineId('route-red')] = Polyline(
            polylineId: const PolylineId('route-red'),
            color: Colors.red,
            width: 5,
            points: polylinePoints.sublist(0, (polylinePoints.length / 2).floor()), // First half in red
          );
          _polylines[const PolylineId('route-green')] = Polyline(
            polylineId: const PolylineId('route-green'),
            color: Colors.green,
            width: 5,
            points: polylinePoints.sublist((polylinePoints.length / 2).ceil()), // Second half in green
          );
        });
      } else {
        // ignore: avoid_print
        print('Failed to load route');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching route: $e');
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polylinePoints = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;
      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;
      polylinePoints.add(LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble()));
    }
    return polylinePoints;
  }

  void _updateMap() async {
    final restaurant = context.read<Restaurant>();
    if (restaurant.diliveryAddress.isNotEmpty) {
      try {
        final locations = await locationFromAddress(restaurant.diliveryAddress);
        _destinationLocation = LatLng(locations.first.latitude, locations.first.longitude);

        final controller = await _controller.future;

        await _getRoute(_currentLocation, _destinationLocation);

        setState(() {
          _markers = {
            Marker(
              markerId: const MarkerId('start'),
              position: _currentLocation,
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            ),
            Marker(
              markerId: const MarkerId('end'),
              position: _destinationLocation,
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            ),
          };
        });

        // Adjust camera position and zoom
        await controller.animateCamera(CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(
              min(_currentLocation.latitude, _destinationLocation.latitude),
              min(_currentLocation.longitude, _destinationLocation.longitude),
            ),
            northeast: LatLng(
              max(_currentLocation.latitude, _destinationLocation.latitude),
              max(_currentLocation.longitude, _destinationLocation.longitude),
            ),
          ),
          50.0, // Padding
        ));

      } catch (e) {
        // ignore: avoid_print
        print("Error finding location: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Tracking .......")),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: 13,
        ),
        onMapCreated: (controller) {
          _controller.complete(controller);
          _setMapStyle(controller);
        },
        polylines: Set<Polyline>.of(_polylines.values),
        markers: _markers,
      ),
    );
  }
}
