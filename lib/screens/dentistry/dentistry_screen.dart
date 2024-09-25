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
import 'dentistry_cubit.dart';
import 'dentistry_state.dart';

class DentistryScreen extends StatelessWidget {
  const DentistryScreen({super.key});

  static String id = "DentistryScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DentistryCubit>(context);
    return BlocBuilder<DentistryCubit, DentistryState>(
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
                              S.of(context).dentistry,
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
                                  docName: 'Dental Anatomy',
                                  collageName: 'Dentistry');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Histology',
                                  collageName: 'Dentistry');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Partial removable denture material',
                                  collageName: 'Dentistry');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Dental crowns and bridges',
                                  collageName: 'Dentistry');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Operative dentistry',
                                  collageName: 'Dentistry');
                            } else if (index == 5) {
                              cubit.getDoneLecs(
                                  docName:
                                      'Removable prosthodontics complete denture',
                                  collageName: 'Dentistry');
                            } else if (index == 6) {
                              cubit.getDoneLecs(
                                  docName: 'Orthodontics',
                                  collageName: 'Dentistry');
                            } else if (index == 7) {
                              cubit.getDoneLecs(
                                  docName: 'Diseases in dentistry',
                                  collageName: 'Dentistry');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'علم تشريح الاسنان',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'علم الانسجة',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'التركيبات المتحركه الجزئية',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'التركيبات الثابتة التيجان والجسور',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'العلاج التحفظى الحشوات',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'التركيبات المتحركة الكاملة',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'علم تقويم الاسنان',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الامراض الخطيرة',
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
                                testQuestions: DentalAnatomyQuiz,
                                courseVids: DentalAnatomyVids,
                                cubit: cubit,
                                courseName: 'Dental Anatomy',
                              ),
                              LecNumbers(
                                testQuestions: HistologyQuiz,
                                courseVids: HistologyVids,
                                cubit: cubit,
                                courseName: 'Histology',
                              ),
                              LecNumbers(
                                testQuestions:
                                    PartialremovabledenturematerialQuiz,
                                courseVids: PartialremovabledenturematerialVids,
                                cubit: cubit,
                                courseName:
                                    'Partial removable denture material',
                              ),
                              LecNumbers(
                                testQuestions: dentalCrownsAndBridgesQuiz,
                                courseVids: dentalCrownsAndBridgesVids,
                                cubit: cubit,
                                courseName: 'Dental crowns and bridges',
                              ),
                              LecNumbers(
                                testQuestions: OperativeDentistryQuiz,
                                courseVids: OperativeDentistryVids,
                                cubit: cubit,
                                courseName: 'Operative dentistry',
                              ),
                              LecNumbers(
                                testQuestions:
                                    RemovableProsthodonticsCompleteDentureQuiz,
                                courseVids:
                                    RemovableProsthodonticsCompleteDentureVids,
                                cubit: cubit,
                                courseName:
                                    'Removable prosthodontics complete denture',
                              ),
                              LecNumbers(
                                testQuestions: OrthodonticsQuiz,
                                courseVids: OrthodonticsVids,
                                cubit: cubit,
                                courseName: 'Orthodontics',
                              ),
                              LecNumbers(
                                testQuestions: DiseasesinDentistryQuiz,
                                courseVids: DiseasesinDentistryVids,
                                cubit: cubit,
                                courseName: 'Diseases in dentistry',
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
