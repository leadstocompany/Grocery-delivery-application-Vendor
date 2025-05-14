import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/presentation/pdf_viewer_page.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class PhoneScreen extends StatelessWidget {
  PhoneScreen({super.key});
  TextEditingController phoneController = TextEditingController();

  var country_code = "+91";

  @override
  Widget build(BuildContext context) {
    final pageNotifier = Provider.of<PageNotifier>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            maxLength: 10,
            controller: phoneController,
            onChanged: (value) {
              if (value.length == 10) {
                return;
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
                      country_code = value.toString();
                    },
                    initialSelection: 'IN',
                    favorite: const ['+91', 'IN'],
                    showCountryOnly: true,
                    showFlag: false,
                    showOnlyCountryWhenClosed: false,
                    showDropDownButton: false,
                    showFlagMain: false,
                    alignLeft: false,
                    padding: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(
                  height: 44,
                  width: 2,
                  child: VerticalDivider(
                    width: 1,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                const Gap(10)
              ],
            ),
            hintText: AppString.enterYourMobileNo,
            fillColor: Colors.transparent,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ButtonElevated(
              backgroundColor: context.appColor.primarycolor,
              text: AppString.getOtp,
              onPressed: () async {
                // pageNotifier.sendOtp(number)

                // pageNotifier.goToNextPage(); // Change page

                final number = phoneController.text;

                if (number.length == 10) {
                  final success =
                      await pageNotifier.sendOtp(number, context, country_code);

                  if (success) {
                    pageNotifier.goToNextPage(); // Change page
                  } else {
                    // Show error if OTP sending fails
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Failed to send OTP. Please try again."),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Enter a valid 10-digit phone number."),
                    ),
                  );
                }
              },
            ),
          ),
          Gap(10.h),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () 
              {
                context.push(MyRoutes.TERMANDCONDITION);
              },
              child: Text(
                "Terms of Services & Privacy Policy.",
                style: context.smallTxtStyle.copyWith(
                    fontSize: 12.sp,
                    color: context.appColor.secondary,
                    decoration: TextDecoration.underline,
                    decorationColor: context.appColor.secondary),
              ),
            ),
          ),
          Gap(15.h),
        ],
      ),
    );
  }
}
