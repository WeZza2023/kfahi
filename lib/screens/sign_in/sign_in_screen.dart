import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kfahi/constants/custom_texts.dart';
import 'package:kfahi/constants/size.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/sign_in/sign_in_cubit.dart';
import 'package:kfahi/screens/sign_in/sign_in_state.dart';
import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../generated/l10n.dart';
import '../home/home_screen.dart';
import '../sing_up/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static String id = 'SignInScreen';
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignInCubit>(context);
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccessState || state is AutoSignInSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.id,
            (route) => false,
          );
        } else if (state is InActiveState) {
          ScaffoldMessenger.of(context).showSnackBar(
            AppSnackBar(message: S.of(context).your_account_is_not_active),
          );
        } else if (state is SignInErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(AppSnackBar(
            error: true,
            message: S.of(context).email_or_password_incorrect,
          ));
        }
      },
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
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: AppSizes.getScreenHeight(context) * 0.4,
                      width: AppSizes.getScreenWidth(context),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(
                                AppSizes.getBaseScale(context) * 80)),
                      ),
                      child: Image.asset(
                        "assets/images/logo.x.png",
                        scale: AppSizes.getBaseScale(context) * 15,
                      ),
                    ),
                    Container(
                      height: AppSizes.getScreenHeight(context) * 0.6,
                      width: AppSizes.getScreenWidth(context),
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(
                                AppSizes.getBaseScale(context) * 80)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BodyTooLargeText(
                              S.of(context).sign_in,
                              color: Colors.white,
                              weight: FontWeight.bold,
                            ).tp(AppSizes.getBaseScale(context) * 25),
                            CustomTextField(
                              isEnabled: state is AutoSignInLoadingState
                                  ? false
                                  : true,
                              controller: emailController,
                              hintText: S.of(context).email,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).please_enter_your_email;
                                }
                                return null;
                              },
                            ).p16.tP25,
                            CustomTextField(
                              isEnabled: state is AutoSignInLoadingState
                                  ? false
                                  : true,
                              controller: passwordController,
                              hintText: S.of(context).password,
                              obscureText: true,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return S
                                      .of(context)
                                      .please_enter_your_password;
                                }
                                return null;
                              },
                            ).p16,
                            state is SignInLoadingState ||
                                    state is AutoSignInLoadingState
                                ? AppLoadingIndicator(context: context).bP16
                                : CustomButton(
                                    text: S.of(context).sign_in,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.signInWithEmailPassword(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                    color: kActiveColor,
                                  ).bP25,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BodyExtraSmallText(
                                  S.of(context).dont_have_an_account,
                                  color: Colors.white,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, SignUpScreen.id);
                                  },
                                  child: BodyExtraSmallText(
                                    S.of(context).sign_up,
                                    color: Colors.white,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    const url = 'https://bit.ly/3Dxkk5c';
                                    await cubit.launchURL(url);
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.blue,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    const url =
                                        'https://www.youtube.com/@KFAHI';
                                    await cubit.launchURL(url);
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.youtube,
                                    color: Colors.red,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    const url = 'https://wa.me/+201025173298';
                                    await cubit.launchURL(url);
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.whatsapp,
                                    color: Colors.green,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    const url = 'https://bit.ly/3Y8c30Q';
                                    await cubit.launchURL(url);
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.telegram,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ).tp(50),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
