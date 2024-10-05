import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';


class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
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
                  controller: _passwordController,
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
                Gap(10.h),

                // Confirm Password Field
                CustomTextField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Please confirm your password";
                    } else if (val != _passwordController.text) {
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
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
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
                text: AppString.continueTxt,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.clearAndPush(routePath: MyRoutes.TERMANDCONDITIONS);
                    // Proceed with submission or next steps
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Passwords match and valid!')),
                    );
                  }
                }),
          ),
          Gap(25.h),
          Gap(30.h),
        ],
      ),
    );
  }
}
