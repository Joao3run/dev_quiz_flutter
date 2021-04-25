import 'package:dev_quiz_flutter/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorComponent extends StatelessWidget {
  final double value;

  const ProgressIndicatorComponent({Key? key, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
