import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/logic/provider/home_provider.dart';
import 'package:vendor_app/src/presentation/data_notfound.dart';
import 'package:vendor_app/src/presentation/widgets/headerprofile.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getMyOrder(context);
    super.initState();
  }

  int slectedIndex = 0;
  int status = 0;
  String convertUtcToIst(String utcTime) {
    // Parse the UTC time string
    DateTime utcDateTime = DateTime.parse(utcTime).toUtc();

    // Convert to IST (UTC +5:30)
    DateTime istDateTime =
        utcDateTime.add(const Duration(hours: 5, minutes: 30));

    // Format the IST datetime with AM/PM
    String formattedDateTime =
        DateFormat("dd-MM-yyyy hh:mm a").format(istDateTime);

    return formattedDateTime; // Example: 11-02-2025 10:44 AM
  }

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
      'Pending',
      'Procesing',
      'Shipped',
      'Delivered',
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

  String formatDate(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);
    return DateFormat("MMMM d, y hh:mm a").format(dateTime);
  }

  Widget detailsCategory() {
    final List<String> poductsC = [
      'Pending',
      'Procesing',
      'Shipped',
      'Delivered',
      'Cancelled',
    ];

    return Consumer<HomeProvider>(
      builder: (context, orderProvider, child) {
        if (orderProvider.isloading) {
          return Center(child: CircularProgressIndicator());
        }

        if (orderProvider.orderList.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 150),
            child: DataNotFound(
              imagePath: 'assets/images/notfound.jpg',
              message: "No Order Available! ",
            ),
          );
        }
        return Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: orderProvider.orderList.length,
            itemBuilder: (context, index) {
              var orderItem = orderProvider.orderList[index];
              status = index;
              return InkWell(
                onTap: () {
                  context.push(MyRoutes.CUSTOMERORDER, extra: orderItem);
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
                                    "${orderItem.customer!.name ?? ''}",
                                    style: context.subTitleTextStyleBloack,
                                  ),
                                  Text(
                                    "${orderItem.orderNumber}",
                                    style: context.subTitleTxtStyle,
                                  ),
                                  Text(
                                    formatDate(orderItem.createdAt.toString()),
                                    style: context.subTitleTxtStyle,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                  decoration: BoxDecoration(
                                    color: getStatus(orderItem.orderStatus),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      orderItem.orderStatus,
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
      },
    );
  }

  Widget orderList() {
    return Consumer<HomeProvider>(builder: (context, orderProvider, child) {
      if (orderProvider.isloading) {
        return Center(child: CircularProgressIndicator());
      }

      if (orderProvider.orderList.isEmpty) {
        return Padding(
          padding: const EdgeInsets.only(top: 150),
          child: DataNotFound(
            imagePath: 'assets/images/notfound.jpg',
            message: "No Order Available! ",
          ),
        );
      }
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
    });
  }

  Color getStatus(orderStatus) {
    switch (orderStatus) {
      case "PENDING":
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
