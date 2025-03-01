import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _numbersOnly = '';

  String _extractNumbers(String input) {
    final RegExp numberRegExp = RegExp(r'\d+');
    final Iterable<RegExpMatch> matches = numberRegExp.allMatches(input);
    final String numbers = matches.map((m) => m.group(0)).join();
    return numbers;
  }

  String? _otpCode;

  // @override
  // void initState() {
  //   super.initState();
  //   listenForCode(); // Start listening for OTP code from SMS
  // }

  // @override
  // void codeUpdated() {
  //   setState(() {
  //     _otpCode = code; // Update the OTP code when received
  //   });
  // }

  // @override
  // void dispose() {
  //   cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final pageNotifier = Provider.of<PageNotifier>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "",
            style: context.subTitleTextStyle.copyWith(fontSize: 20.sp),
          ),
          Gap(10.h),
          Row(
            children: [
              // SizedBox(
              //     height: 18,
              //     width: 18,
              //     child: CircularProgressIndicator(
              //       strokeWidth: 2.5,
              //       backgroundColor: context.appColor.primary.withOpacity(0.4),
              //     )),
              const Gap(
                8,
              ),
              Text(
                AppString.autofetchingOTP,
                style: context.smallTxtStyle.copyWith(fontSize: 13.sp),
              ),
            ],
          ),
          Gap(10.h),
          // Pinput(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          //   length: 6,
          //   defaultPinTheme: PinTheme(
          //     padding: EdgeInsets.symmetric(
          //       vertical: 10.h,
          //       horizontal: 12.w,
          //     ),
          //     decoration: BoxDecoration(
          //       color: context.appColor.greyColor100,
          //       borderRadius: BorderRadius.circular(4.r),
          //       border:
          //           Border.all(color: context.appColor.greyColor400, width: 1),
          //     ),
          //     textStyle: context.subTitleTextStyle.copyWith(fontSize: 20.sp),
          //   ),
          //   focusedPinTheme: PinTheme(
          //     decoration: BoxDecoration(
          //       color: context.appColor.greyColor100,
          //       borderRadius: BorderRadius.circular(4.r),
          //       border: Border.all(color: context.appColor.primary, width: 1),
          //     ),
          //     padding: EdgeInsets.symmetric(
          //       vertical: 10.h,
          //       horizontal: 12.w,
          //     ),
          //     textStyle: context.subTitleTextStyle.copyWith(fontSize: 20.sp),
          //   ),
          //   onChanged: (value) {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(
          //         content: Text("Enter a valid otp"),
          //       ),
          //     );
          //   },
          //   onCompleted: (value) async {
          //     // Only call `goToNextPage` once when the OTP is fully entered

          //     final success = await pageNotifier.verifiOtp(value, context);

          //     if (success) {
          //       pageNotifier.goToNextPage(); // Change page
          //     } else {
          //       // Show error if OTP sending fails
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text("Failed to send OTP. Please try again."),
          //         ),
          //       );
          //     }
          //   },
          // ),

          Pinput(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            length: 6,
            defaultPinTheme: PinTheme(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
              textStyle: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
            focusedPinTheme: PinTheme(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 12.w,
              ),
              textStyle: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
            controller: TextEditingController(text: _otpCode),
            onChanged: (value) {
              _otpCode = value;
            }, // Autofill OTP

            onCompleted: (value) async {
              _otpCode = value.toString();
              final success = await pageNotifier.verifiOtp(value, context);

              if (success) {
                pageNotifier.goToNextPage(); // Change page
              } else {
                // Show error if OTP sending fails
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.grey,
                    content: Text("Failed to send OTP. Please try again."),
                  ),
                );
              }
            },
          ),
          Gap(20.h),

          // Align(
          //     alignment: Alignment.center,
          //     child: TextButton(
          //       onPressed: () async {},
          //       child: Text(
          //         AppString.resend,
          //         style: context.buttonTxtStyle
          //             .copyWith(color: context.appColor.primary),
          //       ),
          //     )),

          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: ButtonElevated(
                  backgroundColor: context.appColor.primarycolor,
                  text: AppString.continueTxt,
                  onPressed: () async {
                    if (_otpCode!.length > 6) {
                      _otpCode = _otpCode.toString();
                      final success =
                          await pageNotifier.verifiOtp(_otpCode!, context);

                      if (success) {
                        pageNotifier.goToNextPage(); // Change page
                      } else {
                        // Show error if OTP sending fails
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.grey,
                            content:
                                Text("Failed to send OTP. Please try again."),
                          ),
                        );
                      }
                    } else {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     backgroundColor: Colors.grey,
                      //     content: Text("Please enter a valid OTP."),
                      //   ),
                      // );
                    }
                  })),
          Gap(15.h),

          Gap(30.h),
        ],
      ),
    );
  }
}
