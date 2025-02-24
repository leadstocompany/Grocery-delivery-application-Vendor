import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Padding(
  //       padding: const EdgeInsets.all(15.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Gap(10.h),
  //           Text(
  //             "Wallet",
  //             style: context.titleStyle.copyWith(color: Colors.black),
  //           ),
  //           Gap(10.h),
  //           cardWidget(),
  //           Gap(30.h),
  //           Row(
  //             children: [
  //               Text(
  //                 "Recent Transaction",
  //                 style: context.titleStyle.copyWith(color: Colors.black),
  //               ),
  //               Spacer(),
  //               InkWell(
  //                 onTap: () {
  //                   context.push(MyRoutes.TRANSACTIONHISTORY);
  //                 },
  //                 child: Text(
  //                   "View All",
  //                   style: context.subTitleTxtStyleblack
  //                       .copyWith(fontSize: 15.sp)
  //                       .copyWith(color: context.appColor.primarycolor),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           recentHistory(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  final List<Map<String, dynamic>> transactions = [
    {
      'date': 'Nov 1st, to, Nov 7th 2025',
      'transactions': [
        {'title': 'Product name', 'id': '#212323', 'amount': '\$50,000'},
        {'title': 'Delivery Refund', 'id': '#212324', 'amount': '\$20,000'},
      ],
    },
    {
      'date': 'Oct 24st, to, Oct 30th 2025',
      'transactions': [
        {'title': 'Product name', 'id': '#212322', 'amount': '\$30,000'},
        {'title': 'Product name', 'id': '#212322', 'amount': '\$30,000'},
        {'title': 'Product name', 'id': '#212322', 'amount': '\$30,000'},
      ],
    },
    {
      'date': '2023-10-06',
      'transactions': [
        {'title': 'Product name', 'id': '#212321', 'amount': '\$10,000'},
        {'title': 'Product name', 'id': '#212321', 'amount': '\$10,000'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Wallet History',
            style: context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, dateIndex) {
            final transactionDate = transactions[dateIndex];

            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 234, 231, 231)),
                  color: context.appColor.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      child: Row(
                        children: [
                          Text(
                            transactionDate['date'],
                            style: context.buttonTestStyle.copyWith(),
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFDEDE),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Text(
                                "Pending",
                                style:
                                    context.subTitleTextStyleBloack.copyWith(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total Order",
                            style: context.buttonTestStyle.copyWith(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            "100",
                            style: context.buttonTestStyle.copyWith(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            "₹10000",
                            style: context.buttonTestStyle.copyWith(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                    for (var i = 0;
                        i < transactionDate['transactions'].length;
                        i++) ...{
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              AppImages.product1,
                              // height: 200,
                              // width: 350,
                            ),
                            Gap(5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transactionDate['transactions'][i]['title'] ??
                                      "",
                                  style: context.buttonTestStyle
                                      .copyWith(fontSize: 12.sp),
                                ),
                                Text(
                                  transactionDate['transactions'][i]['id'] ??
                                      '',
                                  style: context.buttonTestStyle.copyWith(
                                      color: context.appColor.greyColor),
                                ),
                                Text(
                                    transactionDate['transactions'][i]
                                            ['amount'] ??
                                        '',
                                    style: context.buttonTestStyle.copyWith(
                                        fontSize: 12.sp, color: Colors.black)),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      transactionDate['transactions'][i]
                                              ['ammount'] ??
                                          '',
                                      style: context.buttonTestStyle.copyWith(
                                          fontSize: 12.sp,
                                          color: Colors.black)),

                                  Text('November25th, 2023',
                                      style:
                                          context.subTitleTxtStyle.copyWith()),
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
    );
  }

  Widget cardWidget() {
    return Card(
      child: Container(
        width: double.infinity,
        height: 180,
        color: Colors.black,
        child: Stack(
          children: [
            // Positioned(
            //   left: 180,
            //   child: Container(
            //     width: double.infinity,
            //     height: 180,
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             fit: BoxFit.cover,
            //             image: AssetImage(
            //               AppImages.Vector,
            //             ))),
            //   ),
            // ),
            Positioned(
              child: Container(
                color: Colors.green,
                height: 10,
              ),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: Column(
                children: [
                  Text(
                    "YOUR WALLET BALANCE",
                    style: context.subTitleTxtStyleblack
                        .copyWith(fontSize: 8.sp)
                        .copyWith(color: Colors.white),
                  ),
                  Gap(5.h),
                  Text(
                    "\$ 55,000.00",
                    style: context.titleStyle.copyWith(color: Colors.white),
                  ),
                  Gap(10.h),
                  SizedBox(
                    height: 35,
                    child: ButtonElevated(
                        fontSize: 13,
                        text: 'Withdraw',
                        textColor: context.appColor.blackColor,
                        onPressed: () {
                          _withdrawalBottomSheet(context);
                          //  Navigator.pop(context);
                          //  Navigator.pop(context);
                        },
                        backgroundColor: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 250,
              top: 70,
              child: IconButton(
                icon: Icon(
                  _isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget recentHistory() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImages.incoming,
                        // height: 200,
                        // width: 350,
                      ),
                      Gap(5.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Payment',
                            style: context.buttonTestStyle
                                .copyWith(fontSize: 12.sp),
                          ),
                          Text(
                            '#212323',
                            style: context.buttonTestStyle
                                .copyWith(color: context.appColor.greyColor),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('\$ 50,000',
                                style: context.buttonTestStyle
                                    .copyWith(fontSize: 12.sp)),
                            Text('November25th, 2023',
                                style: context.subTitleTxtStyle.copyWith()),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    //color: context.appColor.greyColor ,
                    thickness: 0.2,
                  )
                ],
              ),
            ),
          );
        },
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
                child: Text('Please enter your ọjà pin ',
                    style: context.subTitleStyle),
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
                    color: context.appColor.whiteColor,
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
                        text: 'Withdraw',
                        onPressed: () {
                          Navigator.pop(context);
                          ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.success,
                                  title: "Money Sent",
                                  text: "Your funds is on its way to you"));
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

  void _withdrawalBottomSheet(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Centered App Logo

              Center(
                child: Image.asset(
                  AppImages.applogo,
                  height: 70.h,
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Text('Withdrawal ', style: context.subTitleStyle),
              ),
              Gap(10.h),
              CustomTextField(
                validator: (val) {
                  if (val.toString().isEmpty) {
                    return "Please enter your amount number";
                  }
                  return null;
                },
                maxLength: 64,
                counterWidget: const Offstage(),
                // controller: context.read<AuthCubit>().userName,
                hintText: "Amount",
                fillColor: context.appColor.whiteColor,
              ),
              Gap(5.h),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Access Bank',
                        style: context.subTitleTxtStyleblack,
                      ),
                      Text(
                        'Emeka Festus Akanbi',
                        style: context.subTitleTxtStyle,
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: context.appColor.greyColor400,
                  )
                ],
              ),
              Gap(5.h),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: context.appColor.primarycolor,
                      )),
                  Text(
                    'Add Bank',
                    style: context.subTitleTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: context.appColor.primarycolor),
                  ),
                ],
              ),

              Gap(50.h),

              Center(
                child: SizedBox(
                  child: SizedBox(
                    width: double.infinity,
                    child: ButtonElevated(
                        text: 'Withdraw',
                        onPressed: () {
                          Navigator.pop(context);
                          _showBottomSheet(context);
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
