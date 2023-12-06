import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/bloc/game_bloc.dart';
import 'package:tictactoe/theme/app_colors.dart';
import 'package:tictactoe/theme/app_text_style.dart';
import 'package:tictactoe/di/di.dart';
import 'package:tictactoe/views/widgets/draw_dialog.dart';
import 'package:tictactoe/views/widgets/win_dialog.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const DrawDialog();
        });
  }

  void _showWinDialog(String winner, String looser) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WinDialog(
            heading: '${winner.toUpperCase()} has won this round',
            subHeading: 'Wanna give $looser a chance to redeem their honor?',
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      bloc: getItInstance<GameBloc>(),
      listener: (context, state) {
        if (state.winner == Player.draw) {
          _showDrawDialog();
        } else if (state.winner != Player.non) {
          _showWinDialog(state.winner.name, state.winner == Player.x ? 'O' : 'X');
        }
      },
      builder: (context, gameState) {
        return Scaffold(
          backgroundColor: AppColors.bg,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: const Text('TicTacToe'),
            titleTextStyle: AppTextStyle.appBar,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                // text: gameState.player1Name == '' ? 'Player 1 : ' : '${gameState.player1Name} :',
                                text: 'Player O : ',
                              ),
                              TextSpan(
                                text: gameState.player1Scrore.toString(),
                              )
                            ],
                          ),
                          style: AppTextStyle.text,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                // text: gameState.player1Name == '' ? 'Player 2 : ' : '${gameState.player2Name} :',
                                text: 'Player X : ',
                              ),
                              TextSpan(
                                text: gameState.player2Scrore.toString(),
                              )
                            ],
                            style: AppTextStyle.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                        itemCount: 9,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              // todo : tapped
                              getItInstance<GameBloc>().add(CellTapped(index: index));
                              // _tapped(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.grey[700]!)),
                              child: Center(
                                child: Text(
                                  gameState.displayExOh[index],
                                  style: AppTextStyle.xAndO,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          getItInstance<GameBloc>().add(ResetBoard());
                        },
                        child: Text(
                          'Reset Board',
                          style: AppTextStyle.text.copyWith(color: AppColors.primary),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getItInstance<GameBloc>().add(ResetGame());
                        },
                        child: Text(
                          'Restart Game',
                          style: AppTextStyle.text.copyWith(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
