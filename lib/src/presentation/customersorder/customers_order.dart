import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class CustomerOrder extends StatefulWidget {
  final Map<String, dynamic> orderDetails;
  const CustomerOrder({super.key, required this.orderDetails});

  @override
  State<CustomerOrder> createState() => _CustomerOrderState();
}

class _CustomerOrderState extends State<CustomerOrder> {
  String? title;
  int? status;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    title = widget.orderDetails['title'];
    status = widget.orderDetails['index'];
  }

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
            Navigator.pop(context); // Handle back button functionality
          },
        ),
        title: Text('Customer’s Order',
            style: context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardOrder(widget.orderDetails),
            Gap(20.h),
            detailsCategory(),
            if (title == "New Order") orderProcess(),
            Gap(20.h),
            if (title == "Awaiting Pickup" || title == "Completed") ...{
              Text(
                'Agent’s Information',
                style: context.titleStyleRegular.copyWith(),
              ),
              Gap(20.h),
              CustomerInformation()
            },
            if (title == "Cancelled") ...{
              Text(
                'Agent’s Information',
                style: context.titleStyleRegular.copyWith(),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 15, color: Colors.black),
                      Text(
                        ' Order cancelled by the customer. ',
                        style: context.subTitleTextStyleBloack.copyWith(),
                      ),
                    ],
                  ))
            }
          ],
        ),
      ),
    );
  }

  Widget cardOrder(final Map<String, dynamic> orderDetails) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.appColor.greyColor100),
        color: context.appColor.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Raiden Lord",
                      style: context.subTitleTextStyleBloack,
                    ),
                    Text(
                      "16, First Love Estate, Ikorodu",
                      style: context.subTitleTxtStyle,
                    ),
                    Text(
                      "08092346578",
                      style: context.subTitleTxtStyle,
                    ),
                  ],
                ),
                Spacer(),
                Container(
                    decoration: BoxDecoration(
                      color: getStatus(),
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "New Order",
                        style: context.buttonTestStyle
                            .copyWith(color: getTextColor()),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget detailsCategory() {
    final List<Map<String, String>> productsC = [
      {
        "image": AppImages.product1,
        "title": "Mama Gold Rice",
        "subTitle": "2 bags",
        "price": "N90,000"
      },
      {
        "image": AppImages.product3,
        "title": "Tatashe",
        "subTitle": "1 Paint rubber",
        "price": "N25,000"
      },
      {
        "image": AppImages.product2,
        "title": "Mama Gold Rice",
        "subTitle": "2 bags",
        "price": "N90,000"
      },
      {
        "image": AppImages.product4,
        "title": "Tomatoes",
        "subTitle": "1 Basket",
        "price": "N30,000"
      },
    ];

    return Container(
      height: 350.h,
      decoration: BoxDecoration(
        border: Border.all(color: context.appColor.greyColor100),
        color: context.appColor.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Column(
        children: [
          Container(
            height: 320.h,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: productsC.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Row(
                              children: [
                                Image.asset(
                                  productsC[index]['image'].toString(),
                                  // height: 200,
                                  // width: 350,
                                ),
                                Gap(5.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productsC[index]['title'].toString(),
                                      style: context.buttonTestStyle.copyWith(),
                                    ),
                                    Text(
                                      productsC[index]['subTitle'].toString(),
                                      style: context.buttonTestStyle.copyWith(
                                          color: context.appColor.greyColor),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  productsC[index]['price'].toString(),
                                  style: context.buttonTestStyle.copyWith(),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            //color: context.appColor.greyColor ,
                            thickness: 0.2,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              children: [
                Gap(5.w),
                Padding(
                  padding: EdgeInsets.only(left: 65.w),
                  child: Text(
                    "Total",
                    style: context.buttonTestStyle.copyWith(),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    "N275,000",
                    style: context.buttonTestStyle.copyWith(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget orderProcess() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: 
      Center(
        child: 
        Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "₹ 2300",
                      style: context.subTitleTextStyleBloack
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Gap(10.w),
                    Icon(Icons.check_circle,
                        color: context.appColor.primarycolor),
                    Text(
                      "Paid",
                      style: context.subTitleTxtStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.appColor.primarycolor),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ButtonElevated(
                text: 'Process Order',
                onPressed: () {},
                backgroundColor: context.appColor.primarycolor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomerInformation() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.appColor.greyColor100),
        color: context.appColor.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  "",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      AppImages.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Gap(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order awaiting pickup 9:00 am',
                  style: context.buttonTestStyle.copyWith(fontSize: 13.sp),
                ),
                Text(
                  'Adekunle is on his way to pickup',
                  style: context.buttonTestStyle.copyWith(
                      color: context.appColor.greyColor, fontSize: 13.sp),
                ),
              ],
            ),
            Gap(10.w),
            Icon(
              Icons.call,
              size: 40,
            )
          ],
        ),
      ),
    );
  }

  Color getStatus() {
    switch (status) {
      case 0:
        return Color(0xff315731);
      case 1:
        return Color.fromARGB(255, 240, 218, 178);
      case 2:
        return Color.fromARGB(255, 150, 163, 189);
      case 3:
        return Color(0xffEAFFEA);
      default:
        return Color(0xffFFDEDE);
    }
  }

  Color getTextColor() {
    switch (status) {
      case 0:
        return Color(0xffFFFFFF);
      case 1:
        return Color(0xffFFA500);
      case 2:
        return Color(0xff0754EA);
      case 3:
        return Color(0xff324E32);
      default:
        return Color(0xffA32424);
    }
  }



}
