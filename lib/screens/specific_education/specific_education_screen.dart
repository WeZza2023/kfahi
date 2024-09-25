import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/specific_education/specific_education_cubit.dart';
import 'package:kfahi/screens/specific_education/specific_education_state.dart';

import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/questions.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';

class SpecificEducationScreen extends StatelessWidget {
  const SpecificEducationScreen({super.key});

  static String id = 'SpecificEducationScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SpecificEducationCubit>(context);
    return BlocBuilder<SpecificEducationCubit, SpecificEducationState>(
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: AppSizes.getScreenHeight(context),
                  width: AppSizes.getScreenWidth(context) * 0.5,
                  color: kBackgroundColor,
                ),
                Container(
                  height: AppSizes.getScreenHeight(context),
                  width: AppSizes.getScreenWidth(context) * 0.5,
                  color: kMainColor,
                ),
              ],
            ),
            DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  Container(
                    height: AppSizes.getScreenHeight(context) * 0.2,
                    width: AppSizes.getScreenWidth(context),
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(
                              AppSizes.getBaseScale(context) * 80)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: AppSizes.getBaseScale(context) * 20,
                              color: Colors.transparent,
                            ).hP16,
                            BodyLargeText(
                              S.of(context).specific_education,
                              color: kBackgroundColor,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: AppSizes.getBaseScale(context) * 20,
                                color: Colors.white,
                              ).hP16,
                            ),
                          ],
                        ),
                        AppTapBar(
                          context: context,
                          onTap: (index) {
                            cubit.changeTabIndex(currentTab: index);
                            if (index == 0) {
                              cubit.getDoneLecs(
                                  docName: 'Pottery making',
                                  collageName: 'Specific Education');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Specific education Psychology',
                                  collageName: 'Specific Education');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Educational technology',
                                  collageName: 'Specific Education');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Philosophy and principles',
                                  collageName: 'Specific Education');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'كيف اصنع فخار',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'علم النفس',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'مقرر تكونولوجيا التعلي',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'مبادئ الفلسفه',
                              color: kBackgroundColor,
                            ).p4,
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: AppSizes.getScreenHeight(context) * 0.8,
                    width: AppSizes.getScreenWidth(context),
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(
                          AppSizes.getBaseScale(context) * 80,
                        ),
                      ),
                    ),
                    child: state is GetCourseLoadingState
                        ? AppLoadingIndicator(context: context)
                        : TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              LecNumbers(
                                testQuestions: PotteryMakingQuiz,
                                courseVids: PotteryMakingVids,
                                cubit: cubit,
                                courseName: 'Pottery making',
                              ),
                              LecNumbers(
                                testQuestions: PsychologyCourseQuiz,
                                courseVids: PsychologyCourseVids,
                                cubit: cubit,
                                courseName: 'Specific education Psychology',
                              ),
                              LecNumbers(
                                testQuestions: EducationalTechnologyQuiz,
                                courseVids: EducationalTechnologyVids,
                                cubit: cubit,
                                courseName: 'Educational technology',
                              ),
                              LecNumbers(
                                testQuestions: PhilosophyPrinciplesQuiz,
                                courseVids: PhilosophyPrinciplesVids,
                                cubit: cubit,
                                courseName: 'Philosophy and principles',
                              ),
                            ],
                          ).tP25.hP16,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
