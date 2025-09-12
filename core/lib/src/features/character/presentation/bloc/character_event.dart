part of 'character_bloc.dart';

abstract class CharacterEvent {}

class CharacterReadyEvent extends CharacterEvent {
  final int id;

  CharacterReadyEvent({required this.id});
}
