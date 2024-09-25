import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/constants/custom_texts.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/home/home_state.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../constants/colors.dart';
import '../constants/size.dart';
import '../screens/home/home_cubit.dart';
import '../screens/video/video_cubit.dart';
import '../screens/video/video_screen.dart';

Widget CustomTextField({
  required hintText,
  bool? isEnabled = true,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  required TextEditingController controller,
  required String? Function(String?)? validate,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    obscureText: obscureText,
    controller: controller,
    validator: validate,
    enabled: isEnabled,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle:
          TextStyle(color: isEnabled == true ? Colors.white : kInActiveColor),
      alignLabelWithHint: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: kInActiveColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white),
      ),
    ),
  );
}

Widget CustomButton({
  required String text,
  required Function()? onPressed,
  required Color color,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      overlayColor: Colors.white,
    ),
    child: BodyMediumText(
      text,
      color: Colors.white,
      weight: FontWeight.bold,
    ),
  );
}

AppBar CustomAppBar({
  String? title,
  bool showBackButton = true,
  Function()? onTapBack,
}) {
  return AppBar(
    backgroundColor: kMainColor,
    automaticallyImplyLeading: false,
    actions: showBackButton == true
        ? [
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: kBackgroundColor,
              ),
              onPressed: onTapBack,
            )
          ]
        : null,
    centerTitle: true,
    title: Text(
      title ?? '',
      style: const TextStyle(color: Colors.white),
    ),
  );
}

SnackBar AppSnackBar({
  required String message,
  bool? error = false,
}) {
  return SnackBar(
    duration: const Duration(seconds: 2),
    backgroundColor: error == true ? Colors.red : Colors.green,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    content: Center(
      child: BodyMediumText(
        message,
        color: Colors.white,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget AppPopupDialog({
  required List<Widget> body,
  required String title,
}) {
  return AlertDialog(
    content: SingleChildScrollView(
      child: Column(
        children: body,
      ),
    ),
    title: Center(
      child: BodyMediumText(
        title,
        maxLines: 4,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget AppTapBar({
  required BuildContext context,
  required Function(int) onTap,
  required List<Widget> tabs,
}) =>
    FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        height: AppSizes.getBaseScale(context) * 60,
        width: AppSizes.getScreenWidth(context) * 0.8,
        decoration: BoxDecoration(
          color: kTapBarColor,
          borderRadius: BorderRadiusDirectional.all(
              Radius.circular(AppSizes.getBaseScale(context) * 12)),
        ),
        child: TabBar(
          onTap: onTap,
          tabAlignment: TabAlignment.center,
          padding: EdgeInsets.all(AppSizes.getBaseScale(context) * 12),
          isScrollable: true,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: kMainColor,
            borderRadius: BorderRadius.all(
                Radius.circular(AppSizes.getBaseScale(context) * 12)),
          ),
          tabs: tabs,
        ),
      ),
    );

Widget CustomMainItem({
  required BuildContext context,
  required Function() onTap,
  required String title,
  String? number,
  required String img,
  required Color color,
}) =>
    InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(AppSizes.getBaseScale(context) * 15)),
                ),
                child: Image.asset(
                  img,
                  scale: AppSizes.getBaseScale(context) * 1.3,
                ).p4,
              ),
              BodyMediumText(title).hP16,
            ],
          ),
          if (number != null)
            Column(
              children: [
                BodySmallText(
                  number,
                  weight: FontWeight.bold,
                ).hP25,
                const BodySmallText(
                  "دورات",
                  weight: FontWeight.bold,
                ).hP25,
              ],
            ),
        ],
      ),
    ).vP8;

Widget AppLoadingIndicator({required BuildContext context}) => FittedBox(
      fit: BoxFit.scaleDown,
      child: CircularProgressIndicator(
        color: kActiveColor,
        strokeWidth: 2,
        strokeAlign: -5 * AppSizes.getBaseScale(context),
        strokeCap: StrokeCap.round,
      ),
    );

Widget CommingSoon({required BuildContext context}) {
  return FittedBox(
    fit: BoxFit.scaleDown,
    child: LottieBuilder.asset(
      "assets/icons/soon.json",
      height: AppSizes.getBaseScale(context) * 200,
      width: AppSizes.getBaseScale(context) * 200,
    ),
  );
}

