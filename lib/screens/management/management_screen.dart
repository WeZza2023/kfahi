import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/management/management_cubit.dart';
import 'package:kfahi/screens/management/management_state.dart';
import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/questions.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';

class ManagementScreen extends StatelessWidget {
  const ManagementScreen({super.key});

  static String id = 'ManagementScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ManageMentCubit>(context);
    return BlocBuilder<ManageMentCubit, ManagementState>(
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
              length: 9,
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
                              S.of(context).management,
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
                                  docName: 'Business', isCourse: true);
                            } else if (index == 1) {
                              cubit.getDoneLecs(docName: 'HR', isCourse: true);
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Leadership', isCourse: true);
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName:
                                      'Financial management in emerging companies',
                                  isCourse: true);
                            } else if (index == 4) {
                              cubit.getDoneLecs(docName: 'PMP', isCourse: true);
                            } else if (index == 5) {
                              cubit.getDoneLecs(
                                  docName: 'Risk management', isCourse: true);
                            } else if (index == 6) {
                              cubit.getDoneLecs(
                                  docName: 'Purchasing Department',
                                  isCourse: true);
                            } else if (index == 7) {
                              cubit.getDoneLecs(
                                  docName: 'Stores Department', isCourse: true);
                            } else if (index == 8) {
                              cubit.getDoneLecs(
                                  docName: 'Chain and supply management',
                                  isCourse: true);
                            }
                          },
                          tabs: [
                            BodySmallText(
                              S.of(context).business_administration,
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              S.of(context).hr,
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              S.of(context).leadership,
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              'الاداره الماليه في الشركات الناشئة',
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              'PMP',
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              'اداره المخاطر',
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              'اداره المشتريات',
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              'اداره المخازن',
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              'اداره السلاسل والامداد',
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
                                testQuestions: BussinessQues,
                                courseVids: BussinessVids,
                                cubit: cubit,
                                courseName: 'Business',
                              ),
                              LecNumbers(
                                testQuestions: HrQues,
                                courseVids: HrVids,
                                cubit: cubit,
                                courseName: 'HR',
                              ),
                              LecNumbers(
                                testQuestions: LeaderShipQues,
                                courseVids: LeaderShipVids,
                                cubit: cubit,
                                courseName: 'Leadership',
                              ),
                              LecNumbers(
                                testQuestions:
                                    FinancialmanagementinemergingcompaniesQues,
                                courseVids:
                                    FinancialmanagementinemergingcompaniesVids,
                                cubit: cubit,
                                courseName:
                                    'Financial management in emerging companies',
                              ),
                              LecNumbers(
                                testQuestions: PMPQues,
                                courseVids: PMPVids,
                                cubit: cubit,
                                courseName: 'PMP',
                              ),
                              LecNumbers(
                                testQuestions: RiskmanagementQues,
                                courseVids: RiskmanagementVids,
                                cubit: cubit,
                                courseName: 'Risk management',
                              ),
                              LecNumbers(
                                testQuestions: PurchasingDepartmentQues,
                                courseVids: PurchasingDepartmentVids,
                                cubit: cubit,
                                courseName: 'Purchasing Department',
                              ),
                              LecNumbers(
                                testQuestions: StoresQues,
                                courseVids: StoresVids,
                                cubit: cubit,
                                courseName: 'Stores Department',
                              ),
                              LecNumbers(
                                testQuestions: ChainandsupplymanagementQues,
                                courseVids: ChainandsupplymanagementVids,
                                cubit: cubit,
                                courseName: 'Chain and supply management',
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
