import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/law/law_cubit.dart';
import 'package:kfahi/screens/law/law_state.dart';

import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/questions.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';

class LawScreen extends StatelessWidget {
  const LawScreen({super.key});

  static String id = 'LawScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LawCubit>(context);
    return BlocBuilder<LawCubit, LawState>(
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
                              S.of(context).law,
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
                                  docName: 'Administrative law',
                                  collageName: 'Law');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Civil law', collageName: 'Law');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'International law',
                                  collageName: 'Law');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Commercial law',
                                  collageName: 'Law');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Criminal law', collageName: 'Law');
                            } else if (index == 5) {
                              cubit.getDoneLecs(
                                  docName: 'Proceedings law',
                                  collageName: 'Law');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'القانون الادارى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'القانون المدنى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'القانون الدولى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'القانون التجارى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'القانون الجنائى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'قانون المرافعات',
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
                                testQuestions: AdministrativelawQuiz,
                                courseVids: AdministrativelawVids,
                                cubit: cubit,
                                courseName: 'Administrative law',
                              ),
                              LecNumbers(
                                testQuestions: civilLawQuestions,
                                courseVids: civilLawVids,
                                cubit: cubit,
                                courseName: 'Civil law',
                              ),
                              LecNumbers(
                                testQuestions: InternationallawQuestions,
                                courseVids: InternationallawVids,
                                cubit: cubit,
                                courseName: 'International law',
                              ),
                              LecNumbers(
                                testQuestions: CommerciallawQuestions,
                                courseVids: CommerciallawCORVids,
                                cubit: cubit,
                                courseName: 'Commercial law',
                              ),
                              LecNumbers(
                                testQuestions: CriminallawQuestions,
                                courseVids: CriminallawVids,
                                cubit: cubit,
                                courseName: 'Criminal law',
                              ),
                              LecNumbers(
                                testQuestions: ProceedingslawQuestions,
                                courseVids: ProceedingslawVids,
                                cubit: cubit,
                                courseName: 'Proceedings law',
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