Widget NewsExpansionTile({
  required BuildContext context,
  required String title,
  String? img,
  required String sub,
  String? link,
}) =>
    FittedBox(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: kMainColor,
            ),
            borderRadius:
                BorderRadius.circular(AppSizes.getBaseScale(context) * 30),
            color: Colors.white),
        width: AppSizes.getScreenWidth(context),
        child: ExpansionTile(
          title: BodySmallText(
            title,
          ),
          tilePadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppSizes.getBaseScale(context) * 10),
          ),
          dense: true,
          leading: img != null && img != ''
              ? Image.network(
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: AppLoadingIndicator(context: context),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => SizedBox(
                    height: AppSizes.getBaseScale(context) * 50,
                    width: AppSizes.getBaseScale(context) * 50,
                    child: const Icon(Icons.error_outline_rounded, size: 20),
                  ),
                  img,
                ).hP16
              : null,
          childrenPadding: EdgeInsets.all(AppSizes.getBaseScale(context) * 15),
          children: [
            img != null && img != ''
                ? Image.network(
                    fit: BoxFit.contain,
                    height: AppSizes.getBaseScale(context) * 200,
                    width: AppSizes.getBaseScale(context) * 250,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: AppLoadingIndicator(context: context),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => SizedBox(
                      height: AppSizes.getBaseScale(context) * 50,
                      width: AppSizes.getBaseScale(context) * 50,
                      child: const Icon(Icons.error_outline_rounded, size: 20),
                    ),
                    img,
                  ).hP16.hP25
                : const SizedBox(),
            BodyLargeText(
              sub,
              maxLines: 20,
              textAlign: TextAlign.center,
              weight: FontWeight.normal,
            ),
            if (link != null && link != '')
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(link));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.link_rounded,
                      size: 20,
                      color: Colors.blue,
                    ).hP8,
                    const BodyMediumText(
                      'اللينك المرفق.',
                      maxLines: 20,
                      textAlign: TextAlign.center,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
              ).tP16,
          ],
        ).p16,
      ).bP25,
    );

Widget InitiativesExpansionTile({
  required BuildContext context,
  required String title,
  required String sub,
  String? task,
  String? videoId,
  YoutubePlayerController? controller,
  required Function(bool) onExpansionChanged,
}) =>
    FittedBox(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: kMainColor,
            ),
            borderRadius:
                BorderRadius.circular(AppSizes.getBaseScale(context) * 30),
            color: Colors.white),
        width: AppSizes.getScreenWidth(context),
        child: ExpansionTile(
          key: Key(title),
          onExpansionChanged: onExpansionChanged,
          title: const SizedBox(),
          tilePadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppSizes.getBaseScale(context) * 10),
          ),
          dense: true,
          leading: BodySmallText(
            title,
            weight: FontWeight.bold,
          ).hP8,
          childrenPadding: EdgeInsets.all(AppSizes.getBaseScale(context) * 15),
          children: [
            controller == null
                ? AppLoadingIndicator(context: context)
                : YoutubePlayerBuilder(
                    builder: (p0, p1) => Column(
                      children: [
                        p1,
                      ],
                    ),
                    player: YoutubePlayer(
                      controller: controller,
                      showVideoProgressIndicator: true,
                      bottomActions: [],
                      progressIndicatorColor: kActiveColor,
                    ),
                  ),
            BodyLargeText(
              sub,
              maxLines: 20,
              textAlign: TextAlign.center,
              weight: FontWeight.normal,
            ).tP25,
            if (task != null && task != '')
              BodyMediumText(
                task,
                maxLines: 20,
                textAlign: TextAlign.center,
                weight: FontWeight.normal,
              ).tP8,
            InkWell(
              onTap: () {
                launchUrl(Uri.parse('https://wa.me/+201025173298'));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.link_rounded,
                    size: 20,
                    color: Colors.blue,
                  ).hP8,
                  const BodyMediumText(
                    'تسليم التاسك.',
                    maxLines: 20,
                    textAlign: TextAlign.center,
                    weight: FontWeight.normal,
                  ),
                ],
              ),
            ).tP16,
          ],
        ).p16,
      ).bP25,
    );

Widget NotificationExpansionTile({
  required BuildContext context,
  required String title,
  required String sub,
  String? link,
}) =>
    FittedBox(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: kMainColor,
            ),
            borderRadius:
                BorderRadius.circular(AppSizes.getBaseScale(context) * 30),
            color: Colors.white),
        width: AppSizes.getScreenWidth(context),
        child: ExpansionTile(
          title: const SizedBox(),
          leading: BodySmallText(
            title,
          ).hP8,
          tilePadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppSizes.getBaseScale(context) * 10),
          ),
          dense: true,
          childrenPadding: EdgeInsets.all(AppSizes.getBaseScale(context) * 15),
          children: [
            BodyMediumText(
              sub,
              maxLines: 20,
              textAlign: TextAlign.center,
              weight: FontWeight.normal,
            ),
            if (link != null && link != '')
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(link));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.link_rounded,
                      size: 20,
                      color: Colors.blue,
                    ).hP16,
                    const BodyMediumText(
                      'اللينك المرفق.',
                      maxLines: 20,
                      textAlign: TextAlign.center,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
              ).tP16,
          ],
        ).p16,
      ).bP25,
    );

