import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/constants/questions.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/veterinary_medicine/veterinary_medicine_cubit.dart';
import 'package:kfahi/screens/veterinary_medicine/veterinary_medicine_state.dart';

import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';

class VeterinaryMedicineScreen extends StatelessWidget {
  const VeterinaryMedicineScreen({super.key});

  static String id = 'VeterinaryMedicineScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<VeterinaryMedicineCubit>(context);
    return BlocBuilder<VeterinaryMedicineCubit, VeterinaryMedicineState>(
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
              length: 5,
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
                              S.of(context).veterinary_medicine,
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
                                  docName: 'Pharma antibiotics',
                                  collageName: 'Veterinary medicine');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Virology',
                                  collageName: 'Veterinary medicine');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Parasitology',
                                  collageName: 'Veterinary medicine');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Embryology',
                                  collageName: 'Veterinary medicine');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Anatomy_veterinary',
                                  collageName: 'Veterinary medicine');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'فارما مضادات حيويه',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'علم الفيروسات',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'ParaSiTOLOgy',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'امبريولوجى طب بيطرى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'تشريح طب بيطرى',
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
                                testQuestions: PharmaantibioticsQuiz,
                                courseVids: PharmaantibioticsVids,
                                cubit: cubit,
                                courseName: 'Pharma antibiotics',
                              ),
                              LecNumbers(
                                testQuestions: VirologyQuiz,
                                courseVids: VirologyVids,
                                cubit: cubit,
                                courseName: 'Virology',
                              ),
                              LecNumbers(
                                testQuestions: ParasitologyQuiz,
                                courseVids: ParasitologyVids,
                                cubit: cubit,
                                courseName: 'Parasitology',
                              ),
                              LecNumbers(
                                testQuestions: EmbryologyQuiz,
                                courseVids: EmbryologyVids,
                                cubit: cubit,
                                courseName: 'Embryology',
                              ),
                              LecNumbers(
                                testQuestions: AnatomypQuiz,
                                courseVids: AnatomypVids,
                                cubit: cubit,
                                courseName: 'Anatomy_veterinary',
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
