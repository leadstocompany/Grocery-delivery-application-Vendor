import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/logic/provider/login_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class ForgetNewPassword extends StatefulWidget {
  const ForgetNewPassword({Key? key}) : super(key: key);

  @override
  State<ForgetNewPassword> createState() => _ForgetNewPasswordState();
}

class _ForgetNewPasswordState extends State<ForgetNewPassword> {
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  @override
  Widget build(BuildContext context) {
    final pageNotifier = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 16.w, top: 100.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.pleaseProvideUserName,
              style: context.subTitleTextStyle.copyWith(fontSize: 17.sp),
            ),
            Gap(20.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Password Field
                  CustomTextField(
                    controller: pageNotifier.newPassword,
                    obscureText: !_isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      final RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return 'Password must contain:\n'
                            '- At least one lowercase letter\n'
                            '- At least one uppercase letter\n'
                            '- At least one number\n'
                            '- At least one special character\n'
                            '- Minimum 8 characters';
                      }
                      return null;
                    },
                    maxLength: 64,
                    counterWidget: const Offstage(),
                    hintText: "Create new password",
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
                  Gap(10.h),

                  // Confirm Password Field
                  CustomTextField(
                    controller: pageNotifier.confirmsNewPassword,
                    obscureText: !_isConfirmPasswordVisible,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please confirm your password";
                      } else if (val != pageNotifier.confirmsNewPassword.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    maxLength: 64,
                    counterWidget: const Offstage(),
                    hintText: "Confirm password",
                    fillColor: context.appColor.greyColor100,
                    suffix: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ButtonElevated(
                  backgroundColor: context.appColor.primarycolor,
                  text: AppString.continueTxt,
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      var status = await pageNotifier.reset_password(context);
                      if (status) {
                        context.clearAndPush(routePath: MyRoutes.LOGIN);
                      } else {}
                    }
                  }),
            ),
            Gap(25.h),
            Gap(30.h),
          ],
        ),
      ),
    );
  }
}
