import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/logic/provider/crate_store_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class UpdateStoreScreen extends StatelessWidget {
  final String storeId;
  UpdateStoreScreen({super.key, required this.storeId});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final createStoreprovider =
        Provider.of<DaySelectionProvider>(context, listen: false);
    print("djfgh  ${storeId}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: context.appColor.blackColor,
          ),
          onPressed: () 
          {
            Navigator.pop(context); // Handle back button functionality
          },
        ),
        title: Text('Store Management',
            style: context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20.h),
            Text(
              'Update Store Management',
              style: context.subTitleStyle,
            ),
            Gap(30.h),
            Text(
              'Specify your store opening and closing hour',
              style: context.subTitleTxtStyle,
            ),
            Gap(20.h),
            Row(
              children: [
                _buildDayDropdown(context), // Dropdown for days
                Gap(10.w),
                _buildOpenTiming(context),
                Gap(10.w),
                _buildClosedTiming(context),
              ],
            ),
            Gap(20.h),
            Consumer<DaySelectionProvider>(
              builder: (context, provider, _) {
                return Wrap(
                  children: provider.selectedDays
                      .map((day) => _buildSelectedDayChip(context, day))
                      .toList(),
                );
              },
            ),
            Gap(10.h),
            Text(
              'Payment Information',
              style: context.subTitleStyle
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 14.sp),
            ),
            Gap(20.h),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: createStoreprovider.bankName,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Bank Name ";
                      }

                      return null;
                    },
                    maxLength: 64,
                    counterWidget: const Offstage(),
                    hintText: "Bank Name ",
                    fillColor: context.appColor.greyColor100,
                  ),
                  Gap(10.h),
                  CustomTextField(
                    controller: createStoreprovider.accountHoldername,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Account Holder Name ";
                      }
                      return null;
                    },
                    maxLength: 64,
                    counterWidget: const Offstage(),
                    hintText: "Account Holder Name ",
                    fillColor: context.appColor.greyColor100,
                  ),
                  Gap(10.h),
                  CustomTextField(
                    controller: createStoreprovider.accountNumber,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Account Number";
                      }
                      return null;
                    },
                    maxLength: 64,
                    counterWidget: const Offstage(),
                    hintText: 'Account Number',
                    fillColor: context.appColor.greyColor100,
                  ),
                  Gap(10.h),
                  CustomTextField(
                    controller: createStoreprovider.ifscCode,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "IFSC Code";
                      }
                      return null;
                    },
                    maxLength: 64,
                    counterWidget: const Offstage(),
                    hintText: 'IFSC Code',
                    fillColor: context.appColor.greyColor100,
                  ),
                  Gap(10.h),
                  Text(
                    'UPI ID',
                    style: context.subTitleTxtStyle,
                  ),
                  Gap(4.h),
                  CustomTextField(
                    controller: createStoreprovider.upiID,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Upi Id";
                      }
                      return null;
                    },
                    maxLength: 64,
                    counterWidget: const Offstage(),
                    hintText: 'UPI ID',
                    fillColor: context.appColor.greyColor100,
                  ),
                  Gap(10.h),
                  Text(
                    'QR Code',
                    style: context.subTitleTxtStyle,
                  ),
                  Gap(4.h),
                  Consumer<DaySelectionProvider>(
                      builder: (context, pinProvider, child) {
                    return Container(
                      height: 150.h,
                      width: double.infinity,
                      child: pinProvider.selectedBarcodeImage == null
                          ? Image.network(
                              pinProvider.store_model!.paymentDetails!.qrCode ??
                                  "",
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              pinProvider.selectedBarcodeImage!,
                              fit: BoxFit.cover,
                            ),
                    );
                  }),
                  Gap(10.h),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonElevated(
                      text: 'Update Qr code',
                      onPressed: () async {
                        createStoreprovider.pickbarCodeImage(context);
                      },
                      backgroundColor: context.appColor.greyColor,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20.h),
            SizedBox(
              width: double.infinity,
              child: ButtonElevated(
                text: 'Update',
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) 
                  {
                    print(
                        "lkjdfhgkfdhgkjkfdjgh    ${createStoreprovider.upiID.text}");
                    _showBottomSheet(context, createStoreprovider);
                  }
                },
                backgroundColor: context.appColor.primarycolor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dropdown for selecting days with checkboxes using PopupMenuButton
  Widget _buildDayDropdown(BuildContext context) {
    final List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    return Consumer<DaySelectionProvider>(
      builder: (context, provider, _) {
        return Container(
          height: 40.h,
          width: 90.h,
          decoration: BoxDecoration(
            border: Border.all(color: context.appColor.greyColor400),
            color: context.appColor.greyColor200,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<String>(
              onSelected: (String day) {
                provider.toggleDay(day);
              },
              itemBuilder: (context) {
                return days.map((String day) {
                  return PopupMenuItem<String>(
                    value: day,
                    child: Row(
                      children: [
                        Checkbox(
                          value: provider.selectedDays.contains(day),
                          onChanged: (bool? value) {
                            provider.toggleDay(day);
                          },
                        ),
                        Text(day),
                      ],
                    ),
                  );
                }).toList();
              },
              child: Row(
                children: [
                  Text(
                    'Days',
                    style: context.subTitleTxtStyleblack.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Display selected days below the dropdown
  Widget _buildSelectedDayChip(BuildContext context, String day) {
    return Chip(
      label: Text(day),
      deleteIcon: Icon(Icons.clear),
      onDeleted: () {
        context.read<DaySelectionProvider>().removeDay(day);
      },
    );
  }

  // Helper method to build the open/close dropdown container
  Widget _buildOpenTiming(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<DaySelectionProvider>(context, listen: false)
          .Opening(context),
      child: Container(
        height: 40.h,
        width: 90.h,
        decoration: BoxDecoration(
          border: Border.all(color: context.appColor.greyColor400),
          color: context.appColor.greyColor200,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Consumer<DaySelectionProvider>(
                builder: (context, timeProvider, child) {
                  return Text(
                    timeProvider.selectedTime,
                    style: TextStyle(color: Colors.black),
                  );
                },
              ),
              const Spacer(),
              const Icon(Icons.access_time_rounded),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClosedTiming(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<DaySelectionProvider>(context, listen: false)
          .closedTiming(context),
      child: Container(
        height: 40.h,
        width: 90.h,
        decoration: BoxDecoration(
          border: Border.all(color: context.appColor.greyColor400),
          color: context.appColor.greyColor200,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Consumer<DaySelectionProvider>(
                builder: (context, timeProvider, child) {
                  return Text(
                    timeProvider.selectedClosedTime,
                    style: TextStyle(color: Colors.black),
                  );
                },
              ),
              const Spacer(),
              const Icon(Icons.access_time_rounded),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(
      BuildContext context, DaySelectionProvider createStoreprovider) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Consumer<DaySelectionProvider>(
            builder: (context, pinProvider, child) {
          return Container(
            padding: EdgeInsets.all(20.w),
            child: Column(
              //mainAxisSize: MainAxisSize.max,
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
                  child: Text('Withdrawal Pin', style: context.subTitleStyle),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text('Create your ọjà withdrawal pin ',
                      style: context.subTitleTextStyle),
                ),
                Gap(10.h),
                Pinput(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  length: 4,
                  defaultPinTheme: PinTheme(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      color: context.appColor.greyColor100,
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                          color: context.appColor.greyColor400, width: 1),
                    ),
                    textStyle:
                        context.subTitleTextStyle.copyWith(fontSize: 20.sp),
                  ),
                  focusedPinTheme: PinTheme(
                    decoration: BoxDecoration(
                      color: context.appColor.greyColor100,
                      borderRadius: BorderRadius.circular(4.r),
                      border:
                          Border.all(color: context.appColor.primary, width: 1),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 8.w,
                    ),
                    textStyle:
                        context.subTitleTextStyle.copyWith(fontSize: 20.sp),
                  ),
                  onChanged: (value) {},
                  onCompleted: pinProvider.setPin,
                ),
                Gap(10.h),
                Align(
                  alignment: Alignment.center,
                  child: Text('Confirm your ọjà withdrawal pin ',
                      style: context.subTitleTextStyle),
                ),
                Gap(10.h),
                Pinput(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  length: 4,
                  defaultPinTheme: PinTheme(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      color: context.appColor.greyColor100,
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                          color: context.appColor.greyColor400, width: 1),
                    ),
                    textStyle:
                        context.subTitleTextStyle.copyWith(fontSize: 20.sp),
                  ),
                  focusedPinTheme: PinTheme(
                    decoration: BoxDecoration(
                      color: context.appColor.greyColor100,
                      borderRadius: BorderRadius.circular(4.r),
                      border:
                          Border.all(color: context.appColor.primary, width: 1),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 8.w,
                    ),
                    textStyle:
                        context.subTitleTextStyle.copyWith(fontSize: 20.sp),
                  ),
                  onChanged: (value) {
                    // Optionally handle intermediate changes if needed
                    // But do not call `pageNotifier.goToNextPage()` here
                  },
                  onCompleted: pinProvider.setConfirmPin,
                ),

                if (!pinProvider.isMatch)
                  Text(
                    'PINs do not match!',
                    style: TextStyle(color: Colors.red),
                  ),

                Gap(10.h),

                Center(
                  child: SizedBox(
                    child: SizedBox(
                      width: double.infinity,
                      child: ButtonElevated(
                          text: 'Continue',
                          onPressed: pinProvider.isMatch
                              ? () async {
                                  final status =
                                      await Provider.of<DaySelectionProvider>(
                                              context,
                                              listen: false)
                                          .updateSore(context, storeId);

                                  if (status) {
                                    Navigator.pop(context);

                                    print("jsghghg  ");
                                    // context.clearAndPush(
                                    //     routePath: MyRoutes.SUBMITSCREEN);
                                  }
                                }
                              : null,
                          backgroundColor: context.appColor.primarycolor),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  void _showBottomSheetConfirmsPin(BuildContext context) {
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
                alignment: Alignment.center,
                child: Text('Withdrawal Pin', style: context.subTitleStyle),
              ),

              Align(
                alignment: Alignment.center,
                child: Text('Confirm your ọjà withdrawal pin ',
                    style: context.subTitleTextStyle),
              ),
              Gap(20.h),
              Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                length: 4,
                defaultPinTheme: PinTheme(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 8.w,
                  ),
                  decoration: BoxDecoration(
                    color: context.appColor.greyColor100,
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(
                        color: context.appColor.greyColor400, width: 1),
                  ),
                  textStyle:
                      context.subTitleTextStyle.copyWith(fontSize: 20.sp),
                ),
                focusedPinTheme: PinTheme(
                  decoration: BoxDecoration(
                    color: context.appColor.greyColor100,
                    borderRadius: BorderRadius.circular(4.r),
                    border:
                        Border.all(color: context.appColor.primary, width: 1),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 8.w,
                  ),
                  textStyle:
                      context.subTitleTextStyle.copyWith(fontSize: 20.sp),
                ),
                onChanged: (value) {
                  // Optionally handle intermediate changes if needed
                  // But do not call `pageNotifier.goToNextPage()` here
                },
                onCompleted: (value) {},
              ),
              Gap(50.h),

              Center(
                child: SizedBox(
                  child: SizedBox(
                    width: double.infinity,
                    child: ButtonElevated(
                        text: 'Continue',
                        onPressed: () {
                          context.clearAndPush(
                              routePath: MyRoutes.SUBMITSCREEN);
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
