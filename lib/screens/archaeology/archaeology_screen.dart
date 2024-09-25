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
import 'archaeology_cubit.dart';
import 'archaeology_state.dart';

class ArchaeologyScreen extends StatelessWidget {
  const ArchaeologyScreen({super.key});

  static String id = 'ArchaeologyScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ArchaeologyCubit>(context);
    return BlocBuilder<ArchaeologyCubit, ArchaeologyState>(
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
              length: 3,
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
                                  docName: 'Anthropology',
                                  collageName: 'Archaeology');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Hieroglyphs',
                                  collageName: 'Archaeology');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Archeology and its techniques',
                                  collageName: 'Archaeology');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'علم الاثار وتقنياتة',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'اللغة الهيروغلفية',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'انثروبولوجى',
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
                                testQuestions: anthropologistQuiz,
                                courseVids: anthropologistVids,
                                cubit: cubit,
                                courseName: 'Anthropology',
                              ),
                              LecNumbers(
                                testQuestions: HieroglyphsQuiz,
                                courseVids: HieroglyphsVids,
                                cubit: cubit,
                                courseName: 'Hieroglyphs',
                              ),
                              LecNumbers(
                                testQuestions: ArcheologyanditstechniquesQuiz,
                                courseVids: ArcheologyanditstechniquesVids,
                                cubit: cubit,
                                courseName: 'Archeology and its techniques',
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
