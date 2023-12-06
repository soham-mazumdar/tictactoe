import 'package:flutter/material.dart';
import 'package:tictactoe/theme/app_colors.dart';
import 'package:tictactoe/theme/app_text_style.dart';
import 'package:tictactoe/views/widgets/dialog_footer.dart';

class DrawDialog extends StatelessWidget {
  const DrawDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Container(
        height: 150,
        color: AppColors.bg,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'ITS A DRAW!!',
              style: AppTextStyle.text.copyWith(color: AppColors.primary),
            ),
            Text(
              'DO YOU WANNA KEEP THINGS UNSETTLED??',
              style: AppTextStyle.text.copyWith(color: AppColors.primary),
              textAlign: TextAlign.center,
            ),
            const DialogFooter()
          ],
        ),
      ),
    );
  }
}
