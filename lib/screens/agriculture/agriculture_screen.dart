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
import 'agriculture_cubit.dart';
import 'agriculture_state.dart';

class AgricultureScreen extends StatelessWidget {
  const AgricultureScreen({super.key});

  static String id = 'AgricultureScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AgricultureCubit>(context);
    return BlocBuilder<AgricultureCubit, AgricultureState>(
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
              length: 10,
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
                              S.of(context).agriculture,
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
                                  docName: 'Biochemistry',
                                  collageName: 'Agriculture');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Morphology',
                                  collageName: 'Agriculture');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Physics',
                                  collageName: 'Agriculture');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Animal science',
                                  collageName: 'Agriculture');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Agricultural economics',
                                  collageName: 'Agriculture');
                            } else if (index == 5) {
                              cubit.getDoneLecs(
                                  docName: 'Statistics',
                                  collageName: 'Agriculture');
                            } else if (index == 6) {
                              cubit.getDoneLecs(
                                  docName: 'Crops', collageName: 'Agriculture');
                            } else if (index == 7) {
                              cubit.getDoneLecs(
                                  docName: 'Plant diseases',
                                  collageName: 'Agriculture');
                            } else if (index == 8) {
                              cubit.getDoneLecs(
                                  docName: 'Agricultural engineering basics',
                                  collageName: 'Agriculture');
                            } else if (index == 9) {
                              cubit.getDoneLecs(
                                  docName: 'Animal production',
                                  collageName: 'Agriculture');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'الكمياء الحيويه',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'مورفولوجيا',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الفزياء',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'علم الحيوان الزراعي',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الاقتصاد الزراعي',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الإحصاء',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'المحاصيل',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'أمراض النبات',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'أساسيات الهندسة الزراعية',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الإنتاج الحيواني',
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
                                testQuestions: BiochemistryQues,
                                courseVids: BiochemistryCourse,
                                cubit: cubit,
                                courseName: 'Biochemistry',
                              ),
                              LecNumbers(
                                testQuestions: morphologyQuestions,
                                courseVids: MorphologyCourse,
                                cubit: cubit,
                                courseName: 'Morphology',
                              ),
                              LecNumbers(
                                testQuestions: PhysicsQuestions,
                                courseVids: PhysicsCourse,
                                cubit: cubit,
                                courseName: 'Physics',
                              ),
                              LecNumbers(
                                testQuestions: AnimalScienceQuestions,
                                courseVids: AnimalScienceCourse,
                                cubit: cubit,
                                courseName: 'Animal science',
                              ),
                              LecNumbers(
                                testQuestions: economicsQuiz,
                                courseVids: AgriculturalEconomicsCourse,
                                cubit: cubit,
                                courseName: 'Agricultural economics',
                              ),
                              LecNumbers(
                                testQuestions: statisticsQuiz,
                                courseVids: StatisticsCourse,
                                cubit: cubit,
                                courseName: 'Statistics',
                              ),
                              LecNumbers(
                                testQuestions: AgriculturalcropsQuiz,
                                courseVids: CropsCourse,
                                cubit: cubit,
                                courseName: 'Crops',
                              ),
                              LecNumbers(
                                testQuestions: PlantdiseasesQuiz,
                                courseVids: PlantDiseasesCourse,
                                cubit: cubit,
                                courseName: 'Plant diseases',
                              ),
                              LecNumbers(
                                testQuestions: AgriculturalengineeringQuiz,
                                courseVids: AgriculturalEngineeringBasicsCourse,
                                cubit: cubit,
                                courseName: 'Agricultural engineering basics',
                              ),
                              LecNumbers(
                                testQuestions: AnimalproductionQuiz,
                                courseVids: AnimalProductionCourse,
                                cubit: cubit,
                                courseName: 'Animal production',
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
