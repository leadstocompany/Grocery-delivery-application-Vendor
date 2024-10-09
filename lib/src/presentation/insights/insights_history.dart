import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class InsightsHistory extends StatefulWidget {
  const InsightsHistory({super.key});

  @override
  State<InsightsHistory> createState() => _InsightsHistoryState();
}

class _InsightsHistoryState extends State<InsightsHistory> {
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
          title: Text('Most Popular Items',
              style: context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
        ),
        body: detailsCategory());
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
        ],
      ),
    );
  }
}
