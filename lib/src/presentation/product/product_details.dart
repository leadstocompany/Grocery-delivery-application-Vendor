import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/data/prdouct_model.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class Productdetails extends StatefulWidget {
  final Product product;
  const Productdetails({super.key, required this.product});
  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  TextEditingController calculatedicountpercentage = TextEditingController();

  @override
  void initState() {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.productNameController.text = widget.product.name!;
    provider.productDescriptionController.text = widget.product.description!;
    provider.productUnitController.text = widget.product.unit!;
    provider.productPriceController.text = widget.product.basePrice!;
    provider.productProductDiscountPriceController.text =
        widget.product.discountPrice!;
    provider.productStockController.text = widget.product.stock.toString()!;
    provider.productqlongDescriptionController.text =
        widget.product.additionalInfo!;
    provider.productStockController.text = widget.product.stock.toString()!;
    provider.inStock = widget.product.isInStock!;
    provider.productquantityController.text =
        widget.product.quantity.toString()!;

    provider.productImage = widget.product.productImages!;

    provider.selectedImages.clear();

    calculatedicountpercentage.text = calculateDiscountPercentage(
            double.parse(widget.product.basePrice!),
            double.parse(widget.product.discountPrice!))
        .toString();

    super.initState();
  }

  int calculateDiscountPercentage(double basePrice, double discountPrice) {
    print(
        "Base Price (Before Discount): $basePrice, Discount Price (After Discount): $discountPrice");

    if (basePrice <= 0 || discountPrice <= 0 || discountPrice > basePrice) {
      print("Error: Invalid price values.");
      return 0;
    }

    double discountAmount = basePrice - discountPrice;
    double discountPercentage = (discountAmount / basePrice) * 100;

    return discountPercentage.round();
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
            Navigator.pop(context);
          },
        ),
        title: Text('Product Details',
            style: context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Name"),
                  CustomTextField(
                    controller: provider.productNameController,
                    readOnly: true,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                      // provider.setQuantity(int.tryParse(value) ?? 1);
                    },
                    hintText: 'Rice',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),
                  // Text("Product Name"),
                  // CustomTextField(
                  //   readOnly: true,
                  //   controller: provider.productPriceController,
                  //   validator: (val) {
                  //     if (val.toString().isEmpty) {
                  //       return "Please enter your name";
                  //     }
                  //     return null;
                  //   },
                  //   counterWidget: const Offstage(),
                  //   onChanged: (value) {},
                  //   hintText: 'Basmati Rice',
                  //   hintStyle: context.subTitleTxtStyleblack,
                  //   fillColor: context.appColor.whiteColor,
                  // ),
                  // Gap(10.h),
                  Text("Product description "),
                  CustomTextField(
                    readOnly: true,
                    controller: provider.productDescriptionController,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {},
                    hintText: 'Mama Gold Premium Rice',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),
                  Text("Product Unit"),
                  CustomTextField(
                    readOnly: true,
                    controller: provider.productUnitController,
                    keyBoardType: TextInputType.text,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                      // provider.setPrice(double.tryParse(value) ?? 0.0);
                    },
                    hintText: '1 kg',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),
                  Text("Product addtional description "),
                  CustomTextField(
                    readOnly: true,
                    controller: provider.productqlongDescriptionController,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                      // provider
                      //     .setDiscountPrice(double.tryParse(value) ?? 0.0);
                    },
                    hintText: 'Very Good Long Grain Rice',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),
                  Text("Product price"),
                  CustomTextField(
                    controller: provider.productPriceController,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter product price";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                      // provider
                      //     .setDiscountPrice(double.tryParse(value) ?? 0.0);
                    },
                    hintText: '45,000',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  Gap(10.h),

                  Text("Product discount price"),
                  CustomTextField(
                    controller: calculatedicountpercentage,
                    keyBoardType: TextInputType.number,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter Discount Price";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        provider.productProductDiscountPriceController.clear();
                        return;
                      }

                      double discount = double.tryParse(value) ?? 0;
                      double productPrice = double.tryParse(
                              provider.productPriceController.text) ??
                          0;

                      double discountedPrice =
                          productPrice * (1 - discount / 100);

                      provider.productProductDiscountPriceController.value =
                          TextEditingValue(
                        text: discountedPrice
                            .toStringAsFixed(2), // Keep proper decimal format
                        selection: TextSelection.collapsed(
                            offset: discountedPrice.toStringAsFixed(2).length),
                      );
