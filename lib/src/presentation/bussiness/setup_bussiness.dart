import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/logic/provider/crate_store_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Assuming you're using screen util
// Import your CustomTextField and ButtonElevated

class SetupBussiness extends StatelessWidget {
  final String status;
  SetupBussiness({super.key, required this.status});

  ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final createStoreprovider =
        Provider.of<DaySelectionProvider>(context, listen: false);

    return Scaffold(
      appBar: status == "0"
          ? AppBar(
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
              title: Text('Set Up Your Business Details',
                  style: context.subTitleTextStyleBloack
                      .copyWith(fontSize: 16.sp)),
            )
          : AppBar(),
      body: SingleChildScrollView(
        // Make the body scrollable
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      controller: createStoreprovider.storeName,
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
                      controller: createStoreprovider.storeDescription,
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
                      controller: createStoreprovider.officialPhoneNumber,
                      keyBoardType: TextInputType.number,
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "Official Phone Number";
                        }
                        return null;
                      },
                      maxLength: 10,
                      counterWidget: const Offstage(),
                      // controller: context.read<AuthCubit>().userName,
                      hintText: "Official Phone Number",
                      fillColor: context.appColor.greyColor100,
                    ),
                    Gap(10.h),
                    CustomTextField(
                      controller: createStoreprovider.storeAddress,
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
                      controller: createStoreprovider.storeGSTNumber,
                      keyBoardType: TextInputType.number,
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "GST Number (optional)";
                        }
                        return null;
                      },
                      maxLength: 20,
                      counterWidget: const Offstage(),
                      // controller: context.read<AuthCubit>().userName,
                      hintText: 'GST Number (optional)',
                      fillColor: context.appColor.greyColor100,
                    ),
                    Gap(10.h),
                    CustomTextField(
                      controller: createStoreprovider.storeGumastaNumber,
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
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Consumer<DaySelectionProvider>(
                              builder: (context, imageProvider, child) {
                                return Container(
                                  width: 200.w,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    imageProvider.selectedImage == null
                                        ? 'Upload shop Picture'
                                        : imageProvider.selectedImage!.path
                                            .split('/')
                                            .last,
                                    style:
                                        context.subTitleTxtStyleblack.copyWith(
                                      color: context.appColor.lightBlackColor,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Spacer(),
                            SizedBox(
                              width: 100,
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () async {
                                  createStoreprovider.pickImage(context);

                                  // final XFile? pickedFile = await _picker
                                  //     .pickImage(source: ImageSource.gallery);
                                  // if (pickedFile != null) {
                                  //   // Update the image in the provider

                                  //   context
                                  //       .read<DaySelectionProvider>()
                                  //       .setImage(File(pickedFile.path));
                                  // }
                                },
                                child: Text(
                                  'Upload',
                                  style: TextStyle(fontSize: 10),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      context.appColor.primarycolor),
                                ),
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
                child: Consumer<DaySelectionProvider>(
                    builder: (context, imageProvider, child) {
                  return ButtonElevated(
                    text: status == "0" ? "Save details" : 'Save & Next',
                    onPressed: imageProvider.isImageLoading
                        ? () {
                            if (status == "0") {
                              Navigator.pop(context);
                              _showBottomSheet(context);
                            } else {
                              if (_formKey.currentState?.validate() ?? false) {
                                print("kjdfhgkjgh");
                                context.push(MyRoutes.CREATESTORE);
                              }
                            }
                          }
                        : null,
                    backgroundColor: imageProvider.isImageLoading
                        ? context.appColor.primarycolor
                        : context.appColor.greyColor,
                  );
                }),
              ),
              Gap(25.h),
              Gap(30.h),
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
          decoration: BoxDecoration(
            border: Border.all(color: context.appColor.greyColor400),
            color: context.appColor.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
          ),
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
                alignment: Alignment.center,
                child: Text('Details Saved', style: context.subTitleStyle),
              ),

              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  child: Text('Your details have been saved successfully',
                      textAlign: TextAlign.center,
                      style:
                          context.subTitleTextStyle.copyWith(fontSize: 13.sp)),
                ),
              ),
              Gap(20.h),
              Center(
                child: SizedBox(
                  child: SizedBox(
                    width: double.infinity,
                    child: ButtonElevated(
                        text: 'View Account',
                        onPressed: () {
                          Navigator.pop(context);
                          context.push(MyRoutes.DETAILSBUSSINESS);
                        },
                        backgroundColor: context.appColor.primarycolor),
                  ),
                ),
              ),
              Gap(10.h),
              Center(
                  child: SizedBox(
                      width: double.infinity,
                      child: ButtonElevated(
                        text: 'Skip for Later',
                        textColor: context.appColor.primarycolor,
                        onPressed: () {
                          Navigator.pop(context);

                          //context.clearAndPush(routePath: MyRoutes.LOGIN);
                        },
                        backgroundColor: context.appColor.whiteColor,
                        borderColor: context.appColor.primarycolor,
                      )))
            ],
          ),
        );
      },
    );
  }
}
