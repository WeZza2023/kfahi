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
import 'programming_cubit.dart';
import 'programming_state.dart';

class ProgrammingScreen extends StatelessWidget {
  const ProgrammingScreen({super.key});

  static String id = 'ProgrammingScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProgrammingCubit>(context);
    return BlocBuilder<ProgrammingCubit, ProgrammingState>(
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
              length: 18,
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
                              S.of(context).programming,
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
                                  docName: 'Before programming',
                                  isCourse: true);
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Vs Code', isCourse: true);
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Android studio', isCourse: true);
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Ethicalhacking', isCourse: true);
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Dart', isCourse: true);
                            } else if (index == 5) {
                              cubit.getDoneLecs(
                                  docName: 'Flutter', isCourse: true);
                            } else if (index == 6) {
                              cubit.getDoneLecs(
                                  docName: 'WordPress', isCourse: true);
                            } else if (index == 7) {
                              cubit.getDoneLecs(
                                  docName: 'Front_end', isCourse: true);
                            } else if (index == 8) {
                              cubit.getDoneLecs(
                                  docName: 'Back_end', isCourse: true);
                            } else if (index == 9) {
                              cubit.getDoneLecs(
                                  docName: 'Problems Solving with c++',
                                  isCourse: true);
                            } else if (index == 10) {
                              cubit.getDoneLecs(
                                  docName: 'PHP Bootcamp', isCourse: true);
                            } else if (index == 11) {
                              cubit.getDoneLecs(
                                  docName: 'JavaScript', isCourse: true);
                            } else if (index == 12) {
                              cubit.getDoneLecs(
                                  docName: 'HTML', isCourse: true);
                            } else if (index == 13) {
                              cubit.getDoneLecs(docName: 'CSS', isCourse: true);
                            } else if (index == 14) {
                              cubit.getDoneLecs(
                                  docName: 'Python', isCourse: true);
                            } else if (index == 15) {
                              cubit.getDoneLecs(
                                  docName: 'Github & Git', isCourse: true);
                            } else if (index == 16) {
                              cubit.getDoneLecs(
                                  docName: 'eCommerce', isCourse: true);
                            } else if (index == 17) {
                              cubit.getDoneLecs(
                                  docName: 'MySQL', isCourse: true);
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'ما قبل البرمجة',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الفاجول استديو',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'اندرويد استديو',
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              S.of(context).ethical_hacking,
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'لغة دارت',
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              S.of(context).flutter,
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              S.of(context).wordpress,
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'فرونت اند',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'باك اند',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              '++Problems Solving with c',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'PHP Bootcamp',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'جافا سكريبت',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'HTML',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'CSS',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'بايثون',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'جيت هب و جيت',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'eCommerce',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'MySQL',
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
                                testQuestions: [],
                                courseVids: BeforeProgrammingVids,
                                cubit: cubit,
                                courseName: 'Before programming',
                              ),
                              LecNumbers(
                                testQuestions: vscodeQues,
                                courseVids: VsCodeVids,
                                cubit: cubit,
                                courseName: 'Vs Code',
                              ),
                              LecNumbers(
                                testQuestions: AndroidstudioQues,
                                courseVids: AndroidStudioVids,
                                cubit: cubit,
                                courseName: 'Android studio',
                              ),
                              LecNumbers(
                                testQuestions: EthicalHackingQues,
                                courseVids: EthicalHackingVids,
                                cubit: cubit,
                                courseName: 'Ethicalhacking',
                              ),
                              LecNumbers(
                                testQuestions: DartQues,
                                courseVids: DartVids,
                                cubit: cubit,
                                courseName: 'Dart',
                              ),
                              LecNumbers(
                                testQuestions: FlutterQues,
                                courseVids: FlutterVids,
                                cubit: cubit,
                                courseName: 'Flutter',
                              ),
                              LecNumbers(
                                testQuestions: WordPrsQues,
                                courseVids: WordPrsVids,
                                cubit: cubit,
                                courseName: 'WordPress',
                              ),
                              LecNumbers(
                                testQuestions: FrontEndQues,
                                courseVids: FrontEndVids,
                                cubit: cubit,
                                courseName: 'Front_end',
                              ),
                              LecNumbers(
                                testQuestions: backendQues,
                                courseVids: BackEndVids,
                                cubit: cubit,
                                courseName: 'Back_end',
                              ),
                              LecNumbers(
                                testQuestions: ProblemsSolvingWithcQues,
                                courseVids: ProblemsSolvingWithcVids,
                                cubit: cubit,
                                courseName: 'Problems Solving with c++',
                              ),
                              LecNumbers(
                                testQuestions: PHPBootcampQues,
                                courseVids: PHPBootcampVids,
                                cubit: cubit,
                                courseName: 'PHP Bootcamp',
                              ),
                              LecNumbers(
                                testQuestions: JavaScriptQues,
                                courseVids: JavaScriptVids,
                                cubit: cubit,
                                courseName: 'JavaScript',
                              ),
                              LecNumbers(
                                testQuestions: HTMLQues,
                                courseVids: HTMLVids,
                                cubit: cubit,
                                courseName: 'HTML',
                              ),
                              LecNumbers(
                                testQuestions: cssQues,
                                courseVids: cssVids,
                                cubit: cubit,
                                courseName: 'CSS',
                              ),
                              LecNumbers(
                                testQuestions: PythonQues,
                                courseVids: PythonVids,
                                cubit: cubit,
                                courseName: 'Python',
                              ),
                              LecNumbers(
                                testQuestions: GithubGitQues,
                                courseVids: GithubGitVids,
                                cubit: cubit,
                                courseName: 'Github & Git',
                              ),
                              LecNumbers(
                                testQuestions: eCommerceQues,
                                courseVids: eCommerceVids,
                                cubit: cubit,
                                courseName: 'eCommerce',
                              ),
                              LecNumbers(
                                testQuestions: MySQLQues,
                                courseVids: MySQLVids,
                                cubit: cubit,
                                courseName: 'MySQL',
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
