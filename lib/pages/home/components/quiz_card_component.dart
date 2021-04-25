import 'package:dev_quiz_flutter/core/app_colors.dart';
import 'package:dev_quiz_flutter/core/app_text_styles.dart';
import 'package:dev_quiz_flutter/shared/components/progress_indicator_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizCardComponent extends StatelessWidget {
  final String image;
  final String title;
  final String completed;
  final double percent;
  final VoidCallback onTap;

  const QuizCardComponent({
    Key? key,
    required this.image,
    required this.title,
    required this.completed,
    required this.percent,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(image),
            ),
            SizedBox(height: 14),
            Text(title, style: AppTextStyles.heading15),
            SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(completed, style: AppTextStyles.body11),
                ),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorComponent(value: percent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
