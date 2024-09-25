import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/science/science_cubit.dart';
import 'package:kfahi/screens/science/science_state.dart';

import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/questions.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  static String id = 'ScienceScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ScienceCubit>(context);
    return BlocBuilder<ScienceCubit, ScienceState>(
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
              length: 8,
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
                              S.of(context).kindergarten,
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
                                  docName: 'Algebra', collageName: 'Science');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Statistics and applied mathematics',
                                  collageName: 'Science');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Geology', collageName: 'Science');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Introduction to computer science',
                                  collageName: 'Science');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Mathematics',
                                  collageName: 'Science');
                            } else if (index == 5) {
                              cubit.getDoneLecs(
                                  docName: 'Chemistry', collageName: 'Science');
                            } else if (index == 6) {
                              cubit.getDoneLecs(
                                  docName: 'Physics', collageName: 'Science');
                            } else if (index == 7) {
                              cubit.getDoneLecs(
                                  docName: 'Biology', collageName: 'Science');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'الجبر',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الاحصاءوالريضيات التطبيقية',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الجولوجيا',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'علوم الحاسب',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الرياضيات',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الكيمياء',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الفيزياء',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الاحباء',
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
                                testQuestions: AlgebraQuiz,
                                courseVids: AlgebraVids,
                                cubit: cubit,
                                courseName: 'Algebra',
                              ),
                              LecNumbers(
                                testQuestions:
                                    StatisticsAndAppliedMathematicsQuiz,
                                courseVids: StatisticsAndAppliedMathematicsVids,
                                cubit: cubit,
                                courseName:
                                    'Statistics and applied mathematics',
                              ),
                              LecNumbers(
                                testQuestions: GeologyQuiz,
                                courseVids: GeologyVids,
                                cubit: cubit,
                                courseName: 'Geology',
                              ),
                              LecNumbers(
                                testQuestions:
                                    IntroductionToComputerScienceQuiz,
                                courseVids: IntroductionToComputerScienceVids,
                                cubit: cubit,
                                courseName: 'Introduction to computer science',
                              ),
                              LecNumbers(
                                testQuestions: MathematicsQuiz,
                                courseVids: MathematicsVids,
                                cubit: cubit,
                                courseName: 'Mathematics',
                              ),
                              LecNumbers(
                                testQuestions: ChemistryQuiz,
                                courseVids: ChemistryVids,
                                cubit: cubit,
                                courseName: 'Chemistry',
                              ),
                              LecNumbers(
                                testQuestions: PhysicsQuiz,
                                courseVids: PhysicsVids,
                                cubit: cubit,
                                courseName: 'Physics',
                              ),
                              LecNumbers(
                                testQuestions: BiologyQuiz,
                                courseVids: BiologyVids,
                                cubit: cubit,
                                courseName: 'Biology',
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
