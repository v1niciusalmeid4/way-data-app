part of 'character_bloc.dart';

abstract class CharacterEvent {}

class CharacterReadyEvent extends CharacterEvent {
  final int id;

  CharacterReadyEvent({required this.id});
}

class CharacterOpenLocationEvent extends CharacterEvent {
  final String name;

  CharacterOpenLocationEvent({required this.name});
}

class CharacterBackHomeEvent extends CharacterEvent {}

class CharacterReloadEvent extends CharacterEvent {}
