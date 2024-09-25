import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/accounting/accounting_cubit.dart';
import 'package:kfahi/screens/accounting/accounting_state.dart';

import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/questions.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';

class AccountingScreen extends StatelessWidget {
  const AccountingScreen({super.key});

  static String id = 'AccountingScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AccountingCubit>(context);
    return BlocBuilder<AccountingCubit, AccountingState>(
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
                              S.of(context).accounting,
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
                                  docName: 'Accounting Administration',
                                  isCourse: true);
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Cost Accounting', isCourse: true);
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Financial Accounting',
                                  isCourse: true);
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Tax accounting', isCourse: true);
                            }
                          },
                          tabs: [
                            BodySmallText(
                              S.of(context).accounting_administration,
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              S.of(context).cost_accounting,
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(S.of(context).financial_accounting,
                                    color: kBackgroundColor)
                                .p4,
                            BodySmallText(S.of(context).tax_accounting,
                                    color: kBackgroundColor)
                                .p4,
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
                                testQuestions: AccAdminQues,
                                courseVids: AccAdminVids,
                                cubit: cubit,
                                courseName: 'Accounting Administration',
                              ),
                              LecNumbers(
                                testQuestions: CostAccQues,
                                courseVids: CostAccVids,
                                cubit: cubit,
                                courseName: 'Cost Accounting',
                              ),
                              LecNumbers(
                                testQuestions: FinanceAccQues,
                                courseVids: FinanceAccVids,
                                cubit: cubit,
                                courseName: 'Financial Accounting',
                              ),
                              LecNumbers(
                                testQuestions: TaxAccQues,
                                courseVids: TaxAccVids,
                                cubit: cubit,
                                courseName: 'Tax accounting',
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
