import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:kfahi/constants/custom_texts.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:lottie/lottie.dart';

import '../constants/colors.dart';
import '../constants/size.dart';
import '../generated/l10n.dart';

Widget CustomTextField({
  required hintText,
  bool? isEnabled,
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
  required context,
  String? title,
  bool showBackButton = true,
  Function()? onTapBack,
  bool showDrawer = false,
}) {
  return AppBar(
    backgroundColor: kMainColor,
    automaticallyImplyLeading: false,
    leading: showBackButton == true
        ? IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: kMainColor,
            ),
            onPressed: onTapBack,
          )
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

Widget MainItem({
  required Function() function,
  required List<Color> color,
  required String title,
}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20),
    child: InkWell(
      splashColor: kMainColor,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        topLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
        topRight: Radius.circular(60),
      ),
      onTap: function,
      child: Container(
        width: 180,
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: color,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(color: kMainColor),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
            topRight: Radius.circular(60),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
      ).bP25,
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
  required String img,
  required String sub,
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
          leading: Image.network(
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
          ).hP16,
          childrenPadding: EdgeInsets.all(AppSizes.getBaseScale(context) * 15),
          children: [
            Image.network(
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
            ).hP16.hP25,
            BodyLargeText(
              sub,
              maxLines: 20,
              textAlign: TextAlign.center,
              weight: FontWeight.normal,
            ),
          ],
        ).p16,
      ).bP25,
    );

Widget AppDrawer({
  required BuildContext context,
  required Widget children,
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
          child: Column(
            children: [
              AdvancedAvatar(
                size: AppSizes.getBaseScale(context) * 50,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: AppSizes.getBaseScale(context) * 30,
                ),
              ).vP25,
              children,
            ],
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
