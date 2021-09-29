import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_clone/componets/circle_button.dart';
import 'package:uber_clone/componets/map_page_drawer.dart';
import 'package:uber_clone/componets/rider_panel.dart';
import 'package:uber_clone/services/map_client.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();

  static const route = '/map';
}

class _MapPageState extends State<MapPage> {
  bool _showPanel = true;
  double _panelHeight = 325.0;

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(35.652832, 139.839478),
    zoom: 14.4746,
  );

  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Position? currentPosition;
  var geoLocator = Geolocator();

  void _setCurentLocation() async {
    if (currentPosition == null) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      currentPosition = position;
    }
    LatLng newPosition =
        LatLng(currentPosition!.latitude, currentPosition!.longitude);
    _updateCameraPosition(latlng: newPosition);
  }

  void _updateCameraPosition({required LatLng latlng}) {
    CameraPosition cameraPosition = CameraPosition(target: latlng, zoom: 14.0);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void _fetchAddress(Position? position) async {
    final address = await MapClient.searchCoordinateAddress(position);
    if (address != null) {
      print(address);
    }
  }

  void _toggleIsShowPanel() {
    _fetchAddress(currentPosition);
    // setState(() {
    //   if (_showPanel) {
    //     _showPanel = false;
    //   } else {
    //     _showPanel = true;
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MapPageDrawer(),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: _showPanel ? -_panelHeight : 0,
            left: 0,
            right: 0,
            bottom: _showPanel ? 0 : -_panelHeight,
            child: _buildGoogleMap(),
          ),
          Positioned(
            top: 80.0,
            left: 20,
            child: CircleButton(
              onPressed: () => _scaffoldKey.currentState!.openDrawer(),
              icon: Icons.menu,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom: _showPanel ? 0 : -_panelHeight,
            child: RiderPanel(),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: _showPanel ? -30.0 + _panelHeight : 20,
            right: 10.0,
            child: Row(
              children: [
                CircleButton(
                    onPressed: _setCurentLocation, icon: Icons.my_location),
                SizedBox(
                  width: 22.0,
                ),
                CircleButton(
                    onPressed: _toggleIsShowPanel,
                    icon: _showPanel ? Icons.close : Icons.arrow_upward),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GoogleMap _buildGoogleMap() {
    return GoogleMap(
      // 初期表示される位置情報を現在位置から設定
      initialCameraPosition: _initialPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        newGoogleMapController = controller;
        _setCurentLocation();
      },
      // 現在位置にアイコン（青い円形のやつ）を置く
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: true,
      zoomGesturesEnabled: true,
    );
  }
}
