import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/data/most_populer_product.dart';
import 'package:vendor_app/src/logic/provider/insights_provider.dart';
import 'package:vendor_app/src/presentation/data_notfound.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  @override
  void initState() {
    Provider.of<InsightsProvider>(context, listen: false)
        .getTotalOrder(context);
    Provider.of<InsightsProvider>(context, listen: false)
        .getTotalcompletedOrder(context);
    Provider.of<InsightsProvider>(context, listen: false)
        .getTotalCancelledOrder(context);
    Provider.of<InsightsProvider>(context, listen: false)
        .getMostPopularProduct(context);

    super.initState();
  }

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
              Consumer<InsightsProvider>(
                builder: (context, provider, child) {
                  return _insightsCard(
                      //  AppImages.totalOrder,
                      "Total Orders",
                      AppImages.totalcom,
                      Icons.trending_up,
                      context.appColor.primarycolor,
                      provider.totalOrder,
                      provider.growth);
                },
              ),
              // _insightsCard(AppImages.totalcom, Icons.trending_up,
              //     context.appColor.primarycolor, "1", "1"),
              Gap(10.h),
              Consumer<InsightsProvider>(builder: (context, provider, child) {
                return _insightsCard(
                    "Total Orders Completed",
                    AppImages.totalOrder,
                    Icons.trending_up,
                    context.appColor.primarycolor,
                    provider.totalCompletedOrder,
                    provider.growthCompleted);
              }),
              Gap(10.h),
              Consumer<InsightsProvider>(builder: (context, provider, child) {
                return _insightsCard(
                    "Total Orders Cancelled",
                    AppImages.totalcan,
                    Icons.trending_down_outlined,
                    context.appColor.redColor,
                    provider.totalcancelledOrder,
                    provider.growthCancelled);
              }),
              Gap(10.h),
              Row(
                children: [
                  Text(
                    "Most Popular Items",
                    style: context.titleStyle.copyWith(color: Colors.black),
                  ),
                  Spacer(),
                  // InkWell(
                  //   onTap: () {
                  //     context.push(MyRoutes.INSIGHTSHISTORY);
                  //   },
                  //   child: Text(
                  //     "View All",
                  //     style: context.subTitleTxtStyleblack
                  //         .copyWith(fontSize: 15.sp)
                  //         .copyWith(color: context.appColor.primarycolor),
                  //   ),
                  // ),
                ],
              ),
              Gap(10.h),
              Consumer<InsightsProvider>(builder: (context, provider, child) {
                if (provider.productLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (provider.mostpopulerproductlist.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: DataNotFound(
                      imagePath: 'assets/images/notfound.jpg',
                      message: "Product Not available",
                    ),
                  );
                }
                return detailsCategory(provider.mostpopulerproductlist);
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _insightsCard(
    String message,
    String image,
    IconData trending_up,
    Color primarycolor,
    int totalOrders,
    String growth,
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
                  message,
                  style: context.buttonTestStyle.copyWith(),
                ),
              ],
            ),
            Gap(5.w),
            Text(
              totalOrders.toString(),
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
                  "$growth%",
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

  Widget detailsCategory(List<Datum> mostpopulerproductlist) {
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
              itemCount: mostpopulerproductlist.length,
              itemBuilder: (context, index) {
                var product = mostpopulerproductlist[index];
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Row(
                          children: [
                            Image.network(
                              product.productImage != null &&
                                      product.productImage!.isNotEmpty
                                  ? product.productImage ?? ''
                                  : 'https://via.placeholder.com/150', // Fallback placeholder
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons
                                    .broken_image); // Fallback icon for invalid URLs
                              },
                            ),
                            Gap(5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    product.productName,
                                    maxLines: 2,
                                    style: context.buttonTestStyle.copyWith(),
                                  ),
                                ),
                                Text(
                                  product.quantity.toString(),
                                  style: context.buttonTestStyle.copyWith(
                                      color: context.appColor.greyColor),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              "₹" + product.originalProductDiscountPrice,
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
