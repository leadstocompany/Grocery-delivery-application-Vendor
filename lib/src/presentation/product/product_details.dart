import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class Productdetails extends StatelessWidget {
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
            Navigator.pop(context);
          },
        ),
        title: Text('Product Details',
            style: context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                     // provider.setQuantity(int.tryParse(value) ?? 1);
                    },
                    hintText: 'Rice',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),
                  CustomTextField(
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                     
                    },
                    hintText: 'Basmati Rice',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),
                  CustomTextField(
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                     
                    },
                    hintText: 'Mama Gold Premium Rice',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),
                  CustomTextField(
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                     // provider.setPrice(double.tryParse(value) ?? 0.0);
                    },
                    hintText: '1 kg',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),
                  CustomTextField(
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                      // provider
                      //     .setDiscountPrice(double.tryParse(value) ?? 0.0);
                    },
                    hintText: 'Very Good Long Grain Rice',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),
                  CustomTextField(
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                      // provider
                      //     .setDiscountPrice(double.tryParse(value) ?? 0.0);
                    },
                    hintText: '80 pieces',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),
                  CustomTextField(
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                      // provider
                      //     .setDiscountPrice(double.tryParse(value) ?? 0.0);
                    },
                    hintText: '45,000',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),
                  CustomTextField(
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                      // provider
                      //     .setDiscountPrice(double.tryParse(value) ?? 0.0);
                    },
                    hintText: 'Discount Price (Optional)',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),
                  SwitchListTile(
                    title: Text('Mark Product in stock'),
                    hoverColor: context.appColor.primarycolor,
                    value: provider.inStock,
                    activeColor: context.appColor.primarycolor,
                    onChanged: (value) {
                      provider.toggleStock(value);
                    },
                  ),
                  Gap(10.h),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonElevated(
                        text: 'Save Product',
                        backgroundColor: context.appColor.primarycolor,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  Gap(10.h),
                  Center(
                      child: SizedBox(
                          width: double.infinity,
                          child: ButtonElevated(
                            text: 'Delete Product',
                            textColor: context.appColor.redColor,
                            onPressed: () {
                              _showBottomSheet(context);
    
                              //context.clearAndPush(routePath: MyRoutes.LOGIN);
                            },
                            backgroundColor: context.appColor.whiteColor,
                            borderColor: context.appColor.redColor,
                          )))
                ],
              ),
            );
          },
        ),
      ),
       
       
    );
  }

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
                child: Text('Delete Product?', style: context.subTitleStyle),
              ),

              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  child: Text(
                      'Are you sure you want to delete this product? You won’t be able to undo this.',
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
                        text: 'Confirm',
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        backgroundColor: Color.fromARGB(255, 127, 51, 46)),
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
