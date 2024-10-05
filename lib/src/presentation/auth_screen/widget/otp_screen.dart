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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String _numbersOnly = '';

  String _extractNumbers(String input) {
    final RegExp numberRegExp = RegExp(r'\d+');
    final Iterable<RegExpMatch> matches = numberRegExp.allMatches(input);
    final String numbers = matches.map((m) => m.group(0)).join();
    return numbers;
  }

  @override
  void dispose() {
    super.dispose();
  }

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
          Pinput(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            length: 6,
            defaultPinTheme: PinTheme(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: context.appColor.greyColor100,
                borderRadius: BorderRadius.circular(4.r),
                border:
                    Border.all(color: context.appColor.greyColor400, width: 1),
              ),
              textStyle: context.subTitleTextStyle.copyWith(fontSize: 20.sp),
            ),
            focusedPinTheme: PinTheme(
              decoration: BoxDecoration(
                color: context.appColor.greyColor100,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: context.appColor.primary, width: 1),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 12.w,
              ),
              textStyle: context.subTitleTextStyle.copyWith(fontSize: 20.sp),
            ),
            onChanged: (value) {
              // Optionally handle intermediate changes if needed
              // But do not call `pageNotifier.goToNextPage()` here
            },
            onCompleted: (value) {
              // Only call `goToNextPage` once when the OTP is fully entered
              print("OTP Completed: $value");
              pageNotifier.goToNextPage();
            },
          ),

          Gap(20.h),

          Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // context.read<AuthCubit>().resendOtp();
                },
                child: Text(
                  AppString.resend,
                  style: context.buttonTxtStyle
                      .copyWith(color: context.appColor.primary),
                ),
              )),

          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: ButtonElevated(
                  backgroundColor: context.appColor.primarycolor,
                  text: AppString.continueTxt,
                  onPressed: () {})),
          Gap(15.h),
          // Align(

          // Align(
          //   alignment: Alignment.center,
          //   child: RichText(
          //     text: TextSpan(
          //       text: AppString.byClickingContinue,
          //       style: context.smallTxtStyle.copyWith(fontSize: 13.sp),
          //       children: <TextSpan>[
          //         TextSpan(
          //             text: AppString.termService,
          //             recognizer: TapGestureRecognizer(),
          //             //   ..onTap = () => context.push(MyRoutes.TERM_CONDITION),
          //             style: TextStyle(color: context.appColor.secondary)),
          //         const TextSpan(
          //           text: " ${AppString.and} ",
          //         ),
          //         TextSpan(
          //             recognizer: TapGestureRecognizer(),
          //             //   ..onTap = () => context.push(MyRoutes.PRIVACY_POLICY),
          //             text: AppString.privacyPolicy,
          //             style: TextStyle(color: context.appColor.secondary)),
          //       ],
          //     ),
          //   ),
          // ),

          Gap(30.h),
        ],
      ),
    );
  }
}
