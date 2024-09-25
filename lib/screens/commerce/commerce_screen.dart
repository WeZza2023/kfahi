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
import 'commerce_cubit.dart';
import 'commerce_state.dart';

class CommerceScreen extends StatelessWidget {
  const CommerceScreen({super.key});

  static String id = "CommerceScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CommerceCubit>(context);
    return BlocBuilder<CommerceCubit, CommerceState>(
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
              length: 6,
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
                              S.of(context).commerce,
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
                                  docName: 'Entrepreneurship',
                                  collageName: 'Commerce');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Commercial_law',
                                  collageName: 'Commerce');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Business administration',
                                  collageName: 'Commerce');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Financial accounting in excel',
                                  collageName: 'Commerce');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Accounting',
                                  collageName: 'Commerce');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Anatomy veterinary',
                                  collageName: 'Commerce');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'ريادة اعمال',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'القانون التجارى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'مبادئ ادارة الاعمال',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'المحاسبه المالية بالاكسل',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'المحاسبة',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'الاقتصاد الجزئى',
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
                                testQuestions: EntrepreneurshipQuiz,
                                courseVids: EntrepreneurshipVids,
                                cubit: cubit,
                                courseName: 'Entrepreneurship',
                              ),
                              LecNumbers(
                                testQuestions: CommerciallawQuiz,
                                courseVids: CommerciallawCOCVids,
                                cubit: cubit,
                                courseName: 'Commercial_law',
                              ),
                              LecNumbers(
                                testQuestions: BusinessadministrationQuiz,
                                courseVids: BusinessadministrationVids,
                                cubit: cubit,
                                courseName: 'Business administration',
                              ),
                              LecNumbers(
                                testQuestions: FinancialaccountinginExcelQuiz,
                                courseVids: FinancialaccountinginExcelVids,
                                cubit: cubit,
                                courseName: 'Financial accounting in excel',
                              ),
                              LecNumbers(
                                testQuestions: AccountingQuiz,
                                courseVids: AccountingVids,
                                cubit: cubit,
                                courseName: 'Accounting',
                              ),
                              LecNumbers(
                                testQuestions: MicroeconomicsQuiz,
                                courseVids: MicroeconomicsVids,
                                cubit: cubit,
                                courseName: 'Anatomy veterinary',
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
