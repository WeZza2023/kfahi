import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/components/components.dart';
import 'package:kfahi/constants/custom_texts.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/home/home_cubit.dart';
import 'package:kfahi/screens/home/home_state.dart';
import '../constants/colors.dart';
import '../generated/l10n.dart';

class MyPointsLayout extends StatelessWidget {
  const MyPointsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kMainColor,
              ),
              height: 200,
              width: 300,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AppPopupDialog(
                            body: [
                              Image.asset(
                                'assets/images/logo.x.png',
                                width: 100,
                                height: 100,
                              ).vP16,
                              const BodySmallText(
                                'برنامج نقاطي هو برنامج مكافآت يمنحك بعض الجوائز بناء على حماسك ويساعدك على التحفيز والحصول على المزيد من الدورات التدريبيه.',
                                maxLines: 10,
                                textAlign: TextAlign.center,
                              )
                            ],
                            title: 'تعرف على برنامج نقاطي',
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.info_outline_rounded,
                        size: 20,
                      ),
                      color: kBackgroundColor,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BodyTooLargeText(
                          cubit.myPoints,
                          color: kActiveColor,
                        ).bP16,
                        BodyTooLargeText(
                          S.of(context).my_points,
                          color: kBackgroundColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).bP16,
            Image.asset(
              'assets/images/points 1.jpg',
              scale: 10,
            ).vP16,
            const BodyMediumText(
              'الجائزة الأولى: شنطه المتدرب عند الوصول إلى 500 نقطة.',
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/images/points 3.jpg',
              scale: 10,
            ).vP16,
            const BodyMediumText(
              'الجائزة الثانية: موبايل عند الوصول إلى 1500 نقطة.',
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/images/points 2.jpg',
              scale: 10,
            ).vP16,
            const BodyMediumText(
              'الجائزة الثالثة: لاب توب عند الوصول إلى 3000 نقطة.',
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/images/points 4.jpg',
              scale: 10,
            ).vP16,
            const BodyMediumText(
              'الجائزة الرابعة: 100,000 جنيه نقدي عند الوصول إلى 6000 نقطة.',
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ],
        ).bP25,
      ),
    );
  }
}
