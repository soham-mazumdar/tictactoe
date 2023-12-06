import 'package:flutter/material.dart';
import 'package:tictactoe/theme/app_colors.dart';
import 'package:tictactoe/theme/app_text_style.dart';
import 'package:tictactoe/views/widgets/dialog_footer.dart';

class WinDialog extends StatelessWidget {
  const WinDialog({
    super.key,
    required this.heading,
    required this.subHeading,
  });

  final String heading;
  final String subHeading;

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
              heading,
              style: AppTextStyle.text.copyWith(color: AppColors.primary),
            ),
            Text(
              subHeading,
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
