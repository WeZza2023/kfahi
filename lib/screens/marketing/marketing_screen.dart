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
import '../video/video_cubit.dart';
import '../video/video_screen.dart';

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
                              cubit.getDoneLecs(docName: 'ContentWriting');
                            } else if (index == 1) {
                              cubit.getDoneLecs(docName: 'Customer service');
                            } else if (index == 2) {
                              cubit.getDoneLecs(docName: 'E-Marketing');
                            } else if (index == 3) {
                              cubit.getDoneLecs(docName: 'SEO');
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
                              GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                ),
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.all(
                                      AppSizes.getBaseScale(context) * 8.0),
                                  child: InkWell(
                                    onTap: () async {
                                      await BlocProvider.of<VideoCubit>(context)
                                          .getVideoDetails(
                                        videoId: ContentWritingVids[index],
                                        videoNum: index,
                                        course: 'ContentWriting',
                                        courseVids: ContentWritingVids,
                                        testQuestions: ContentWritingQues,
                                      );

                                      await BlocProvider.of<VideoCubit>(context)
                                          .initController(context: context);

                                      Navigator.pushNamed(
                                          context, VideoScreen.id);
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: cubit.doneLecs.contains(index) ==
                                                true
                                            ? Colors.green
                                            : Colors.blueGrey,
                                      ),
                                      child: Center(
                                          child: BodySmallText(
                                        (index + 1).toString(),
                                        weight: FontWeight.bold,
                                      )),
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.all(15),
                                itemCount: ContentWritingVids.length,
                              ),
                              GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                ),
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.all(
                                      AppSizes.getBaseScale(context) * 8.0),
                                  child: InkWell(
                                    onTap: () async {
                                      await BlocProvider.of<VideoCubit>(context)
                                          .getVideoDetails(
                                        videoId: CustomerServicesVids[index],
                                        videoNum: index,
                                        course: 'Customer service',
                                        courseVids: CustomerServicesVids,
                                        testQuestions: CustomerServicesQues,
                                      );

                                      await BlocProvider.of<VideoCubit>(context)
                                          .initController(context: context);

                                      Navigator.pushNamed(
                                          context, VideoScreen.id);
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: cubit.doneLecs.contains(index) ==
                                                true
                                            ? Colors.green
                                            : Colors.blueGrey,
                                      ),
                                      child: Center(
                                          child: BodySmallText(
                                        (index + 1).toString(),
                                        weight: FontWeight.bold,
                                      )),
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.all(15),
                                itemCount: CustomerServicesVids.length,
                              ),
                              GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                ),
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.all(
                                      AppSizes.getBaseScale(context) * 8.0),
                                  child: InkWell(
                                    onTap: () async {
                                      await BlocProvider.of<VideoCubit>(context)
                                          .getVideoDetails(
                                        videoId: MarketingVids[index],
                                        videoNum: index,
                                        course: 'E-Marketing',
                                        courseVids: MarketingVids,
                                        testQuestions: MarketingQues,
                                      );

                                      await BlocProvider.of<VideoCubit>(context)
                                          .initController(context: context);

                                      Navigator.pushNamed(
                                          context, VideoScreen.id);
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: cubit.doneLecs.contains(index) ==
                                                true
                                            ? Colors.green
                                            : Colors.blueGrey,
                                      ),
                                      child: Center(
                                          child: BodySmallText(
                                        (index + 1).toString(),
                                        weight: FontWeight.bold,
                                      )),
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.all(15),
                                itemCount: MarketingVids.length,
                              ),
                              GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                ),
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.all(
                                      AppSizes.getBaseScale(context) * 8.0),
                                  child: InkWell(
                                    onTap: () async {
                                      await BlocProvider.of<VideoCubit>(context)
                                          .getVideoDetails(
                                        videoId: SEOVids[index],
                                        videoNum: index,
                                        course: 'SEO',
                                        courseVids: SEOVids,
                                        testQuestions: SEOQues,
                                      );

                                      await BlocProvider.of<VideoCubit>(context)
                                          .initController(context: context);

                                      Navigator.pushNamed(
                                          context, VideoScreen.id);
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: cubit.doneLecs.contains(index) ==
                                                true
                                            ? Colors.green
                                            : Colors.blueGrey,
                                      ),
                                      child: Center(
                                          child: BodySmallText(
                                        (index + 1).toString(),
                                        weight: FontWeight.bold,
                                      )),
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.all(15),
                                itemCount: SEOVids.length,
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
