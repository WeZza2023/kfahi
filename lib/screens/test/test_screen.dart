import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/components/components.dart';
import 'package:kfahi/constants/colors.dart';
import 'package:kfahi/constants/custom_texts.dart';
import 'package:kfahi/constants/size.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/test/test_cubit.dart';
import 'package:kfahi/screens/test/test_state.dart';
import 'package:kfahi/screens/video/video_cubit.dart';

import '../../generated/l10n.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  static String id = 'TestScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TestCubit>(context);
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) => Scaffold(
        appBar: CustomAppBar(
          context: context,
          title: 'اختبار',
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (cubit.result == true)
                  Column(
                    children: [
                      BodyMediumText(
                        cubit.resultMessage,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ).bP25,
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          cubit.clear();
                        },
                        child: const Text('حسنًا'),
                      ),
                    ],
                  ),
                if (cubit.selectedQuestions.isNotEmpty &&
                    cubit.currentQuestionIndex < cubit.selectedQuestions.length)
                  BodyMediumText(
                    cubit.selectedQuestions[cubit.currentQuestionIndex]
                        ['question'],
                    maxLines: 8,
                    textAlign: TextAlign.center,
                  ).bp(AppSizes.getBaseScale(context) * 25),
                if (cubit.remainingTimeInSeconds > 0 &&
                    cubit.remainingTimeInSeconds != 90)
                  BodyMediumText(
                    '${S.of(context).remaining_time} : ${cubit.remainingTimeInSeconds} ${S.of(context).seconds}',
                    maxLines: 2,
                    color: kActiveColor,
                    textAlign: TextAlign.center,
                  ),
                if (cubit.remainingTimeInSeconds > 0 &&
                    cubit.selectedQuestions.isNotEmpty &&
                    cubit.currentQuestionIndex < cubit.selectedQuestions.length)
                  Column(
                    children: List.generate(
                      cubit
                          .selectedQuestions[cubit.currentQuestionIndex]
                              ['options']
                          .length,
                      (index) {
                        return ElevatedButton(
                          onPressed: () {
                            cubit.checkAnswer(index);
                          },
                          style: ElevatedButton.styleFrom(
                              surfaceTintColor: kBackgroundColor,
                              overlayColor: kActiveColor,
                              splashFactory: InkSplash.splashFactory),
                          child: BodyMediumText(
                            cubit.selectedQuestions[cubit.currentQuestionIndex]
                                ['options'][index],
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ).bP8;
                      },
                    ),
                  ).tp(AppSizes.getBaseScale(context) * 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
