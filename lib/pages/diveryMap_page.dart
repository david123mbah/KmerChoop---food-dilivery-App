import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class DiiveyMap extends StatefulWidget {
  const DiiveyMap({super.key});

  @override
  State<DiiveyMap> createState() => _DiiveyMapState();
}

class _DiiveyMapState extends State<DiiveyMap> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(7.369722, 12.354722),
    zoom: 11.5,
  );

  String _mapStyleString = '';

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  Future<void> _loadMapStyle() async {
    _mapStyleString = await rootBundle.loadString('lib/assets/images/map/map_styles.json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Tracking Food")),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _setMapStyle(controller);
        },
      ),
    );
  }

  Future<void> _setMapStyle(GoogleMapController controller) async {
    if (_mapStyleString.isNotEmpty) {
      await controller.setMapStyle(_mapStyleString);
    }
  }
}

