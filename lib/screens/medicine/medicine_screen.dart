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
import 'medicine_cubit.dart';
import 'medicine_state.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  static String id = 'MedicineScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MedicineCubit>(context);
    return BlocBuilder<MedicineCubit, MedicineState>(
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
                              S.of(context).medicine,
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
                                  docName: 'Anatomy', collageName: 'Medicine');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Medical terminology',
                                  collageName: 'Medicine');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Biochemistry',
                                  collageName: 'Medicine');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Ophthalmology',
                                  collageName: 'Medicine');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'psychology',
                                  collageName: 'Medicine');
                            } else if (index == 5) {
                              cubit.getDoneLecs(
                                  docName: 'pediatrics',
                                  collageName: 'Medicine');
                            } else if (index == 6) {
                              cubit.getDoneLecs(
                                  docName: 'immunity', collageName: 'Medicine');
                            } else if (index == 7) {
                              cubit.getDoneLecs(
                                  docName: 'Ear, nose and throat',
                                  collageName: 'Medicine');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'التشريح',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'المصطلحات الطبية',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الكيمياء الحيوية',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'طب العيون',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'علم النفس السلوكى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'طب الاطفال',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'علم المناعه',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الانف والاذن والحنجرة',
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
                                testQuestions: AnatomyQuiz,
                                courseVids: AnatomyVids,
                                cubit: cubit,
                                courseName: 'Anatomy',
                              ),
                              LecNumbers(
                                testQuestions: MedicalterminologyQuiz,
                                courseVids: MedicalterminologyVids,
                                cubit: cubit,
                                courseName: 'Medical terminology',
                              ),
                              LecNumbers(
                                testQuestions: BiochemistryQuiz,
                                courseVids: BiochemistryVids,
                                cubit: cubit,
                                courseName: 'Biochemistry',
                              ),
                              LecNumbers(
                                testQuestions: OphthalmologyQuiz,
                                courseVids: OphthalmologyVids,
                                cubit: cubit,
                                courseName: 'Ophthalmology',
                              ),
                              LecNumbers(
                                testQuestions: psychologyQuiz,
                                courseVids: psychologyVids,
                                cubit: cubit,
                                courseName: 'psychology',
                              ),
                              LecNumbers(
                                testQuestions: pediatricsQuiz,
                                courseVids: pediatricsVids,
                                cubit: cubit,
                                courseName: 'pediatrics',
                              ),
                              LecNumbers(
                                testQuestions: ImmunityQuiz,
                                courseVids: ImmunityVids,
                                cubit: cubit,
                                courseName: 'immunity',
                              ),
                              LecNumbers(
                                testQuestions: EarNoseandThroatQuiz,
                                courseVids: EarNoseandThroatVids,
                                cubit: cubit,
                                courseName: 'Ear, nose and throat',
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
