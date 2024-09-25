import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/pharmacy/pharmacy_cubit.dart';
import 'package:kfahi/screens/pharmacy/pharmacy_state.dart';
import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/questions.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  static String id = 'PharmacyScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PharmacyCubit>(context);
    return BlocBuilder<PharmacyCubit, PharmacyState>(
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
                              S.of(context).pharmacy,
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
                                  docName:
                                      'Pharmaceutical cosmetics and formulations',
                                  collageName: 'Pharmacy');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'first stage pharmacy',
                                  collageName: 'Pharmacy');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Mathematics pharmacy',
                                  collageName: 'Pharmacy');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Drugs pharmacy',
                                  collageName: 'Pharmacy');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'التجميل الدوائى والتركيبات الصيدلانيه',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'اول مرحلة اوله صيدله',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الرياضيات لكليه صيدله',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'العقاقير',
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
                                testQuestions:
                                    PharmaceuticalcosmeticsandformulationsQuiz,
                                courseVids:
                                    PharmaceuticalcosmeticsandformulationsVids,
                                cubit: cubit,
                                courseName:
                                    'Pharmaceutical cosmetics and formulations',
                              ),
                              LecNumbers(
                                testQuestions: firststagepharmacyQuiz,
                                courseVids: firststagepharmacyVids,
                                cubit: cubit,
                                courseName: 'first stage pharmacy',
                              ),
                              LecNumbers(
                                testQuestions: MathematicspharmacyQuiz,
                                courseVids: MathematicspharmacyVids,
                                cubit: cubit,
                                courseName: 'Mathematics pharmacy',
                              ),
                              LecNumbers(
                                testQuestions: DrugspharmacyQuiz,
                                courseVids: DrugspharmacyVids,
                                cubit: cubit,
                                courseName: 'Drugs pharmacy',
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
