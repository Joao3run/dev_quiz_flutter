import 'package:dev_quiz_flutter/core/app_colors.dart';
import 'package:dev_quiz_flutter/core/app_text_styles.dart';
import 'package:dev_quiz_flutter/pages/home/components/chart_component.dart';
import 'package:flutter/material.dart';

class ScoreCardComponent extends StatelessWidget {
  final double percent;
  const ScoreCardComponent({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ChartComponent(percent: percent),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Let\'s start',
                        style: AppTextStyles.heading,
                      ),
                      Text(
                        'Complete challenges and advance knowledge :)',
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
