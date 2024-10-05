import 'package:bloc/bloc.dart';
import 'package:domi_labs_assignment/maps/cubit/maps_cubit.dart';
import 'package:domi_labs_assignment/utils/custom_marker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part './maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit() : super(MapsInitial());

  void loadMarker() async {
    emit(MapsLoading());
    try {
      final markerIcon = await ImageToMarker.getMarkerIcon(
          "lib/assets/marker-icon.jpg", const Size(64, 64));
      emit(MapsLoadedSuccess(marker: {
        Marker(
          markerId: const MarkerId("100_martinique_ave"),
          position: const LatLng(27.9085526, -82.4594368),
          icon: markerIcon,
        ),
      }, polygon: const {}));
    } catch (e) {
      return emit(MapsError(e.toString()));
    }
  }

  void onMapTapped(LatLng position) async {
    // if (state is MapsLoadedSuccess) {
    final markerIcon = await ImageToMarker.getMarkerIcon(
        "lib/assets/marker-icon.jpg", const Size(64, 64));
    emit(MapsLoadedSuccess(marker: {
      Marker(
        markerId: const MarkerId("100_martinique_ave"),
        position: const LatLng(27.9085526, -82.4594368),
        icon: markerIcon,
      ),
    }, polygon: const {}));
    final currentState = state as MapsLoadedSuccess;

    final newPolygons = {
      Polygon(
        polygonId: const PolygonId('tapped_area'),
        points: [
          LatLng(position.latitude + 0.0001, position.longitude - 0.0001),
          LatLng(position.latitude + 0.0001, position.longitude + 0.0001),
          LatLng(position.latitude - 0.0001, position.longitude + 0.0001),
          LatLng(position.latitude - 0.0001, position.longitude - 0.0001),
        ],
        fillColor: Colors.yellow.withOpacity(0.5),
        strokeColor: Colors.yellow,
        strokeWidth: 1,
      ),
    };
    return emit(
        MapsLoadedSuccess(polygon: newPolygons, marker: currentState.marker));
    // }
  }

  void onBottomDialogClosed() {
    return emit(BottomDialogClosed());
  }
}
