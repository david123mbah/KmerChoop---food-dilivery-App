import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:musicapp/utils/restuarant.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:musicapp/widgets/my_button.dart'; // Import the MyButton widget

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
            points: polylinePoints,  // Full route in red
          );
        });
      } else {
        print('Failed to load route');
      }
    } catch (e) {
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
        print("Error finding location: $e");
      }
    }
  }

  Future<String> _getAddressFromCoordinates(LatLng coordinates) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(coordinates.latitude, coordinates.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return "${place.street}, ${place.locality}, ${place.administrativeArea} ${place.postalCode}";
      }
    } catch (e) {
      print('Error fetching address: $e');
    }
    return "Unknown Address";
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const Text(
                        "Track Order",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  _buildDeliveryInfo(),
                  const SizedBox(height: 16),
                  MyButton(
                    text: "Order Details",
                    onTap: () {
                      // Implement order details action
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryInfo() {
    return FutureBuilder<String>(
      future: _getAddressFromCoordinates(_currentLocation),  // Replace with your saved current location
      builder: (context, snapshot) {
        final address = snapshot.data ?? "Fetching address...";
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0D2535),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Jonathon is near by",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.access_time, "Your Delivery Time", "12 Minutes"),
              const SizedBox(height: 8),
              _buildInfoRow(Icons.location_on, "Your Delivery Address", address),  // Updated address
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.green, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}
