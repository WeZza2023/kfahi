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
import 'media_cubit.dart';
import 'media_state.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  static String id = 'MediaScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MediaCubit>(context);
    return BlocBuilder<MediaCubit, MediaState>(
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
                              S.of(context).media,
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
                                  docName: 'Journalistic editing',
                                  collageName: 'Media');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Radio and television art',
                                  collageName: 'Media');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Digital electronics',
                                  collageName: 'Media');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName:
                                      'Digital media production techniques',
                                  collageName: 'Media');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Film directing',
                                  collageName: 'Media');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'تحرير صحفى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الاذاعة والتليفزيون',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الكترونيات الرقمية',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'تقنيات الوسائط الرقمي',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الاخراج السينمائى',
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
                                testQuestions: JournalisticeditingQuiz,
                                courseVids: JournalisticeditingVids,
                                cubit: cubit,
                                courseName: 'Journalistic editing',
                              ),
                              LecNumbers(
                                testQuestions: RadioandtelevisionartQuiz,
                                courseVids: RadioandtelevisionartVids,
                                cubit: cubit,
                                courseName: 'Radio and television art',
                              ),
                              LecNumbers(
                                testQuestions: DigitalelectronicsQuiz,
                                courseVids: DigitalelectronicsVids,
                                cubit: cubit,
                                courseName: 'Digital electronics',
                              ),
                              LecNumbers(
                                testQuestions:
                                    DigitalmediaproductiontechniquesQuiz,
                                courseVids:
                                    DigitalmediaproductiontechniquesVids,
                                cubit: cubit,
                                courseName:
                                    'Digital media production techniques',
                              ),
                              LecNumbers(
                                testQuestions: FilmdirectingQuiz,
                                courseVids: FilmdirectingVids,
                                cubit: cubit,
                                courseName: 'Film directing',
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
