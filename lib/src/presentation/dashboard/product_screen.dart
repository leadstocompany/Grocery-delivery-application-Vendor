import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/presentation/widgets/headerprofile.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int status = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [HeaderProfile(), detailsCategory()],
      ),
    );
  }

  Widget detailsCategory() {
    final List<Map<String, String>> productsC = [
      {
        "image": AppImages.product1,
        "title": "Mama Gold Rice",
        "subTitle": "N45,000",
        "price": "In Stock"
      },
      {
        "image": AppImages.product3,
        "title": "Tatashe",
        "subTitle": "N15,000",
        "price": "Out of Stock"
      },
      {
        "image": AppImages.product2,
        "title": "Mama Gold Rice",
        "subTitle": "N15,000",
        "price": "In Stock"
      },
      {
        "image": AppImages.product4,
        "title": "Tomatoes",
        "subTitle": "N15,000",
        "price": "In Stock"
      },
      {
        "image": AppImages.product3,
        "title": "Tatashe",
        "subTitle": "N15,000",
        "price": "Out of Stock"
      },
      {
        "image": AppImages.product2,
        "title": "Mama Gold Rice",
        "subTitle": "N15,000",
        "price": "In Stock"
      },
      {
        "image": AppImages.product4,
        "title": "Tomatoes",
        "subTitle": "N15,000",
        "price": "In Stock"
      },
      {
        "image": AppImages.product3,
        "title": "Tatashe",
        "subTitle": "N15,000",
        "price": "Out of Stock"
      },
      {
        "image": AppImages.product2,
        "title": "Mama Gold Rice",
        "subTitle": "N15,000",
        "price": "In Stock"
      },
    ];

    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: productsC.length,
        itemBuilder: (context, index) {
          status = index;
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
                          Container(
                            decoration: BoxDecoration(
                              color: productsC[index]["price"].toString() ==
                                      "Out of Stock"
                                  ? Colors.grey
                                  : Color(0xffEAFFEA),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(productsC[index]["price"].toString(),
                                  style: context.buttonTestStyle.copyWith(
                                      color: productsC[index]["price"]
                                                  .toString() ==
                                              "Out of Stock"
                                          ? Colors.black
                                          : Colors.black
                                          )
                                          ),
                            ),
                          )
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
