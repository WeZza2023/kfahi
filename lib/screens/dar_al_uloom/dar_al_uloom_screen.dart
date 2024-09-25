import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/constants/questions.dart';
import 'package:kfahi/extention/extetion.dart';

import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';
import 'dar_al_uloom_cubit.dart';
import 'dar_al_uloom_state.dart';

class DarAlUloomScreen extends StatelessWidget {
  const DarAlUloomScreen({super.key});

  static String id = 'DarAlUloomScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DarAlUloomCubit>(context);
    return BlocBuilder<DarAlUloomCubit, DarAlUloomState>(
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
                              S.of(context).dar_al_uloom,
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
                                  docName: 'General linguistics',
                                  collageName: 'Dar Al-Uloom');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Islamic civilization',
                                  collageName: 'Dar Al-Uloom');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName:
                                      'Arabic rhetoric and criticism among the Arabs',
                                  collageName: 'Dar Al-Uloom');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Philosophy and sciences',
                                  collageName: 'Dar Al-Uloom');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Sciences of jurisprudence',
                                  collageName: 'Dar Al-Uloom');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'علم اللغة العام',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الحضارة الاسلامية',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'البلاغه والنقد عند العرب',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'علم الفلسفة',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'علوم اصول الفقة',
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
                                testQuestions: GenerallinguisticsQuestions,
                                courseVids: GenerallinguisticsVids,
                                cubit: cubit,
                                courseName: 'General linguistics',
                              ),
                              LecNumbers(
                                testQuestions: IslamiccivilizationQuestions,
                                courseVids: IslamiccivilizationVids,
                                cubit: cubit,
                                courseName: 'Islamic civilization',
                              ),
                              LecNumbers(
                                testQuestions:
                                    ArabicrhetoricandcriticismamongtheArabsQuestions,
                                courseVids:
                                    ArabicrhetoricandcriticismamongtheArabsVids,
                                cubit: cubit,
                                courseName:
                                    'Arabic rhetoric and criticism among the Arabs',
                              ),
                              LecNumbers(
                                testQuestions: PhilosophysciencesQuestions,
                                courseVids: PhilosophysciencesVids,
                                cubit: cubit,
                                courseName: 'Philosophy and sciences',
                              ),
                              LecNumbers(
                                testQuestions: SciencesofjurisprudenceQuestions,
                                courseVids: SciencesofjurisprudenceVids,
                                cubit: cubit,
                                courseName: 'Sciences of jurisprudence',
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
