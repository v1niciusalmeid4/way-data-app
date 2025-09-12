part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeReadyEvent extends HomeEvent {
  final String query;
  final CharacterGender? gender;
  final CharacterStatus? status;

  HomeReadyEvent({this.query = '', this.gender, this.status});
}

class HomeLoadMoreEvent extends HomeEvent {
  final String query;
  final CharacterGender? gender;
  final CharacterStatus? status;

  HomeLoadMoreEvent({this.query = '', this.gender, this.status});
}

class HomeOpenCharacterEvent extends HomeEvent {
  final int id;

  HomeOpenCharacterEvent({required this.id});
}

class HomeReloadEvent extends HomeEvent {}
