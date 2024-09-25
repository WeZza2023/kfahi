import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/constants/custom_texts.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/layouts/courses_layout.dart';
import 'package:kfahi/screens/home/home_cubit.dart';
import 'package:kfahi/screens/notifications/notifications_screen.dart';
import 'package:kfahi/screens/sing_up/sign_up_cubit.dart';
import 'package:kfahi/screens/test/test_cubit.dart';
import 'package:kfahi/screens/video/video_cubit.dart';
import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';
import '../../layouts/colleges_layout.dart';
import '../../layouts/initiatives_layout.dart';
import '../../layouts/my_points_layout.dart';
import '../../layouts/news_layout.dart';
import '../../shared_prefs/network.dart';
import '../sign_in/sign_in_screen.dart';
import 'home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<SignUpCubit>(context).launchWhatsApp();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.getBaseScale(context) * 10,
            ),
          ),
          backgroundColor: kActiveColor,
          mini: true,
          splashColor: kBackgroundColor.withOpacity(0.2),
          child: const Icon(
            Icons.open_in_new_rounded,
            color: kBackgroundColor,
          ),
        ),
        drawer: AppDrawer(
          email: cubit.userModel == null
              ? ''
              : cubit.userModel!.email ??
                  FirebaseAuth.instance.currentUser?.email ??
                  '',
          img: cubit.userModel?.profile,
          context: context,
          name: cubit.userModel == null ? '' : cubit.userModel?.first ?? '',
          children: Column(
            children: [
              DrawerItem(
                title: S.of(context).notifications,
                icon: Icons.notifications_active_outlined,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    NotificationsScreen.id,
                  );
                },
              ),
              DrawerItem(
                title: S.of(context).sign_out,
                icon: Icons.logout_rounded,
                onTap: () {
                  CacheHelper.removeData(key: 'email');
                  CacheHelper.removeData(key: 'password');
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    SignInScreen.id,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
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
                          AppSizes.getBaseScale(context) * 80,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Builder(builder: (context) {
                              return InkWell(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Icon(
                                  Icons.menu_rounded,
                                  size: AppSizes.getBaseScale(context) * 20,
                                  color: kBackgroundColor,
                                ).hP16,
                              );
                            }),
                            BodyLargeText(
                              S.of(context).home_screen,
                              color: kBackgroundColor,
                            ),
                            Icon(
                              Icons.menu_rounded,
                              size: AppSizes.getBaseScale(context) * 20,
                              color: Colors.transparent,
                            ).hP16,
                          ],
                        ),
                        AppTapBar(
                          context: context,
                          onTap: (index) {
                            if (index == 0) {
                              BlocProvider.of<VideoCubit>(context).isCourse =
                                  true;
                              BlocProvider.of<TestCubit>(context).isCourse =
                                  true;
                            } else if (index == 1) {
                              BlocProvider.of<VideoCubit>(context).isCourse =
                                  false;
                              BlocProvider.of<TestCubit>(context).isCourse =
                                  false;
                            }
                          },
                          tabs: [
                            BodySmallText(
                              S.of(context).courses,
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(
                              S.of(context).colleges,
                              color: kBackgroundColor,
                            ).p4,
                            BodySmallText(S.of(context).curricula,
                                    color: kBackgroundColor)
                                .p4,
                            BodySmallText(S.of(context).initiatives,
                                    color: kBackgroundColor)
                                .p4,
                            BodySmallText(S.of(context).news,
                                    color: kBackgroundColor)
                                .p4,
                            BodySmallText(S.of(context).my_points,
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
                    child: TabBarView(
                      children: [
                        const CoursesLayout(),
                        const CollegesLayout(),
                        InkWell(
                          onTap: () {
                            cubit.getInitiatives();
                          },
                          child: CommingSoon(context: context),
                        ),
                        InitiativesLayout(),
                        state is GetNewsLoadingState
                            ? AppLoadingIndicator(context: context)
                            : const NewsLayout(),
                        const MyPointsLayout(),
                      ],
                    ).tP25.hP16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
