import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';

import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/questions.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';
import 'engineering_cubit.dart';
import 'engineering_state.dart';

class EngineeringScreen extends StatelessWidget {
  const EngineeringScreen({super.key});

  static String id = 'EngineeringScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<EngineeringCubit>(context);
    return BlocBuilder<EngineeringCubit, EngineeringState>(
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
              length: 6,
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
                              S.of(context).pharmacy,
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
                                  docName: 'Engineering drawing',
                                  collageName: 'Engineering');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Automechanics',
                                  collageName: 'Engineering');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Architectural design',
                                  collageName: 'Engineering');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Communications engineering',
                                  collageName: 'Engineering');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Road and airport engineering',
                                  collageName: 'Engineering');
                            } else if (index == 5) {
                              cubit.getDoneLecs(
                                  docName: 'Civil engineering technology',
                                  collageName: 'Engineering');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'الرسم الهندسى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'ميكانيكا السيارات',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'التصميم المعمارى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'هندسة الاتصالات',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'هندسة الطرق والمطارات',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'تكونولوجية الهندسة المدنيه',
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
                                testQuestions: EngineeringdrawingQuiz,
                                courseVids: EngineeringdrawingVids,
                                cubit: cubit,
                                courseName: 'Engineering drawing',
                              ),
                              LecNumbers(
                                testQuestions: AutomechanicsQuiz,
                                courseVids: AutomechanicsVids,
                                cubit: cubit,
                                courseName: 'Automechanics',
                              ),
                              LecNumbers(
                                testQuestions: ArchitecturaldesignQuiz,
                                courseVids: ArchitecturaldesignVids,
                                cubit: cubit,
                                courseName: 'Architectural design',
                              ),
                              LecNumbers(
                                testQuestions: CommunicationsengineeringQuiz,
                                courseVids: CommunicationsengineeringVids,
                                cubit: cubit,
                                courseName: 'Communications engineering',
                              ),
                              LecNumbers(
                                testQuestions: RoadandairportengineeringQuiz,
                                courseVids: RoadandairportengineeringVids,
                                cubit: cubit,
                                courseName: 'Road and airport engineering',
                              ),
                              LecNumbers(
                                testQuestions: CivilengineeringtechnologyQuiz,
                                courseVids: CivilengineeringtechnologyVids,
                                cubit: cubit,
                                courseName: 'Civil engineering technology',
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
