import 'package:flutter/material.dart';
import 'package:tictactoe/bloc/game_bloc.dart';
import 'package:tictactoe/theme/app_colors.dart';
import 'package:tictactoe/theme/app_text_style.dart';
import 'package:tictactoe/di/di.dart';

class DialogFooter extends StatelessWidget {
  const DialogFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.text), borderRadius: BorderRadius.circular(5)),
            child: Text(
              'Reset Game',
              style: AppTextStyle.text.copyWith(color: AppColors.primary),
            ),
          ),
          onTap: () {
            getItInstance<GameBloc>().add(ResetGame());
            Navigator.of(context).pop();
          },
        ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.text), borderRadius: BorderRadius.circular(5)),
            child: Text(
              'Play Again!',
              style: AppTextStyle.text.copyWith(color: AppColors.primary),
            ),
          ),
          onTap: () {
            getItInstance<GameBloc>().add(ResetBoard());
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
