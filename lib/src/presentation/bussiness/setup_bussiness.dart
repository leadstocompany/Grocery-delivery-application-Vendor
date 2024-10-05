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

class SetupBussiness extends StatelessWidget {
  const SetupBussiness({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
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
                      // controller: context.read<AuthCubit>().userName,
                      hintText: 'Store Name',
                      fillColor: context.appColor.greyColor100,
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
                      counterWidget: const Offstage(),
                      // controller: context.read<AuthCubit>().userName,
                      hintText:
                          'Describe your business. e.g We sell fresh tomatoes',
                      fillColor: context.appColor.greyColor100,
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
                      // controller: context.read<AuthCubit>().userName,
                      hintText: "Official Phone Number",
                      fillColor: context.appColor.greyColor100,
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
                      // controller: context.read<AuthCubit>().userName,
                      hintText: 'Address',
                      fillColor: context.appColor.greyColor100,
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
                      hintText: 'GST Number (optional)',
                      fillColor: context.appColor.greyColor100,
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
                      hintText: 'Gumasta Number',
                      fillColor: context.appColor.greyColor100,
                    ),
                    Gap(10.h),
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: context.appColor.greyColor400),
                        color: context.appColor.greyColor200,

                        borderRadius: BorderRadius.all(Radius.circular(5.0)),

                        // width: ,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Upload shop Picture',
                              style: context.subTitleTxtStyleblack.copyWith(
                                color: context.appColor.lightBlackColor,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 100,
                              height: 25,
                              child: ButtonElevated(
                                text: 'Upload',
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    // Perform action on valid form
                                  }
                                },
                                fontSize: 10,
                                backgroundColor: context.appColor.primarycolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(10.h),
                  ],
                ),
              ),
              const Gap(5),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  AppString.max64Char,
                  style: context.smallTxtStyle,
                ),
              ),
              const SizedBox(height: 16), // Add some spacing if necessary
              SizedBox(
                width: double.infinity,
                child: ButtonElevated(
                  text: 'Save & Next',
                  onPressed: () {
                    context.push(MyRoutes.CREATESTORE);

                    // if (_formKey.currentState?.validate() ?? false) {
                    //   // Perform action on valid form
                    // }
                  },
                  backgroundColor: context.appColor.primarycolor,
                ),
              ),
              Gap(25.h),
              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
