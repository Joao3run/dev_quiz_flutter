import 'package:dev_quiz_flutter/core/app_colors.dart';
import 'package:dev_quiz_flutter/pages/challenge/changelle_page.dart';
import 'package:dev_quiz_flutter/pages/home/components/app_bar_component.dart';
import 'package:dev_quiz_flutter/pages/home/components/level_button_component.dart';
import 'package:dev_quiz_flutter/pages/home/components/quiz_card_component.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';

import 'home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarComponent(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 32,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      LevelButtonComponent(
                        label: 'Easy',
                        color: AppColors.levelButtonEasy,
                        borderColor: AppColors.levelButtonBorderEasy,
                        fontColor: AppColors.levelButtonTextEasy,
                      ),
                      SizedBox(width: 10),
                      LevelButtonComponent(
                        label: 'Middle',
                        color: AppColors.levelButtonMiddle,
                        borderColor: AppColors.levelButtonBorderMiddle,
                        fontColor: AppColors.levelButtonTextMiddle,
                      ),
                      SizedBox(width: 10),
                      LevelButtonComponent(
                        label: 'Hard',
                        color: AppColors.levelButtonHard,
                        borderColor: AppColors.levelButtonBorderHard,
                        fontColor: AppColors.levelButtonTextHard,
                      ),
                      SizedBox(width: 10),
                      LevelButtonComponent(
                        label: 'Expert',
                        color: AppColors.levelButtonExpert,
                        borderColor: AppColors.levelButtonBorderExpert,
                        fontColor: AppColors.levelButtonTextExpert,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map(
                        (e) => QuizCardComponent(
                          title: e.title,
                          completed:
                              '${e.questionAnswered}/${e.questions.length}',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChallengePage(
                                    title: e.title,
                                    questions: e.questions,
                                  ),
                                ));
                          },
                          percent: e.questionAnswered / e.questions.length,
                          image: e.image,
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
