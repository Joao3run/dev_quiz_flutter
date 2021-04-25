import 'package:dev_quiz_flutter/core/app_text_styles.dart';
import 'package:dev_quiz_flutter/shared/components/progress_indicator_component.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorComponent extends StatelessWidget {
  final int currentPage;
  final int length;

  const QuestionIndicatorComponent({
    Key? key,
    required this.currentPage,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Question $currentPage', style: AppTextStyles.body),
              Text('of $length', style: AppTextStyles.body),
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorComponent(value: currentPage / length),
        ],
      ),
    );
  }
}
