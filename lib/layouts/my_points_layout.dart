import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/constants/custom_texts.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/home/home_cubit.dart';
import 'package:kfahi/screens/home/home_state.dart';
import 'package:kfahi/screens/technology/technology_screen.dart';

import '../constants/colors.dart';
import '../generated/l10n.dart';

class MyPointsLayout extends StatelessWidget {
  const MyPointsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kMainColor,
            ),
            height: 200,
            width: 300,
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
          )
        ],
      ),
    );
  }
}
