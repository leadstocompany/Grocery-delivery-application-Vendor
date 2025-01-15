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
import 'package:vendor_app/src/data/store_model.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/logic/provider/crate_store_provider.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class StoreManagement extends StatefulWidget {
  const StoreManagement({super.key});

  @override
  State<StoreManagement> createState() => _StoreManagementState();
}

class _StoreManagementState extends State<StoreManagement> {
  @override
  void initState() {
    super.initState();
    // Fetch products on screen load
    Provider.of<DaySelectionProvider>(context, listen: false).getStore();
  }

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
        title: Text('Store Management',
            style: context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
      ),
      body: Consumer<DaySelectionProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (provider.store_model == null) {
            return Center(child: Text('No available'));
          } else {
            provider.bankName.text =
                provider.store_model!.paymentDetails!.bankName;
            provider.accountHoldername.text =
                provider.store_model!.paymentDetails!.accountHolder;
            provider.accountNumber.text =
                provider.store_model!.paymentDetails!.accountNumber;
            provider.ifscCode.text =
                provider.store_model!.paymentDetails!.ifscCode;
            return SingleChildScrollView(
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
                  _daysList(
                      context, provider.store_model), // Corrected method call
                  Gap(20.h),
                  Text(
                    'Payment Information',
                    style: context.subTitleStyle,
                  ),

                  Gap(20.h),
                  // Container(
                  //   height: 40.h,
                  //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(color: Colors.grey),
                  //   ),
                  //   child: DropdownButtonFormField<String>(
                  //     value: provider.selectedproducctQuentity.isNotEmpty
                  //         ? provider.selectedproducctQuentity
                  //         : null,
                  //     hint: Text(
                  //       'Select Products Quantity',
                  //       style: context.subTitleTxtStyleblack,
                  //     ),
                  //     items: provider.categories
                  //         .map((category) => DropdownMenuItem(
                  //               value: category,
                  //               child: Text(
                  //                 category,
                  //                 style: context.buttonTestStyle,
                  //               ),
                  //             ))
                  //         .toList(),
                  //     onChanged: (value) {
                  //       provider.setProductQuentity(value!);
                  //     },
                  //     decoration: InputDecoration.collapsed(
                  //         hintText: ''), // Removes default underline
                  //   ),
                  // ),
                  // Gap(20.h),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: provider.bankName,
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
                          controller: provider.accountHoldername,
                          validator: (val) {
                            if (val.toString().isEmpty) {
                              return "AccountHodername";
                            }
                            return null;
                          },
                          maxLength: 64,
                          counterWidget: const Offstage(),
                          readOnly: true,
                          hintText: "Account Holder Name",
                          hintStyle: context.subTitleTextStyle,
                          fillColor: context.appColor.whiteColor,
                        ),
                        Gap(10.h),
                        CustomTextField(
                          controller: provider.accountNumber,
                          validator: (val) {
                            if (val.toString().isEmpty) {
                              return "Account Number";
                            }
                            return null;
                          },
                          maxLength: 64,
                          counterWidget: const Offstage(),
                          readOnly: true,
                          hintText: 'Account Number',
                          hintStyle: context.subTitleTextStyle,
                          fillColor: context.appColor.whiteColor,
                        ),
                        Gap(10.h),
                        CustomTextField(
                          controller: provider.ifscCode,
                          validator: (val) {
                            if (val.toString().isEmpty) {
                              return "Bank IFSCCOde";
                            }
                            return null;
                          },
                          maxLength: 64,
                          counterWidget: const Offstage(),
                          readOnly: true,
                          hintText: 'Bank IFSCCOde',
                          hintStyle: context.subTitleTextStyle,
                          fillColor: context.appColor.whiteColor,
                        ),
                        Gap(10.h),
                        SizedBox(
                          width: double.infinity,
                          child: ButtonElevated(
                              text: 'Edit',
                              backgroundColor: context.appColor.primarycolor,
                              onPressed: () {
                                context.push(
                                  MyRoutes.UPDATESTORE,
                                  extra: {'status': '0'},
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  const Gap(5),
                  const SizedBox(height: 16), // Add some spacing if necessary
                ],
              ),
            );
          }
        },
      ),
    );
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

  // Widget _daysList(BuildContext context, StoreModel? store_model) {

  //   final List<Map<String, String>> daysData =
  //   [
  //     {'day': 'Sunday', 'open': "09:30 AM", 'close': "05:00 PM"},
  //     {'day': 'Monday', 'open': "09:30 AM", 'close': "05:00 PM"},
  //     {'day': 'Tuesday', 'open': "09:30 AM", 'close': "05:00 PM"},
  //     {'day': 'Wednesday', 'open': "09:30 AM", 'close': "05:00 PM"},
  //     {'day': 'Thursday', 'open': "09:30 AM", 'close': "05:00 PM"},
  //     {'day': 'Friday', 'open': "09:30 AM", 'close': "05:00 PM"},
  //     {'day': 'Saturday', 'open': "09:30 AM", 'close': "05:00 PM"},
  //   ];

  //   final Map<String, dynamic> operateDates = {
  //     "id": "cm5rye8nw000binw9sansoxk5",
  //     "monday": true,
  //     "tuesday": true,
  //     "wednesday": true,
  //     "thursday": true,
  //     "friday": true,
  //     "saturday": true,
  //     "sunday": false,
  //     "storeId": "cm5rye8nw000ainw9u5e71ogw"
  //   };

  //   return ListView.builder(
  //     shrinkWrap: true, // Make the ListView size to fit its children
  //     physics:
  //         NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
  //     itemCount: daysData.length,
  //     itemBuilder: (context, index) {
  //       final dayInfo = daysData[index];
  //       return Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               //  dayInfo['day']!,
  //               "${store_model!.operateDates!.friday}",
  //               style: context.subTitleTxtStyleblack.copyWith(
  //                 color: context.appColor.blackColor,
  //               ),
  //             ),
  //             Text(
  //               dayInfo['open']!,
  //               style: context.subTitleTxtStyleblack.copyWith(
  //                 color: context.appColor.blackColor,
  //               ),
  //             ),
  //             Text(
  //               dayInfo['close']!,
  //               style: context.subTitleTxtStyleblack.copyWith(
  //                 color: context.appColor.blackColor,
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  Widget _daysList(BuildContext context, StoreModel? storeModel) {
    final List<Map<String, String>> daysData = [
      {'day': 'Sunday', 'key': 'sunday'},
      {'day': 'Monday', 'key': 'monday'},
      {'day': 'Tuesday', 'key': 'tuesday'},
      {'day': 'Wednesday', 'key': 'wednesday'},
      {'day': 'Thursday', 'key': 'thursday'},
      {'day': 'Friday', 'key': 'friday'},
      {'day': 'Saturday', 'key': 'saturday'},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: daysData.length,
      itemBuilder: (context, index) {
        final dayInfo = daysData[index];
        final dayKey = dayInfo['key']!;
        final isOpen = storeModel?.operateDates?.toJson()[dayKey] ?? false;
        final openTime = storeModel?.operateTimes?.startTime ?? "N/A";
        final closeTime = storeModel?.operateTimes?.endTime ?? "N/A";

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.w,
                child: Text(
                  dayInfo['day']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isOpen ? Colors.black : Colors.grey,
                  ),
                ),
              ),
              Text(
                isOpen ? openTime : "Closed",
                style: TextStyle(
                  fontSize: 14,
                  color: isOpen ? Colors.green : Colors.red,
                ),
              ),
              Text(
                isOpen ? closeTime : "",
                style: TextStyle(
                  fontSize: 14,
                  color: isOpen ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
