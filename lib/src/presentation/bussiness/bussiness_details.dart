import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Assuming you're using screen util
// Import your CustomTextField and ButtonElevated

class DetailsBussiness extends StatelessWidget {
  const DetailsBussiness({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

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
        title: Text('Business Details',
            style: context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
      ),
      body: SingleChildScrollView(
        // Make the body scrollable
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20.h),
              Text(
                'Set Up Your Business Details',
                style: context.subTitleStyle,
              ),
              Gap(20.h),

              CircleAvatar(
                radius: 25.5.h,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 25.h,
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 25.5.h,
                      backgroundImage: AssetImage(
                        AppImages.profile,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(20.h),
              Text(
                'Business Information',
                style: context.subTitleStyle,
              ),
              Text(
                'Provide your business details',
                style: context.subTitleTxtStyle,
              ),
              Gap(20.h),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "Store Name";
                        }
                        return null;
                      },
                      maxLength: 64,
                      counterWidget: const Offstage(),
                      readOnly: true,
                      // controller: context.read<AuthCubit>().userName,
                      hintText: 'Emekus Ventures',
                      fillColor: context.appColor.whiteColor,
                      hintStyle: context.subTitleTextStyle,
                    ),
                    Gap(10.h),
                    CustomTextField(
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "Describe your business. e.g We sell fresh tomatoes";
                        }
                        return null;
                      },
                      maxLength: 64,
                      maxLines: 4,
                      readOnly: true,
                      counterWidget: const Offstage(),
                      // controller: context.read<AuthCubit>().userName,
                      hintText:
                          'Emekus Ventures is your home for everything foodstuff. We’ve got everything you need to make the best meals.',
                      fillColor: context.appColor.whiteColor,
                      hintStyle: context.subTitleTextStyle,
                    ),
                    Gap(10.h),
                    CustomTextField(
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "Official Phone Number";
                        }
                        return null;
                      },
                      maxLength: 64,
                      counterWidget: const Offstage(),
                      readOnly: true,
                      // controller: context.read<AuthCubit>().userName,
                      hintText: "09032986759",
                      hintStyle: context.subTitleTextStyle,
                      fillColor: context.appColor.whiteColor,
                    ),
                    Gap(10.h),
                    CustomTextField(
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "Address";
                        }
                        return null;
                      },
                      maxLength: 64,
                      counterWidget: const Offstage(),
                      readOnly: true,
                      // controller: context.read<AuthCubit>().userName,
                      hintText: 'Shop 231, Mile12, Lagos',
                      hintStyle: context.subTitleTextStyle,
                      fillColor: context.appColor.whiteColor,
                    ),
                    Gap(10.h),
                    CustomTextField(
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "GST Number (optional)";
                        }
                        return null;
                      },
                      maxLength: 64,
                      counterWidget: const Offstage(),
                      // controller: context.read<AuthCubit>().userName,
                      readOnly: true,
                      hintText: '782929627288289',
                      hintStyle: context.subTitleTextStyle,
                      fillColor: context.appColor.whiteColor,
                    ),
                    Gap(10.h),
                    CustomTextField(
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "Gumasta Number";
                        }
                        return null;
                      },
                      maxLength: 64,
                      counterWidget: const Offstage(),
                      // controller: context.read<AuthCubit>().userName,
                      readOnly: true,
                      hintText: 'WB67HUDY89HDHH',
                      hintStyle: context.subTitleTextStyle,
                      fillColor: context.appColor.whiteColor,
                    ),
                    Gap(10.h),
                    Container(
                        height: 150.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                AppImages.onboarding3,
                              )),
                        )),
                    Gap(10.h),
                  ],
                ),
              ),
              const Gap(5),

              const SizedBox(height: 16), // Add some spacing if necessary
            ],
          ),
        ),
      ),
    );
  }
}
