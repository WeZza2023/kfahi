import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/marketing/marketing_cubit.dart';
import 'package:kfahi/screens/marketing/marketing_state.dart';

import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/questions.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';

class MarketingScreen extends StatelessWidget {
  const MarketingScreen({super.key});

  static String id = 'MarketingScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MarketingCubit>(context);
    return BlocBuilder<MarketingCubit, MarketingState>(
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
                              S.of(context).marketing,
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
                                  docName: 'ContentWriting', isCourse: true);
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Customer service', isCourse: true);
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'E-Marketing', isCourse: true);
                            } else if (index == 3) {
                              cubit.getDoneLecs(docName: 'SEO', isCourse: true);
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Marketing Diploma', isCourse: true);
                            } else if (index == 5) {
                              cubit.getDoneLecs(
                                  docName: 'Customer satisfaction course',
                                  isCourse: true);
                            }
                          },
                          tabs: [
                            BodySmallText(
                              S.of(context).content_writing,
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              S.of(context).customer_service,
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(S.of(context).e_marketing,
                                    color: kBackgroundColor)
                                .p4,
                            BodySmallText(S.of(context).seo,
                                    color: kBackgroundColor)
                                .p4,
                            const BodySmallText('دبلومه التسويق',
                                    color: kBackgroundColor)
                                .p4,
                            const BodySmallText(
                              'رضا العملاء',
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
                                testQuestions: ContentWritingQues,
                                courseVids: ContentWritingVids,
                                cubit: cubit,
                                courseName: 'ContentWriting',
                              ),
                              LecNumbers(
                                testQuestions: CustomerServicesQues,
                                courseVids: CustomerServicesVids,
                                cubit: cubit,
                                courseName: 'Customer service',
                              ),
                              LecNumbers(
                                testQuestions: ElectronicmarketingQues,
                                courseVids: ElectronicmarketingVids,
                                cubit: cubit,
                                courseName: 'E-Marketing',
                              ),
                              LecNumbers(
                                testQuestions: SEOQues,
                                courseVids: SEOVids,
                                cubit: cubit,
                                courseName: 'SEO',
                              ),
                              LecNumbers(
                                testQuestions: MarketingDiplomaQues,
                                courseVids: MarketingDiplomaVids,
                                cubit: cubit,
                                courseName: 'Marketing Diploma',
                              ),
                              LecNumbers(
                                testQuestions: CustomersatisfactioncourseQues,
                                courseVids: CustomersatisfactioncourseVids,
                                cubit: cubit,
                                courseName: 'Customer satisfaction course',
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
