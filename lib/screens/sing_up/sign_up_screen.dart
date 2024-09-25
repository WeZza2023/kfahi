import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/sing_up/sign_up_cubit.dart';
import 'package:kfahi/screens/sing_up/sign_up_state.dart';
import '../../components/components.dart';
import '../../constants/colors.dart';
import '../../constants/custom_texts.dart';
import '../../constants/size.dart';
import '../../generated/l10n.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static String id = 'SignUpScreen';

  static final formKey = GlobalKey<FormState>();
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignUpCubit>(context);
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showDialog(
            context: context,
            builder: (context) => AppPopupDialog(
              title: S.of(context).your_acc_has_been_created_successfully,
              body: [
                BodySmallText(
                  S.of(context).copy_code_and_contact_support,
                  maxLines: 3,
                ).vP16,
                CustomButton(
                    text: S.of(context).contact_support,
                    onPressed: () {
                      cubit.launchWhatsApp();
                    },
                    color: kActiveColor),
                CustomButton(
                    text: S.of(context).copy_code,
                    onPressed: () {
                      cubit.copyCode(context: context);
                    },
                    color: kActiveColor),
              ],
            ),
          );
        } else if (state is SignUpErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(AppSnackBar(
            error: true,
            message: S.of(context).something_went_wrong_please_try_again,
          ));
        } else if (state is WeakPasswordState) {
          ScaffoldMessenger.of(context).showSnackBar(AppSnackBar(
            error: true,
            message: S.of(context).weak_password,
          ));
        } else if (state is InvalidEmailState) {
          ScaffoldMessenger.of(context).showSnackBar(AppSnackBar(
            error: true,
            message: S.of(context).make_sure_you_entered_the_correct_email,
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
                      height: AppSizes.getScreenHeight(context) * 0.2,
                      width: AppSizes.getScreenWidth(context),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(
                                AppSizes.getBaseScale(context) * 80)),
                      ),
                      child: Image.asset(
                        "assets/images/logo.x.png",
                      ),
                    ),
                    Container(
                      height: AppSizes.getScreenHeight(context) * 0.8,
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
                              S.of(context).sign_up,
                              color: Colors.white,
                              weight: FontWeight.bold,
                            ).tp(AppSizes.getBaseScale(context) * 25),
                            InkWell(
                              onTap: () {
                                cubit.pickImage();
                              },
                              child: AdvancedAvatar(
                                size: AppSizes.getBaseScale(context) * 100,
                                decoration: BoxDecoration(
                                    border: cubit.hasImage == false
                                        ? Border.all(
                                            color: Colors.red, width: 2)
                                        : null,
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: cubit.pickedImage == null
                                    ? Icon(
                                        Icons.photo,
                                        color: kMainColor,
                                        size:
                                            AppSizes.getBaseScale(context) * 30,
                                      )
                                    : Image.file(
                                        File(cubit.pickedImage!.path),
                                        fit: BoxFit.cover,
                                      ),
                              ).tP25,
                            ),
                            if (cubit.hasImage == false)
                              BodySmallText(
                                S.of(context).please_select_profile_picture,
                                color: Colors.red,
                                weight: FontWeight.normal,
                              ).tP4,
                            const Divider(
                              color: Colors.transparent,
                            ),
                            CustomTextField(
                              controller: nameController,
                              hintText: S.of(context).name,
                              keyboardType: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).please_enter_your_name;
                                }
                                return null;
                              },
                            ).p16,
                            CustomTextField(
                              controller: phoneController,
                              hintText: S.of(context).phone,
                              keyboardType: TextInputType.phone,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).please_enter_your_phone;
                                }
                                return null;
                              },
                            ).p16,
                            CustomTextField(
                              controller: emailController,
                              hintText: S.of(context).email,
                              keyboardType: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).please_enter_your_email;
                                }
                                return null;
                              },
                            ).p16,
                            CustomTextField(
                              controller: passwordController,
                              hintText: S.of(context).password,
                              keyboardType: TextInputType.text,
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
                            state is SignUpLoadingState
                                ? AppLoadingIndicator(context: context).bP25
                                : CustomButton(
                                    text: S.of(context).sign_up,
                                    onPressed: () {
                                      cubit.checkImage();

                                      if (formKey.currentState!.validate() &&
                                          cubit.pickedImage != null) {
                                        cubit.signUpWithEmailPassword(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            name: nameController.text,
                                            phone: phoneController.text);
                                      }
                                    },
                                    color: kActiveColor,
                                  ).bP25,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BodyExtraSmallText(
                                  S.of(context).already_have_an_account,
                                  color: Colors.white,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: BodyExtraSmallText(
                                    S.of(context).sign_in,
                                    color: Colors.white,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ).bP25,
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
