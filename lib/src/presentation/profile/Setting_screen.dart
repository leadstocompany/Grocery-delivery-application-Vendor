import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: context.appColor.blackColor,
          ),
          onPressed: () {
            Navigator.pop(context); // Handle back button functionality
          },
        ),
        title: Text('Settings',
            style: context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'VERIFIED INFORMATION',
              style: context.subTitleStyle,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(10.h),
                  Text(
                    'Emekus Ventures',
                    style: context.subTitleTxtStyle,
                  ),
                  Gap(20.h),
                  Text(
                    'EmekusVentures @gmail.com',
                    style: context.subTitleTxtStyle,
                  ),
                  Gap(20.h),
                  Text(
                    '09032567890',
                    style: context.subTitleTxtStyle,
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Text(
              'PASSWORD',
              style: context.subTitleStyle,
            ),
            Gap(10.h),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  _showBottomSheet(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.lock_open_outlined,
                        color: context.appColor.greyColor),
                    Text(
                      'Change Password',
                      style: context.subTitleTxtStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the Bottom Sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.appColor.greyColor400),
            color: context.appColor.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Centered App Logo

              Align(
                alignment: Alignment.center,
                child: Text('Change Password', style: context.subTitleStyle),
              ),

              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  child: Text('Enter your new password',
                      textAlign: TextAlign.center,
                      style:
                          context.subTitleTextStyle.copyWith(fontSize: 13.sp)),
                ),
              ),
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
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              Center(
                child: SizedBox(
                  child: SizedBox(
                    width: double.infinity,
                    child: ButtonElevated(
                        text: 'Change Password',
                        onPressed: () {
                          Navigator.pop(context);
                          ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.success,
                                  title: "Password Reset Successful",
                                  text: ""));
                        },
                        backgroundColor: context.appColor.primarycolor),
                  ),
                ),
              ),
              Gap(10.h),
            ],
          ),
        );
      },
    );
  }


}
