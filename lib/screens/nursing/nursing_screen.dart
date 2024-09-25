import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/nursing/nursing_state.dart';

import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/questions.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';
import 'nursing_cubit.dart';

class NursingScreen extends StatelessWidget {
  const NursingScreen({super.key});

  static String id = 'NursingScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NursingCubit>(context);
    return BlocBuilder<NursingCubit, NursingState>(
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
                              S.of(context).nursing,
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
                                  docName: 'Nursing Fundamentals',
                                  collageName: 'Nursing');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Critical Care Nursing',
                                  collageName: 'Nursing');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Internal Surgical Nursing',
                                  collageName: 'Nursing');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Community Health Nursing',
                                  collageName: 'Nursing');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'اساسيات التمريض',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'تمريض الحالات الحرجة',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'تمريض باطنى جراحى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'تمريض صحة المجتمع',
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
                                testQuestions: NursingFundamentalsQuiz,
                                courseVids: NursingFundamentalsVids,
                                cubit: cubit,
                                courseName: 'Nursing Fundamentals',
                              ),
                              LecNumbers(
                                testQuestions: criticalCareNursingQuiz,
                                courseVids: criticalCareNursingVids,
                                cubit: cubit,
                                courseName: 'Critical Care Nursing',
                              ),
                              LecNumbers(
                                testQuestions: InternalsurgicalnursingQuiz,
                                courseVids: InternalsurgicalnursingVids,
                                cubit: cubit,
                                courseName: 'Internal Surgical Nursing',
                              ),
                              LecNumbers(
                                testQuestions: communityHealthNursingQuiz,
                                courseVids: communityHealthNursingVids,
                                cubit: cubit,
                                courseName: 'Community Health Nursing',
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
