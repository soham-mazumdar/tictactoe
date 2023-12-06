part of 'game_bloc.dart';

enum Player { o, x, non, draw }

class GameState extends Equatable {
  final List<String> displayExOh;
  final int player1Scrore;
  final int player2Scrore;
  final bool ohTurn;
  final int filledBoxes;
  final Player winner;

  const GameState({
    required this.displayExOh,
    required this.player1Scrore,
    required this.player2Scrore,
    required this.ohTurn,
    required this.filledBoxes,
    required this.winner,
  });
  factory GameState.initial() {
    return const GameState(
      displayExOh: ['', '', '', '', '', '', '', '', ''],
      filledBoxes: 0,
      ohTurn: true,
      player1Scrore: 0,
      player2Scrore: 0,
      winner: Player.non,
    );
  }

  @override
  List<Object?> get props => [
        displayExOh,
        player1Scrore,
        player2Scrore,
        ohTurn,
        filledBoxes,
        winner,
      ];

  GameState copyWith({
    List<String>? displayExOh,
    int? player1Scrore,
    int? player2Scrore,
    bool? ohTurn,
    int? filledBoxes,
    Player? winner,
  }) {
    return GameState(
      displayExOh: displayExOh ?? this.displayExOh,
      filledBoxes: filledBoxes ?? this.filledBoxes,
      ohTurn: ohTurn ?? this.ohTurn,
      player1Scrore: player1Scrore ?? this.player1Scrore,
      player2Scrore: player2Scrore ?? this.player2Scrore,
      winner: winner ?? this.winner,
    );
  }
}
