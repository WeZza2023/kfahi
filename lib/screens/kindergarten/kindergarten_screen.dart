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
import 'kindergarten_cubit.dart';
import 'kindergarten_state.dart';

class KindergartenScreen extends StatelessWidget {
  const KindergartenScreen({super.key});

  static String id = 'KindergartenScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<KindergartenCubit>(context);
    return BlocBuilder<KindergartenCubit, KindergartenState>(
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
                                  docName: 'Psychology kids',
                                  collageName: 'Kindergarten');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Measurement and evaluation',
                                  collageName: 'Kindergarten');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Montessori geography',
                                  collageName: 'Kindergarten');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Montessori',
                                  collageName: 'Kindergarten');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName:
                                      'Early childhood and early education',
                                  collageName: 'Kindergarten');
                            } else if (index == 5) {
                              cubit.getDoneLecs(
                                  docName: 'Preparation of language',
                                  collageName: 'Kindergarten');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'علم النفس',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'القياس والتقويم',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'جغرافيا المنتيسورى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'منتيسورى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الطفولة المبكرة والتعليم المبكر',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'علم النفس اللغوى',
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
                                testQuestions: psychologyQuestions,
                                courseVids: psychologyKidsVids,
                                cubit: cubit,
                                courseName: 'Psychology kids',
                              ),
                              LecNumbers(
                                testQuestions:
                                    MeasurementandevaluationQuestions,
                                courseVids: MeasurementandevaluationVids,
                                cubit: cubit,
                                courseName: 'Measurement and evaluation',
                              ),
                              LecNumbers(
                                testQuestions: MontessorigeographyQuestions,
                                courseVids: MontessorigeographyVids,
                                cubit: cubit,
                                courseName: 'Montessori geography',
                              ),
                              LecNumbers(
                                testQuestions: MontessoriQuestions,
                                courseVids: MontessoriVids,
                                cubit: cubit,
                                courseName: 'Montessori',
                              ),
                              LecNumbers(
                                testQuestions:
                                    EarlychildhoodandearlyeducationQuestions,
                                courseVids: EarlychildhoodandearlyeducationVids,
                                cubit: cubit,
                                courseName:
                                    'Early childhood and early education',
                              ),
                              LecNumbers(
                                testQuestions: PsychologyOfLanguageQuiz,
                                courseVids: PsychologyOfLanguageVids,
                                cubit: cubit,
                                courseName: 'Preparation of language',
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
