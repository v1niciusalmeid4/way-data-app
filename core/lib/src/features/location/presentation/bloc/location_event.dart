part of 'location_bloc.dart';

abstract class LocationEvent {}

class LocationReadyEvent extends LocationEvent {}

class LocationBackEvent extends LocationEvent {}

class LocationReloadEvent extends LocationEvent {}
