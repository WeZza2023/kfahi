import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/tourism_and_hotels/tourism_and_hotels_cubit.dart';
import 'package:kfahi/screens/tourism_and_hotels/tourism_and_hotels_state.dart';

import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/lectures.dart';
import '../../constants/questions.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';

class TourismAndHotelsScreen extends StatelessWidget {
  const TourismAndHotelsScreen({super.key});

  static String id = 'TourismAndHotelsScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TourismAndHotelsCubit>(context);
    return BlocBuilder<TourismAndHotelsCubit, TourismAndHotelsState>(
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
                              S.of(context).tourism_and_hotels,
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
                                  docName: 'Archaeological Guidance Tourism',
                                  collageName: 'Tourism & Hotels');
                            } else if (index == 1) {
                              cubit.getDoneLecs(
                                  docName: 'Tourism Course',
                                  collageName: 'Tourism & Hotels');
                            } else if (index == 2) {
                              cubit.getDoneLecs(
                                  docName: 'Hotel Accounting',
                                  collageName: 'Tourism & Hotels');
                            } else if (index == 3) {
                              cubit.getDoneLecs(
                                  docName: 'Tourism Marketing',
                                  collageName: 'Tourism & Hotels');
                            } else if (index == 4) {
                              cubit.getDoneLecs(
                                  docName: 'Restaurant Management Basics',
                                  collageName: 'Tourism & Hotels');
                            }
                          },
                          tabs: [
                            const BodySmallText(
                              'اثار ارشاد سياجى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'السياحه',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'محاسبه الفنادق',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'التسويق السياحى',
                              color: kBackgroundColor,
                            ).p4,
                            const BodySmallText(
                              'اساسيات ادارة المطاعم',
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
                                    ArchaeologicalGuidanceTourismQuiz,
                                courseVids: ArchaeologicalGuidanceTourismVids,
                                cubit: cubit,
                                courseName: 'Archaeological Guidance Tourism',
                              ),
                              LecNumbers(
                                testQuestions: TourismCourseQuiz,
                                courseVids: TourismCourseVids,
                                cubit: cubit,
                                courseName: 'Tourism Course',
                              ),
                              LecNumbers(
                                testQuestions: HotelAccountingQuiz,
                                courseVids: HotelAccountingVids,
                                cubit: cubit,
                                courseName: 'Hotel Accounting',
                              ),
                              LecNumbers(
                                testQuestions: TourismMarketingQuiz,
                                courseVids: TourismMarketingVids,
                                cubit: cubit,
                                courseName: 'Tourism Marketing',
                              ),
                              LecNumbers(
                                testQuestions: RestaurantManagementBasicsQuiz,
                                courseVids: RestaurantManagementBasicsVids,
                                cubit: cubit,
                                courseName: 'Restaurant Management Basics',
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
