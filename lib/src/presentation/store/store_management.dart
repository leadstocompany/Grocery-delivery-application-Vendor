import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class StoreManagement extends StatelessWidget {
  const StoreManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return ChangeNotifierProvider(
        create: (context) => ProductProvider(),
        child: Scaffold(
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
            title: Text('Store Management',
                style:
                    context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
          ),
          body: Consumer<ProductProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                // Make the body scrollable
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your store opening and closing hour',
                      style: context.subTitleStyle,
                    ),
                    Gap(20.h),
                    _buildDropdown(context),
                    _daysList(context), // Corrected method call
                    Gap(20.h),
                    Text(
                      'Payment Information',
                      style: context.subTitleStyle,
                    ),

                    Gap(20.h),
                    Container(
                      height: 40.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: provider.selectedproducctQuentity.isNotEmpty
                            ? provider.selectedproducctQuentity
                            : null,
                        hint: Text(
                          'Select Products Quantity',
                          style: context.subTitleTxtStyleblack,
                        ),
                        items: provider.categories
                            .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category,
                                    style: context.buttonTestStyle,
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          provider.setProductQuentity(value!);
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: ''), // Removes default underline
                      ),
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
                            hintText: 'Emekus Ventures',
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
                            hintText: "09032986759",
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
                            readOnly: true,
                            hintText: 'WB67HUDY89HDHH',
                            hintStyle: context.subTitleTextStyle,
                            fillColor: context.appColor.whiteColor,
                          ),
                          Gap(10.h),
                          SizedBox(
                            width: double.infinity,
                            child: ButtonElevated(
                                text: 'Edit',
                                backgroundColor: context.appColor.primarycolor,
                                onPressed: () {}),
                          ),
                        ],
                      ),
                    ),
                    const Gap(5),
                    const SizedBox(height: 16), // Add some spacing if necessary
                  ],
                ),
              );
            },
          ),
        ));
  }

  Widget _buildDropdown(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40.h,
          width: 80.h,
          decoration: BoxDecoration(
            border: Border.all(color: context.appColor.greyColor400),
            color: context.appColor.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Day",
                  style: context.subTitleTxtStyleblack.copyWith(
                    color: context.appColor.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 40.h,
          width: 80.h,
          decoration: BoxDecoration(
            border: Border.all(color: context.appColor.greyColor400),
            color: context.appColor.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Open",
                  style: context.subTitleTxtStyleblack.copyWith(
                    color: context.appColor.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 40.h,
          width: 80.h,
          decoration: BoxDecoration(
            border: Border.all(color: context.appColor.greyColor400),
            color: context.appColor.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Close",
                  style: context.subTitleTxtStyleblack.copyWith(
                    color: context.appColor.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _daysList(BuildContext context) {
    final List<Map<String, String>> daysData = [
      {'day': 'Sunday', 'open': "09:30 AM", 'close': "05:00 PM"},
      {'day': 'Monday', 'open': "09:30 AM", 'close': "05:00 PM"},
      {'day': 'Tuesday', 'open': "09:30 AM", 'close': "05:00 PM"},
      {'day': 'Wednesday', 'open': "09:30 AM", 'close': "05:00 PM"},
      {'day': 'Thursday', 'open': "09:30 AM", 'close': "05:00 PM"},
      {'day': 'Friday', 'open': "09:30 AM", 'close': "05:00 PM"},
      {'day': 'Saturday', 'open': "09:30 AM", 'close': "05:00 PM"},
    ];

    return ListView.builder(
      shrinkWrap: true, // Make the ListView size to fit its children
      physics:
          NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
      itemCount: daysData.length,
      itemBuilder: (context, index) {
        final dayInfo = daysData[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dayInfo['day']!,
                style: context.subTitleTxtStyleblack.copyWith(
                  color: context.appColor.blackColor,
                ),
              ),
              Text(
                dayInfo['open']!,
                style: context.subTitleTxtStyleblack.copyWith(
                  color: context.appColor.blackColor,
                ),
              ),
              Text(
                dayInfo['close']!,
                style: context.subTitleTxtStyleblack.copyWith(
                  color: context.appColor.blackColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
