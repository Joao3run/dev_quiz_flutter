import 'package:dev_quiz_flutter/core/app_gradients.dart';
import 'package:dev_quiz_flutter/core/app_text_styles.dart';
import 'package:dev_quiz_flutter/pages/home/components/score_card_component.dart';
import 'package:dev_quiz_flutter/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class AppBarComponent extends PreferredSize {
  final UserModel user;

  AppBarComponent({required this.user})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Hello, ',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                                text: user.name,
                                style: AppTextStyles.titleBold),
                          ],
                        ),
                      ),
                      Container(
                        height: 58,
                        width: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(user.photoUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardComponent(percent: user.score / 100),
                ),
              ],
            ),
          ),
        );
}
