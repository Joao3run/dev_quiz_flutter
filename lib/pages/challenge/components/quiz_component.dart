import 'package:dev_quiz_flutter/core/app_text_styles.dart';
import 'package:dev_quiz_flutter/pages/challenge/components/awnser_component.dart';
import 'package:dev_quiz_flutter/shared/models/answer_model.dart';
import 'package:dev_quiz_flutter/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizComponent extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizComponent(
      {Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizComponentState createState() => _QuizComponentState();
}

class _QuizComponentState extends State<QuizComponent> {
  int indexSelected = -1;
  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.question.title, style: AppTextStyles.heading),
          ),
          SizedBox(height: 20),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerComponent(
              answer: answer(i),
              isSelected: indexSelected == i,
              disabled: indexSelected != -1,
              onTap: (value) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((_) => widget.onSelected(value));
              },
            ),
        ],
      ),
    );
  }
}
