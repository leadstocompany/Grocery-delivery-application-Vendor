import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/presentation/widgets/headerprofile.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<String> items = [
    'All',
    'Awaiting Pickup',
    'In Transit',
    'Completed',
    'Cancelled',
  ];
  int slectedIndex = 0;
  int status = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Gap(10.h),
            HeaderProfile(),
            categoryList(),
            if (slectedIndex == 0) ...{
              detailsCategory(),
            } else ...{
              orderList()
            }
          ],
        ),
      ),
    );
  }

  Widget categoryList() {
    final List<String> items = [
      'All',
      'Awaiting Pickup',
      'In Transit',
      'Completed',
      'Cancelled',
    ];
    return Container(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: context.appColor.primarycolor),
                      color: index == slectedIndex
                          ? context.appColor.primarycolor
                          : context.appColor.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          slectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          items[index],
                          style: context.subTitleTxtStyleblack,
                        ),
                      ),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget detailsCategory() {
    final List<String> poductsC = [
      'New Order',
      'Awaiting Pickup',
      'In Transit',
      'Completed',
      'Cancelled',
    ];

    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: poductsC.length,
        itemBuilder: (context, index) {
          status = index;
          return InkWell(
            onTap: () {
              context.push(MyRoutes.CUSTOMERORDER, extra: {
                "title": poductsC[index].toString(), // String
                "index": index, // Color
              });
            },
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Raiden Lord",
                                style: context.subTitleTextStyleBloack,
                              ),
                              Text(
                                "Order ID  #212323",
                                style: context.subTitleTxtStyle,
                              ),
                              Text(
                                "Today |  9:00 am",
                                style: context.subTitleTxtStyle,
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                              decoration: BoxDecoration(
                                color: getStatus(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  poductsC[index],
                                  style: context.buttonTestStyle
                                      .copyWith(color: getTextColor()),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Divider()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget orderList() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          status = index;
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order ID  #212323",
                              style: context.subTitleTextStyleBloack,
                            ),
                            Text(
                              "Today | 9:00 am",
                              style: context.subTitleTxtStyle,
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text("3 Items "),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: context.appColor.primarycolor,
                              size: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider()
                ],
              ),
            ),
          );
        },
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
