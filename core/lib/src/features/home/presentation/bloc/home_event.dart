part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeReadyEvent extends HomeEvent {
  final String query;

  HomeReadyEvent({this.query = ''});
}

class HomeLoadMoreEvent extends HomeEvent {
  final String query;

  HomeLoadMoreEvent({this.query = ''});
}
