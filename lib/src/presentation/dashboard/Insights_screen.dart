import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sales Insights",
                style: context.titleStyle.copyWith(color: Colors.black),
              ),
              Gap(10.h),
              _insightsCard(AppImages.totalcom, Icons.trending_up,
                  context.appColor.primarycolor),
              Gap(10.h),
              _insightsCard(AppImages.totalOrder, Icons.trending_up,
                  context.appColor.primarycolor),
              Gap(10.h),
              _insightsCard(AppImages.totalcan, Icons.trending_down_outlined,
                  context.appColor.redColor),
              Gap(10.h),
              Row(
                children: [
                  Text(
                    "Most Popular Items",
                    style: context.titleStyle.copyWith(color: Colors.black),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      context.push(MyRoutes.INSIGHTSHISTORY);
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
              Gap(10.h),
              detailsCategory()
            ],
          ),
        ),
      ),
    );
  }

  Widget _insightsCard(
    String image,
    IconData trending_up,
    Color primarycolor,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.appColor.greyColor100),
        color: context.appColor.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  // height: 200,
                  // width: 350,
                ),
                Gap(5.w),
                Text(
                  "Total Orders",
                  style: context.buttonTestStyle.copyWith(),
                ),
              ],
            ),
            Gap(5.w),
            Text(
              "24456",
              style:
                  context.subTitleStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(
                  trending_up,
                  color: primarycolor,
                ),
                Text(
                  "15%",
                  style: context.subTitleTxtStyle.copyWith(
                    color: primarycolor,
                  ),
                ),
                Gap(5.w),
                Text(
                  "Vs last month",
                  style: context.subTitleTxtStyle.copyWith(),
                ),
              ],
            ),
          ],
        ),
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
      decoration: BoxDecoration(
        border: Border.all(color: context.appColor.greyColor100),
        color: context.appColor.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Column(
        children: [
          Container(
            height: 40.h,
            decoration: BoxDecoration(
              border: Border.all(color: context.appColor.greyColor100),
              color: Color.fromARGB(255, 246, 243, 243),
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Row(
                children: [
                  Text(
                    'Product ',
                    style: context.buttonTestStyle.copyWith(),
                  ),
                  Spacer(),
                  Text(
                    'Number Sold',
                    style: context.buttonTestStyle.copyWith(),
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 320.h,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: productsC.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
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
                );
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0, right: 8),
          //   child: Row(
          //     children: [
          //       Gap(5.w),
          //       Padding(
          //         padding: EdgeInsets.only(left: 65.w),
          //         child: Text(
          //           "Total",
          //           style: context.buttonTestStyle.copyWith(),
          //         ),
          //       ),
          //       Spacer(),
          //       Padding(
          //         padding: const EdgeInsets.only(right: 10.0),
          //         child: Text(
          //           "N275,000",
          //           style: context.buttonTestStyle.copyWith(),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
