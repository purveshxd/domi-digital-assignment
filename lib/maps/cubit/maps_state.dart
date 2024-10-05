// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'maps_cubit.dart';

@immutable
sealed class MapsState {}

sealed class MapsActionState extends MapsState {}

final class MapsInitial extends MapsState {}

final class MapsLoading extends MapsState {}

class MapsLoadedSuccess extends MapsState {
  final Set<Marker> marker;
  final Set<Polygon> polygon;

  MapsLoadedSuccess({required this.polygon, required this.marker});
}

final class MapsError extends MapsState {
  final String error;

  MapsError(this.error);
}

final class BottomDialogOpened extends MapsActionState {}

final class BottomDialogClosed extends MapsActionState {}