Widget CustomExpansionTile({
  required BuildContext context,
  required String title,
  required List<Widget> children,
  required Function(bool) onExpansionChanged,
}) =>
    FittedBox(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: kMainColor,
            ),
            borderRadius:
                BorderRadius.circular(AppSizes.getBaseScale(context) * 30),
            color: Colors.white),
        width: AppSizes.getScreenWidth(context),
        child: ExpansionTile(
                onExpansionChanged: onExpansionChanged,
                title: const SizedBox(),
                leading: BodySmallText(
                  title,
                ).hP8,
                tilePadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      AppSizes.getBaseScale(context) * 10),
                ),
                dense: true,
                childrenPadding:
                    EdgeInsets.all(AppSizes.getBaseScale(context) * 15),
                children: children)
            .p16,
      ).bP25,
    );

Widget AppDrawer({
  required BuildContext context,
  required Widget children,
  required String name,
  required String email,
  String? img,
}) =>
    Drawer(
        backgroundColor: kBackgroundColor,
        width: AppSizes.getScreenWidth(context) * 0.8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(
            AppSizes.getBaseScale(context) * 80,
          )),
        ),
        child: SingleChildScrollView(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => Column(
              children: [
                AdvancedAvatar(
                  image: state is UpdateProfileLoadingState
                      ? null
                      : NetworkImage(img ?? ''),
                  size: AppSizes.getBaseScale(context) * 50,
                  children: [
                    state is UpdateProfileLoadingState
                        ? const SizedBox()
                        : InkWell(
                            onTap: () {
                              BlocProvider.of<HomeCubit>(context)
                                  .updateProfile();
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xff707184),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  size: AppSizes.getBaseScale(context) * 12,
                                  color: kBackgroundColor,
                                ).p(AppSizes.getBaseScale(context) * 4)),
                          )
                  ],
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.circle,
                  ),
                  child: state is UpdateProfileLoadingState
                      ? AppLoadingIndicator(context: context)
                      : Icon(
                          Icons.person_rounded,
                          size: AppSizes.getBaseScale(context) * 30,
                        ),
                ).tp(AppSizes.getBaseScale(context) * 25),
                BodySmallText(
                  name,
                  weight: FontWeight.bold,
                  maxLines: 2,
                ).tP16,
                BodyExtraSmallText(
                  email,
                  maxLines: 2,
                ).vP8,
                Divider(
                  color: kActiveColor.withOpacity(0.3),
                ),
                children.vP25,
              ],
            ),
          ),
        ));

Widget DrawerItem(
        {required Function() onTap,
        required String title,
        required IconData icon}) =>
    ListTile(
      leading: Icon(icon),
      title: Center(child: BodySmallText(title)),
      onTap: onTap,
    );

Widget LecNumbers({
  required List courseVids,
  required List testQuestions,
  required var cubit,
  required String courseName,
}) =>
    GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () async {
                await BlocProvider.of<VideoCubit>(context).getVideoDetails(
                  videoId: courseVids[index],
                  videoNum: index,
                  course: courseName,
                  courseVids: courseVids,
                  testQuestions: testQuestions,
                );

                await BlocProvider.of<VideoCubit>(context)
                    .initController(context: context);

                Navigator.pushNamed(context, VideoScreen.id);
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cubit.doneLecs.contains(index) == true
                      ? Colors.green
                      : Colors.blueGrey,
                ),
                child: Center(
                    child: BodySmallText(
                  (index + 1).toString(),
                  weight: FontWeight.bold,
                )).p8,
              ),
            ),
          ],
        );
      },
      padding: const EdgeInsets.all(15),
      itemCount: courseVids.length,
    );

Widget LevelsGrid({
  required BuildContext context,
  required List courseVids,
  required var cubit,
  required String courseName,
}) =>
    Column(
      children: [
        SizedBox(
          height: AppSizes.getScreenHeight(context) * 0.45,
          width: AppSizes.getScreenWidth(context),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  await BlocProvider.of<VideoCubit>(context).getVideoDetails(
                    videoId: courseVids[index],
                    videoNum: index,
                    course: courseName,
                    courseVids: courseVids,
                    testQuestions: [],
                  );

                  await BlocProvider.of<VideoCubit>(context)
                      .initController(context: context);

                  Navigator.pushNamed(context, VideoScreen.id);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cubit.doneLecs.contains(index) == true
                        ? Colors.green
                        : Colors.blueGrey,
                  ),
                  child: Center(
                      child: BodySmallText(
                    (index + 1).toString(),
                    weight: FontWeight.bold,
                  )),
                ),
              ).p8;
            },
            padding: const EdgeInsets.all(15),
            itemCount: courseVids.length,
          ),
        ),
      ],
    );
