import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  // Mock data for transactions
  final List<Map<String, dynamic>> transactions = [
    {
      'date': 'Today, Nov 25th, 2023',
      'transactions': [
        {'title': 'Order Payment', 'id': '#212323', 'amount': '\$50,000'},
        {'title': 'Order Refund', 'id': '#212324', 'amount': '\$20,000'},
      ],
    },
    {
      'date': 'Yesterday, Nov 24th, 2023',
      'transactions': [
        {'title': 'Order Payment', 'id': '#212322', 'amount': '\$30,000'},
        {'title': 'Order Payment', 'id': '#212322', 'amount': '\$30,000'},
        {'title': 'Order Payment', 'id': '#212322', 'amount': '\$30,000'},
      ],
    },
    {
      'date': '2023-10-06',
      'transactions': [
        {'title': 'Order Payment', 'id': '#212321', 'amount': '\$10,000'},
        {'title': 'Order Payment', 'id': '#212321', 'amount': '\$10,000'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) 
  {
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
        title: Text('Transaction History',
            style: context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              icon: Icon(
                Icons.filter_list,
                color: context.appColor.blackColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, dateIndex) {
                  final transactionDate = transactions[dateIndex];

                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 234, 231, 231)),
                        color: context.appColor.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Date Header
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: Text(
                              transactionDate['date'],
                              style: context.buttonTestStyle.copyWith(),
                            ),
                          ),
                          // List of transactions for that date
                          for (var i = 0;
                              i < transactionDate['transactions'].length;
                              i++) ...{
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppImages.incoming,
                                    // height: 200,
                                    // width: 350,
                                  ),
                                  Gap(5.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        transactionDate['transactions'][i]
                                                ['title'] ??
                                            "",
                                        style: context.buttonTestStyle
                                            .copyWith(fontSize: 12.sp),
                                      ),
                                      Text(
                                        transactionDate['transactions'][i]
                                                ['id'] ??
                                            '',
                                        style: context.buttonTestStyle.copyWith(
                                            color: context.appColor.greyColor),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            transactionDate['transactions'][i]
                                                    ['ammount'] ??
                                                '',
                                            style: context.buttonTestStyle
                                                .copyWith(fontSize: 12.sp)),
                                        Text('November25th, 2023',
                                            style: context.subTitleTxtStyle
                                                .copyWith()),
                                        // Here you can format the date if needed
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (i < transactionDate['transactions'].length - 1)
                              Divider(
                                thickness: 0.2,
                              )
                          }
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Centered App Logo
              Center(
                child: Image.asset(
                  AppImages.applogo, // Replace with your logo path
                  height: 100.h, // Adjust height as necessary
                ),
              ),
              Gap(20.h),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Order Payment', style: context.subTitleStyle)),

              Divider(
                thickness: 0.2,
              ),
              Gap(20.h),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Withdrawal', style: context.subTitleStyle)),
              Divider(
                thickness: 0.2,
              ),
              Gap(20.h),

              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Refunds', style: context.subTitleStyle)),

              Gap(20.h),
            ],
          ),
        );
      },
    );
  }
}
