import 'dart:async';

import 'package:domi_labs_assignment/maps/cubit/maps_cubit.dart';
import 'package:domi_labs_assignment/data/user_data_provider.dart';
import 'package:domi_labs_assignment/widgets/bottom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final Set<Marker> marker;
  final Set<Polygon> polygons;
  const MapView({
    super.key,
    required this.marker,
    required this.polygons,
  });

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(27.9085526, -82.4594368),
    zoom: 18.4746,
  );

  void onTap(LatLng position, BuildContext context) {
    context.read<MapsCubit>().onMapTapped(position);

    showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return const BottomDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      style: UserDataProvider.mapStyle,
      markers: widget.marker,
      polygons: widget.polygons,
      mapType: MapType.normal,
      onTap: (position) {
        onTap(position, context);
      },
      initialCameraPosition: initialPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
