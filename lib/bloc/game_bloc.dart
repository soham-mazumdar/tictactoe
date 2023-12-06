import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {
    on<ResetBoard>((event, emit) {
      emit(
        state.copyWith(
          displayExOh: ['', '', '', '', '', '', '', '', ''],
          filledBoxes: 0,
          winner: Player.non,
          ohTurn: true,
        ),
      );
    });

    on<ResetGame>((event, emit) {
      emit(GameState.initial());
    });

    on<CellTapped>((event, emit) {
      if (state.ohTurn && state.displayExOh[event.index] == '') {
        final displayExOh = state.displayExOh.where((element) => true).toList();
        displayExOh[event.index] = 'o';
        emit(state.copyWith(
          filledBoxes: state.filledBoxes + 1,
          displayExOh: displayExOh,
          ohTurn: !state.ohTurn,
        ));
      } else if (!state.ohTurn && state.displayExOh[event.index] == '') {
        final displayExOh = state.displayExOh.where((element) => true).toList();
        displayExOh[event.index] = 'x';
        emit(state.copyWith(
          filledBoxes: state.filledBoxes + 1,
          displayExOh: displayExOh,
          ohTurn: !state.ohTurn,
        ));
      }

      add(CheckWinner());
    });

    on<CheckWinner>((event, emit) {
      // checks 1st row
      if (state.displayExOh[0] == state.displayExOh[1] &&
          state.displayExOh[0] == state.displayExOh[2] &&
          state.displayExOh[0] != '') {
        final winner = state.displayExOh[0] == 'o' ? Player.o : Player.x;
        final player1Scrore = state.displayExOh[0] == 'o' ? state.player1Scrore + 1 : null;
        final player2Scrore = state.displayExOh[0] != 'o' ? state.player2Scrore + 1 : null;
        emit(
          state.copyWith(
            winner: winner,
            player1Scrore: player1Scrore,
            player2Scrore: player2Scrore,
          ),
        );
      }

      // checks 2nd row
      if (state.displayExOh[3] == state.displayExOh[4] &&
          state.displayExOh[3] == state.displayExOh[5] &&
          state.displayExOh[3] != '') {
        emit(state.copyWith(
          winner: state.displayExOh[3] == 'o' ? Player.o : Player.x,
          player1Scrore: state.displayExOh[0] == 'o' ? state.player1Scrore + 1 : null,
          player2Scrore: state.displayExOh[0] != 'o' ? state.player2Scrore + 1 : null,
        ));
      }

      // checks 3rd row
      if (state.displayExOh[6] == state.displayExOh[7] &&
          state.displayExOh[6] == state.displayExOh[8] &&
          state.displayExOh[6] != '') {
        emit(state.copyWith(
          winner: state.displayExOh[6] == 'o' ? Player.o : Player.x,
          player1Scrore: state.displayExOh[0] == 'o' ? state.player1Scrore + 1 : null,
          player2Scrore: state.displayExOh[0] != 'o' ? state.player2Scrore + 1 : null,
        ));
      }

      // checks 1st column
      if (state.displayExOh[0] == state.displayExOh[3] &&
          state.displayExOh[0] == state.displayExOh[6] &&
          state.displayExOh[0] != '') {
        emit(state.copyWith(
          winner: state.displayExOh[0] == 'o' ? Player.o : Player.x,
          player1Scrore: state.displayExOh[0] == 'o' ? state.player1Scrore + 1 : null,
          player2Scrore: state.displayExOh[0] != 'o' ? state.player2Scrore + 1 : null,
        ));
      }

      // checks 2nd column
      if (state.displayExOh[1] == state.displayExOh[4] &&
          state.displayExOh[1] == state.displayExOh[7] &&
          state.displayExOh[1] != '') {
        emit(state.copyWith(
          winner: state.displayExOh[1] == 'o' ? Player.o : Player.x,
          player1Scrore: state.displayExOh[0] == 'o' ? state.player1Scrore + 1 : null,
          player2Scrore: state.displayExOh[0] != 'o' ? state.player2Scrore + 1 : null,
        ));
      }

      // checks 3rd column
      if (state.displayExOh[2] == state.displayExOh[5] &&
          state.displayExOh[2] == state.displayExOh[8] &&
          state.displayExOh[2] != '') {
        emit(state.copyWith(
          winner: state.displayExOh[2] == 'o' ? Player.o : Player.x,
          player1Scrore: state.displayExOh[0] == 'o' ? state.player1Scrore + 1 : null,
          player2Scrore: state.displayExOh[0] != 'o' ? state.player2Scrore + 1 : null,
        ));
      }

      // checks diagonal
      if (state.displayExOh[6] == state.displayExOh[4] &&
          state.displayExOh[6] == state.displayExOh[2] &&
          state.displayExOh[6] != '') {
        emit(state.copyWith(
          winner: state.displayExOh[6] == 'o' ? Player.o : Player.x,
          player1Scrore: state.displayExOh[0] == 'o' ? state.player1Scrore + 1 : null,
          player2Scrore: state.displayExOh[0] != 'o' ? state.player2Scrore + 1 : null,
        ));
      }

      // checks diagonal
      if (state.displayExOh[0] == state.displayExOh[4] &&
          state.displayExOh[0] == state.displayExOh[8] &&
          state.displayExOh[0] != '') {
        emit(state.copyWith(
          winner: state.displayExOh[0] == 'o' ? Player.o : Player.x,
          player1Scrore: state.displayExOh[0] == 'o' ? state.player1Scrore + 1 : null,
          player2Scrore: state.displayExOh[0] != 'o' ? state.player2Scrore + 1 : null,
        ));
      } else if (state.filledBoxes == 9) {
        emit(state.copyWith(winner: Player.draw));
      }
    });
  }
}
