import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/components/components.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/home/home_cubit.dart';
import 'package:kfahi/screens/home/home_state.dart';

import '../../constants/custom_texts.dart';
import '../../generated/l10n.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static String id = 'NotificationsScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Scaffold(
        appBar: CustomAppBar(
          showBackButton: true,
          title: S.of(context).notifications,
          onTapBack: () {
            Navigator.pop(context);
          },
        ),
        body: cubit.notificationsModel == null ||
                state is GetMyNotificationsErrorState ||
                cubit.notificationsModel!.mainNotifications!.isEmpty
            ? const Center(child: BodyLargeText("لا يوجد اشعارات جديده"))
            : ListView.builder(
                    itemBuilder: (context, index) => NotificationExpansionTile(
                        title: cubit.notificationsModel
                                ?.mainNotifications![index].title ??
                            'لا يوجد عنوان',
                        context: context,
                        sub: cubit.notificationsModel?.mainNotifications![index]
                                .sub ??
                            'لا يوجد تفاصيل',
                        link: cubit.notificationsModel
                            ?.mainNotifications![index].link),
                    itemCount:
                        cubit.notificationsModel!.mainNotifications!.length)
                .p16,
      ),
    );
  }
}
