part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object?> get props => [];
}

class CellTapped extends GameEvent {
  const CellTapped({required this.index});

  @override
  List<Object?> get props => [index];
  final int index;
}

class CheckWinner extends GameEvent {}

class ResetBoard extends GameEvent {}

class ResetGame extends GameEvent {}
