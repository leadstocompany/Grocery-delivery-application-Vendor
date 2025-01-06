import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/login_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  // Add a TextEditingController for the phone number if needed.
  String countryCode = "+91";
  @override
  Widget build(BuildContext context) {
    final pageNotifier = Provider.of<LoginProvider>(context, listen: false);
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Forget Password',
            style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20.h),
              Text(
                AppString.enterYourPhoneNumber,
                style: context.subTitleTextStyle.copyWith(fontSize: 18.sp),
              ),
              Gap(5.h),
              Text(
                AppString.otpWillbeSendNumber,
                style: context.smallTxtStyle.copyWith(fontSize: 13.sp),
              ),
              Gap(20.h),
              CustomTextField(
                controller: pageNotifier.phoneController,
                maxLength: 10,
                onChanged: (value) {
                  if (value.length > 10) {
                    pageNotifier.phoneController.text = value.substring(0, 10);
                    pageNotifier.phoneController.selection =
                        TextSelection.fromPosition(
                      TextPosition(
                          offset: pageNotifier.phoneController.text.length),
                    );
                  }
                },
                counterWidget: const Offstage(),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyBoardType: TextInputType.number,
                prefix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 65,
                      child: CountryCodePicker(
                        textStyle: context.bodyTxtStyle,
                        onChanged: (value) {
                          countryCode = value.toString();
                          // Handle country code change if needed
                        },
                        initialSelection: 'IN',
                        favorite: const ['+91', 'IN'],
                        showCountryOnly: true,
                        showFlag: false,
                        alignLeft: false,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(
                      height: 44,
                      width: 2,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    const Gap(10),
                  ],
                ),
                hintText: AppString.enterYourMobileNo,
                fillColor: Colors.transparent,
              ),
              Gap(300.h),
              SizedBox(
                width: double.infinity,
                child: ButtonElevated(
                  backgroundColor: context.appColor.primarycolor,
                  text: AppString.getOtp,
                  onPressed: () async {
                    final phoneNumber =
                        pageNotifier.phoneController.text.trim();
                    if (phoneNumber.length == 10) {
                      var status = await pageNotifier.forgetPassword(
                          context, countryCode);
                      if (status) {
                        context.push(MyRoutes.VERIFYPASSWORD);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Enter a valid 10-digit phone number."),
                        ),
                      );
                    }
                  },
                ),
              ),
              Gap(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
