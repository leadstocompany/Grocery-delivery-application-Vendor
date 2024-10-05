import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/terms_conditions.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';
// Import the provider

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TermsNotifier(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context); // Handle back button functionality
            },
          ),
          title: Text(
            'Terms & Conditions',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Agreement to Terms',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(10.h),
              Text(
                'By using this app, you agree to the following terms and conditions. Please read them carefully.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                ),
              ),
              Gap(20.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa.''',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Gap(20.h),

              // Checkbox and text
              Row(
                children: [
                  Consumer<TermsNotifier>(
                    builder: (context, termsNotifier, _) {
                      return Checkbox(
                        value: termsNotifier.isChecked,
                        onChanged: (bool? value) {
                          termsNotifier.toggleCheckbox(value ?? false);
                        },
                      );
                    },
                  ),
                  Text(
                    'I agree to the Terms and Conditions',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Gap(20.h),

              // Continue Button
              Consumer<TermsNotifier>(
                builder: (context, termsNotifier, _) {
                  return Center(
                    child: SizedBox(
                      width: 200,
                      child: SizedBox(
                        width: double.infinity,
                        child: ButtonElevated(
                          text: AppString.continueTxt,
                          onPressed: () {
                            if (termsNotifier.isChecked)
                              _showBottomSheet(context);
                          },
                          backgroundColor: termsNotifier.isChecked
                              ? context.appColor.primarycolor
                              : Color.fromARGB(255, 160, 239, 157),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Gap(20.h),
            ],
          ),
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
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Centered App Logo
              Center(
                child: Image.asset(
                  AppImages.applogo, // Replace with your logo path
                  height: 100.h, // Adjust height as necessary
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text('Create Account', style: context.subTitleStyle),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    'Set up your store and get your business ready for activation',
                    style: context.subTitleTextStyle),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  leading: Container(child: SvgPicture.asset(AppImages.icon1)),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Add business information',
                        style: context.subTitleStyle,
                      ),
                      Text(
                        'Add more information about your business',
                        style: context.subTitleTxtStyle,
                      ),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  leading: Container(child: SvgPicture.asset(AppImages.icon2)),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Set-up your store',
                        style: context.subTitleStyle,
                      ),
                      Text(
                        'Create and customise your online store',
                        style: context.subTitleTxtStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  child: SizedBox(
                    width: double.infinity,
                    child: ButtonElevated(
                        text: 'Continue to Setup',
                        onPressed: () {
                          print("lksdjfhgjdfghkldkfjghjkld");
                          context.clearAndPush(
                              routePath: MyRoutes.SETUPBUSSINESS);
                        },
                        backgroundColor: context.appColor.primarycolor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }



}
