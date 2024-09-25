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
import 'literature_cubit.dart';
import 'literature_state.dart';

class LiteratureScreen extends StatelessWidget {
  const LiteratureScreen({super.key});

  static String id = "LiteratureScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LiteratureCubit>(context);
    return BlocBuilder<LiteratureCubit, LiteratureState>(
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
                              S.of(context).literature,
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
                                  docName: 'Ancient Egyptian Literature',
                                  collageName: 'Literature');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'English literature',
                                  collageName: 'Literature');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Ancient literary criticism',
                                  collageName: 'Literature');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'History of Arabic Literature',
                                  collageName: 'Literature');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'مصر القديمه والحضارة الفرعونيه',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الاداب الانجليزيه',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'النقد الادبي القديم',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'تاريخ الادب العربى',
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
                                testQuestions: AncientEgyptQuiz,
                                courseVids: AncientEgyptVids,
                                cubit: cubit,
                                courseName: 'Ancient Egyptian Literature',
                              ),
                              LecNumbers(
                                testQuestions: EnglishliteratureQuiz,
                                courseVids: EnglishliteratureVids,
                                cubit: cubit,
                                courseName: 'English literature',
                              ),
                              LecNumbers(
                                testQuestions: AncientliterarycriticismQuiz,
                                courseVids: AncientliterarycriticismVids,
                                cubit: cubit,
                                courseName: 'Ancient literary criticism',
                              ),
                              LecNumbers(
                                testQuestions: HistoryofArabicLiteratureQuiz,
                                courseVids: HistoryofArabicLiteratureVids,
                                cubit: cubit,
                                courseName: 'History of Arabic Literature',
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
