import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/languages/languages_cubit.dart';
import 'package:kfahi/screens/languages/languages_state.dart';

import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/questions.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';
import '../video/video_cubit.dart';
import '../video/video_screen.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  static String id = "LanguagesScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LanguagesCubit>(context);
    return BlocBuilder<LanguagesCubit, LanguagesState>(
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
                              S.of(context).languages,
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
                              // cubit.getDoneLecs(
                              //     docName: 'English L1', isCourse: true);
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'German', isCourse: true);
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Italian', isCourse: true);
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Spanish', isCourse: true);
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'French', isCourse: true);
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'الانجليزية',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الالمانيه',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الايطاليه',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الاسبانيه',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الفرنسيه',
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
                    child: state is GetCourseLoadingState &&
                            cubit.tabIndex != 0 &&
                            cubit.tabIndex != 1
                        ? AppLoadingIndicator(context: context)
                        : TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              // LecNumbers(
                              //   testQuestions: EnglishQues,
                              //   courseVids: EnglishVidsL1 +
                              //       EnglishVidsL2 +
                              //       EnglishVidsL3 +
                              //       EnglishVidsL4 +
                              //       EnglishVidsL5 +
                              //       EnglishVidsL6 +
                              //       EnglishVidsL7 +
                              //       EnglishVidsL8 +
                              //       EnglishVidsL9 +
                              //       EnglishVidsL10,
                              //   cubit: cubit,
                              //   courseName: 'English',
                              // ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'English L1',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى الاول',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: EnglishVidsL1,
                                                  courseName: 'English L1',
                                                ),
                                        ]),
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'English L2',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى الثاني',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: EnglishVidsL2,
                                                  courseName: 'English L2',
                                                ),
                                        ]),
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'English L3',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى الثالث',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: EnglishVidsL3,
                                                  courseName: 'English L3',
                                                ),
                                        ]),
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'English L4',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى الرابع',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: EnglishVidsL4,
                                                  courseName: 'English L4',
                                                ),
                                        ]),
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'English L5',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى الخامس',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: EnglishVidsL5,
                                                  courseName: 'English L5',
                                                ),
                                        ]),
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'English L6',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى السادس',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: EnglishVidsL6,
                                                  courseName: 'English L6',
                                                ),
                                        ]),
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'English L7',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى السابع',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: EnglishVidsL7,
                                                  courseName: 'English L7',
                                                ),
                                        ]),
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'English L8',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى الثامن',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: EnglishVidsL8,
                                                  courseName: 'English L8',
                                                ),
                                        ]),
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'English L9',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى التاسع',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: EnglishVidsL9,
                                                  courseName: 'English L9',
                                                ),
                                        ]),
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'English L10',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى العاشر',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: EnglishVidsL10,
                                                  courseName: 'English L10',
                                                ),
                                        ]),
                                  ],
                                ),
                              ),
                              // SingleChildScrollView(
                              //   child: Column(
                              //     children: [
                              //       LevelsGrid(
                              //         context: context,
                              //         cubit: cubit,
                              //         courseVids: EnglishVidsL1,
                              //         courseLevel: 'المستوى الاول',
                              //         courseName: 'English L1',
                              //       ),
                              //       LevelsGrid(
                              //         context: context,
                              //         cubit: cubit,
                              //         courseVids: EnglishVidsL2,
                              //         courseLevel: 'المستوى الثاني',
                              //         courseName: 'English L2',
                              //       ),
                              //       LevelsGrid(
                              //         context: context,
                              //         cubit: cubit,
                              //         courseVids: EnglishVidsL3,
                              //         courseLevel: 'المستوى الثالث',
                              //         courseName: 'English L3',
                              //       ),
                              //       LevelsGrid(
                              //         context: context,
                              //         cubit: cubit,
                              //         courseVids: EnglishVidsL4,
                              //         courseLevel: 'المستوى الرابع',
                              //         courseName: 'English L4',
                              //       ),
                              //       LevelsGrid(
                              //         context: context,
                              //         cubit: cubit,
                              //         courseVids: EnglishVidsL5,
                              //         courseLevel: 'المستوى الخامس',
                              //         courseName: 'English L5',
                              //       ),
                              //       LevelsGrid(
                              //         context: context,
                              //         cubit: cubit,
                              //         courseVids: EnglishVidsL6,
                              //         courseLevel: 'المستوى السادس',
                              //         courseName: 'English L6',
                              //       ),
                              //       LevelsGrid(
                              //         context: context,
                              //         cubit: cubit,
                              //         courseVids: EnglishVidsL7,
                              //         courseLevel: 'المستوى السابع',
                              //         courseName: 'English L7',
                              //       ),
                              //       LevelsGrid(
                              //         context: context,
                              //         cubit: cubit,
                              //         courseVids: EnglishVidsL8,
                              //         courseLevel: 'المستوى الثامن',
                              //         courseName: 'English L8',
                              //       ),
                              //       LevelsGrid(
                              //         context: context,
                              //         cubit: cubit,
                              //         courseVids: EnglishVidsL9,
                              //         courseLevel: 'المستوى التاسع',
                              //         courseName: 'English L9',
                              //       ),
                              //       LevelsGrid(
                              //         context: context,
                              //         cubit: cubit,
                              //         courseVids: EnglishVidsL10,
                              //         courseLevel: 'المستوى العاشر',
                              //         courseName: 'English L10',
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // LecNumbers(
                              //   testQuestions: GermanQues,
                              //   courseVids: GermanVidsL1 +
                              //       GermanVidsL2 +
                              //       GermanVidsL3 +
                              //       GermanVidsL4,
                              //   cubit: cubit,
                              //   courseName: 'German',
                              // ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'German L1',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى الاول',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: GermanVidsL1,
                                                  courseName: 'German L1',
                                                ),
                                        ]),
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'German L2',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى الثاني',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: GermanVidsL2,
                                                  courseName: 'German L2',
                                                ),
                                        ]),
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'German L3',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى الثالث',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: GermanVidsL3,
                                                  courseName: 'German L3',
                                                ),
                                        ]),
                                    CustomExpansionTile(
                                        context: context,
                                        onExpansionChanged: (value) {
                                          if (value == true) {
                                            cubit.getDoneLecs(
                                                docName: 'German L4',
                                                isCourse: true);
                                          }
                                        },
                                        title: 'المستوى الرابع',
                                        children: [
                                          state is GetCourseLoadingState
                                              ? AppLoadingIndicator(
                                                  context: context)
                                              : LevelsGrid(
                                                  context: context,
                                                  cubit: cubit,
                                                  courseVids: GermanVidsL4,
                                                  courseName: 'German L4',
                                                ),
                                        ]),
                                  ],
                                ),
                              ),
                              LecNumbers(
                                testQuestions: ItalianQues,
                                courseVids: ItalianVids,
                                cubit: cubit,
                                courseName: 'Italian',
                              ),
                              LecNumbers(
                                testQuestions: SpanishQues,
                                courseVids: SpanishVids,
                                cubit: cubit,
                                courseName: 'Spanish',
                              ),
                              LecNumbers(
                                testQuestions: FrenchQues,
                                courseVids: FrenchVids,
                                cubit: cubit,
                                courseName: 'French',
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
