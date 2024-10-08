import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            cardWidget(),
            Gap(30.h),
            Row(
              children: [
                Text(
                  "Recent Transaction",
                  style: context.titleStyle.copyWith(color: Colors.black),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    context.push(MyRoutes.TRANSACTIONHISTORY);
                  },
                  child: Text(
                    "View All",
                    style: context.subTitleTxtStyleblack
                        .copyWith(fontSize: 15.sp)
                        .copyWith(color: context.appColor.primarycolor),
                  ),
                ),
              ],
            ),
            recentHistory(),
          ],
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
                          Navigator.pop(context);
                          Navigator.pop(context);
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
            Positioned(
              left: 180,
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          AppImages.Vector,
                        ))),
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
}