//
                    },
                    hintText: 'Discount Price %',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),

                  ///

                  Text("Product after discount price"),
                  CustomTextField(
                    readOnly: true,
                    controller: provider.productProductDiscountPriceController,
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    counterWidget: const Offstage(),
                    onChanged: (value) {
                      // provider
                      //     .setDiscountPrice(double.tryParse(value) ?? 0.0);
                    },
                    hintText: 'Discount Price (Optional)',
                    hintStyle: context.subTitleTxtStyleblack,
                    fillColor: context.appColor.whiteColor,
                  ),
                  
                  Gap(10.h),

                  SwitchListTile(
                    title: Text('Mark Product in stock'),
                    hoverColor: context.appColor.primarycolor,
                    value: provider.inStock,
                    activeColor: context.appColor.primarycolor,
                    onChanged: (value) {
                      provider.toggleStock(value);
                    },
                  ),
                  Gap(10.h),
                  if (provider.inStock) Text("Product stock"),
                  if (provider.inStock)
                    CustomTextField(
                      controller: provider.productStockController,
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      counterWidget: const Offstage(),
                      onChanged: (value) {
                        // provider
                        //     .setDiscountPrice(double.tryParse(value) ?? 0.0);
                      },
                      hintText: '80 pieces',
                      hintStyle: context.subTitleTxtStyleblack,
                      fillColor: context.appColor.whiteColor,
                    ),
                  Gap(10.h),
                

                  SizedBox(
                    child: Container(
                      // height: 120.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: context.appColor.greyColor400),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          provider.pickImages(context);
                        },
                        child: provider.selectedImages.isEmpty
                            ? provider.productImage.isNotEmpty
                                ? Wrap(
                                    children:
                                        provider.productImage.map((image) {
                                      return Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image(
                                              image: NetworkImage(image.url),
                                              width: 100,
                                              height: 100));
                                    }).toList(),
                                  )
                                : Center(
                                    child: Icon(
                                      Icons.camera,
                                      size: 100,
                                    ),
                                  )
                            : Wrap(
                                children: provider.selectedImages.map((image) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Image.file(image,
                                        width: 100, height: 100),
                                  );
                                }).toList(),
                              ),
                      ),
                    ),
                  ),

                  Gap(10.h),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonElevated(
                        text: 'Save Product',
                        backgroundColor: context.appColor.primarycolor,
                        onPressed: () async {
                          var status = await provider.updateProduct(
                              context, widget.product.id.toString());
                          if (status) {
                            Provider.of<ProductProvider>(context, listen: false)
                                .getProduct();
                            Navigator.pop(context);
                          }
                        }),
                  ),
                  Gap(10.h),
                  Center(
                      child: SizedBox(
                          width: double.infinity,
                          child: ButtonElevated(
                            text: 'Delete Product',
                            textColor: context.appColor.redColor,
                            onPressed: () {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     content: Text("Working on progress "),
                              //     backgroundColor: Colors.red,
                              //   ),
                              // );
                              _showBottomSheet(context);

                              //context.clearAndPush(routePath: MyRoutes.LOGIN);
                            },
                            backgroundColor: context.appColor.whiteColor,
                            borderColor: context.appColor.redColor,
                          )))
                ],
              ),
            );
          },
        ),
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
                child: Text('Delete Product?', style: context.subTitleStyle),
              ),

              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  child: Text(
                      'Are you sure you want to delete this product? You won’t be able to undo this.',
                      textAlign: TextAlign.center,
                      style:
                          context.subTitleTextStyle.copyWith(fontSize: 13.sp)),
                ),
              ),
              Gap(20.h),
              Center(
                child: SizedBox(
                  child: SizedBox(
                    width: double.infinity,
                    child: ButtonElevated(
                        text: 'Confirm',
                        onPressed: () async {
                          var status = await Provider.of<ProductProvider>(
                                  context,
                                  listen: false)
                              .deleteProduct(
                                  context, widget.product.id.toString());

                          if (status) {
                            Provider.of<ProductProvider>(context, listen: false)
                                .getProduct();
                            Future.delayed(const Duration(seconds: 0),
                                () async {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            });
                          }
                        },
                        backgroundColor: Color.fromARGB(255, 127, 51, 46)),
                  ),
                ),
              ),
              Gap(10.h),
            ],
          ),
        );
      },
    );
  }
}
