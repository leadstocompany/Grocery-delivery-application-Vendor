import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/presentation/data_notfound.dart';
import 'package:vendor_app/src/presentation/widgets/headerprofile.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int status = 0;
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    Provider.of<ProductProvider>(context, listen: false).getProduct('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Gap(10.h),
            HeaderProfile(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Consumer<ProductProvider>(
                  builder: (context, provider, child) {
                return Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        provider.getProduct(value);
                      }
                    },
                    onChanged: (value) {
                      if (value.isEmpty) {
                        provider.getProduct(_searchController.text);
                      }

                      // provider.searchProducts(value, context);

                      // if (value.isNotEmpty) {
                      //   _showOverlay(context);
                      // } else {
                      //   _clearOverlay();
                      // }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      suffixIcon: InkWell(
                        onTap: () {
                          provider.getProduct(_searchController.text);
                        },
                        child: Icon(Icons.search),
                      ),
                      hintText: 'Search',
                      // hintStyle: context.customRegular(APPCOLOR.grey666666, 18),
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                    ),
                  ),
                );
              }),
            ),
            detailsCategory()
          ],
        ),
      ),
    );
  }

  _buildFloatActionButton() {
    return FloatingActionButton(
      onPressed: () {
        context.push(MyRoutes.PRODUCTFORMSCREEN);
      },
      shape: CircleBorder(),
      child: Icon(
        Icons.add,
        color: context.appColor.primarycolor,
      ),
      backgroundColor: context.appColor.whiteColor,
    );
  }

  Widget detailsCategory() {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      if (provider.isLoadingg) {
        return Center(child: CircularProgressIndicator());
      } else if (provider.products1.isEmpty) {
        return Padding(
          padding: const EdgeInsets.only(top: 150),
          child: DataNotFound(
            imagePath: 'assets/images/notfound.jpg',
            message: "No Order Available! ",
          ),
        );
      } else {
        return Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: provider.products1.length,
            itemBuilder: (context, index) {
              final product = provider.products1[index];
              status = index;
              return InkWell(
                onTap: () {
                  context.push(
                    MyRoutes.PRODUCTDETAILS,
                    extra: product,
                  );
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
                              Image.network(
                                product.productImages != null &&
                                        product.productImages!.isNotEmpty
                                    ? product.productImages!.first.url ?? ''
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
                              Container(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name!,
                                      // productsC[index]['title'].toString(),
                                      style: context.buttonTestStyle.copyWith(),
                                    ),
                                    Text(
                                      //  productsC[index]['subTitle'].toString(),

                                      product.basePrice!,
                                      style: context.buttonTestStyle.copyWith(
                                          color: context.appColor.greyColor),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color: product.isInStock!
                                      ? Color(0xffEAFFEA)
                                      : Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                      // productsC[index]["price"].toString(),
                                      product.isInStock!
                                          ? "In Stock"
                                          : "Out Of Stock",
                                      style: context.buttonTestStyle
                                          .copyWith(color: Colors.black)),
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
    });
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
