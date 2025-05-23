import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/logic/provider/home_provider.dart';
import 'package:vendor_app/src/logic/provider/login_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final pageNotifier = Provider.of<LoginProvider>(context, listen: false);
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(100.h),
              Image.asset(
                AppImages.applogo,
                height: 200,
                width: 350,
              ),
              Text(
                'Welcome back,',
                style: context.subTitleTextStyle.copyWith(fontSize: 17.sp),
              ),
              Gap(20.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: pageNotifier.emailOrPasswordController,
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "Please enter your phone number";
                        }
                        return null;
                      },
                      maxLength: 10,
                      counterWidget: const Offstage(),
                      // controller: context.read<AuthCubit>().userName,
                      hintText: 'Enter phone number',
                      fillColor: context.appColor.greyColor100,
                    ),
                    Gap(10.h),
                    CustomTextField(
                      controller: pageNotifier.passwordController,
                      obscureText: !_isPasswordVisible,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter a password";
                        } else if (val.length < 6) {
                          return "Password must be at least 6 characters long";
                        }
                        return null;
                      },
                      maxLength: 64,
                      counterWidget: const Offstage(),
                      hintText: "Enter password",
                      fillColor: context.appColor.greyColor100,
                      suffix: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(5),
              GestureDetector(
                onTap: () {
                  context.push(MyRoutes.FORGETPASSWORD);
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Forgot Password?',
                    style: context.smallTxtStyle
                        .copyWith(color: context.appColor.primarycolor),
                  ),
                ),
              ),
              // const Spacer(),
              Gap(50.h),
              SizedBox(
                width: double.infinity,
                child: ButtonElevated(
                    backgroundColor: context.appColor.primarycolor,
                    text: AppString.continueTxt,
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        var status = await pageNotifier.login(context);
                        if (status) 
                        {
                          //  context.push(MyRoutes.DASHBOARDSCREEN);
                          Provider.of<HomeProvider>(context, listen: false)
                              .getMe(context);
                          //     print(
                          //     "dfdfdfdffd  ${await SharedPrefUtils.getStoreId()}");
                          // if (await SharedPrefUtils.getStoreId() == null)
                          // {
                          //   print("jdhfgkdkfgkdfkjgjf");
                          // } else {
                          //   print(
                          //       "jdhfgkdkfgkdfkjgjf  ${await SharedPrefUtils.getStoreId()}");

                          // }
                        }

                        //
                      }
                    }),
              ),

              Gap(25.h),
              Gap(10.h),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    context.push(MyRoutes.SIGNUP);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: context.smallTxtStyle.copyWith(fontSize: 13.sp),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: context.appColor.primarycolor))
                      ],
                    ),
                  ),
                ),
              ),

              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
