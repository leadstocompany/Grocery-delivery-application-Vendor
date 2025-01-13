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
import 'package:vendor_app/src/data/ProductCategoryModel.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';

class ProductFormScreen extends StatefulWidget {
  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch products on screen load
    Provider.of<ProductProvider>(context, listen: false).getCategoryByLevel();
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
          title: Text('Add Product',
              style: context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
        ),
        body: Consumer<ProductProvider>(builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<ProductProvider>(
              builder: (context, provider, child) {
                print("djhfgjh  ${provider.selectedCategory}");
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (provider.categories.isNotEmpty)
                        Container(
                          height: 40.h,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButtonFormField<ProductCategoryModel>(
                            value: provider.selectedCategory,

                            hint: Text(
                              'Select Category',
                              style: context.subTitleTxtStyleblack,
                            ),
                            items: provider.categories.map((category) {
                              return DropdownMenuItem<ProductCategoryModel>(
                                value: category,
                                child: Text(category.name ??
                                    'Unknown Category'), // Display the category name
                              );
                            }).toList(),
                            onChanged: (ProductCategoryModel? value) {
                              if (value != null) {
                                provider.setCategory(
                                    value); // Update the selected category
                              }
                            },

                            decoration: InputDecoration.collapsed(
                                hintText: ''), // Removes default underline
                          ),
                        ),
                      if (provider.selectedCategory != null) Gap(15.h),
                      if (provider.selectedCategory != null)
                        Container(
                          height: 40.h,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // Background color of the container
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                            border:
                                Border.all(color: Colors.grey), // Border color
                          ),
                          child: DropdownButtonFormField<ProductCategoryModel>(
                            value: provider.selectedSubcategory,
                            hint: Text(
                              'Select Subcategory',
                              style: context.subTitleTxtStyleblack,
                            ),
                            items: provider
                                .subcategories[provider.selectedCategory!.name]!
                                .map((sub) {
                              return DropdownMenuItem(
                                  value: sub, child: Text(sub.name!));
                            }).toList(),
                            onChanged: (subcategory) {
                              if (subcategory != null) {
                                provider.setSubcategory(subcategory);
                              }
                            },
                            decoration: InputDecoration.collapsed(hintText: ''),
                          ),
                        ),
                      if (provider.selectedSubcategory != null) Gap(15.h),

                      if (provider.selectedSubcategory != null)
                        Container(
                          height: 40.h,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // Background color of the container
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                            border:
                                Border.all(color: Colors.grey), // Border color
                          ),
                          child: DropdownButtonFormField<ProductCategoryModel>(
                            value: provider.selectedProduct,
                            hint: Text(
                              'Select Product',
                              style: context.subTitleTxtStyleblack,
                            ),
                            items: provider
                                .products[provider.selectedSubcategory!.name]!
                                .map((product) {
                              return DropdownMenuItem(
                                value: product,
                                child: Text(
                                  product.name!,
                                  style: context.buttonTestStyle,
                                ),
                              );
                            }).toList(),
                            onChanged: (product) {
                              if (product != null) {
                                provider.setProduct(product);
                                print('Selected Product ID: ${product.id}');
                              }
                            },
                            decoration: InputDecoration.collapsed(hintText: ''),
                          ),
                        ),
                      if (provider.selectedSubcategory != null) Gap(15.h),

                      // Container(
                      //   height: 40.h,
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(8),
                      //     border: Border.all(color: Colors.grey),
                      //   ),
                      //   child: DropdownButtonFormField<String>(
                      //     value: provider.selectedproducctQuentity.isNotEmpty
                      //         ? provider.selectedproducctQuentity
                      //         : null,
                      //     hint: Text(
                      //       'Select Products Quantity',
                      //       style: context.subTitleTxtStyleblack,
                      //     ),
                      //     items: provider.categories
                      //         .map((category) => DropdownMenuItem(
                      //               value: category,
                      //               child: Text(
                      //                 category,
                      //                 style: context.buttonTestStyle,
                      //               ),
                      //             ))
                      //         .toList(),
                      //     onChanged: (value) {
                      //       provider.setProductQuentity(value!);
                      //     },
                      //     decoration: InputDecoration.collapsed(
                      //         hintText: ''), // Removes default underline
                      //   ),
                      // ),

                      Gap(10.h),
                      CustomTextField(
                        controller: provider.productDescriptionController,
                        validator: (val) {
                          if (val.toString().isEmpty) {
                            return "Please enter Description";
                          }
                          return null;
                        },
                        counterWidget: const Offstage(),
                        onChanged: (value) {},
                        hintText: 'Product Description',
                        hintStyle: context.subTitleTxtStyleblack,
                        fillColor: context.appColor.whiteColor,
                      ),
                      Gap(10.h),
                      CustomTextField(
                        controller: provider.productquantityController,
                        keyBoardType: TextInputType.number,
                        validator: (val) {
                          if (val.toString().isEmpty) {
                            return "Please enter product quantity";
                          }
                          return null;
                        },
                        counterWidget: const Offstage(),
                        onChanged: (value) {},
                        hintText: 'Product quantity',
                        hintStyle: context.subTitleTxtStyleblack,
                        fillColor: context.appColor.whiteColor,
                      ),

                      Gap(10.h),
                      CustomTextField(
                        controller: provider.productUnitController,
                        validator: (val) {
                          if (val.toString().isEmpty) {
                            return "Please enter product uint";
                          }
                          return null;
                        },
                        counterWidget: const Offstage(),
                        onChanged: (value) {
                          //provider.setUnit(value);
                        },
                        hintText: 'Product Unit',
                        hintStyle: context.subTitleTxtStyleblack,
                        fillColor: context.appColor.whiteColor,
                      ),

                      Gap(10.h),
                      CustomTextField(
                        controller: provider.productPriceController,
                        keyBoardType: TextInputType.number,
                        validator: (val) {
                          if (val.toString().isEmpty) {
                            return "Please enter product price";
                          }
                          return null;
                        },
                        counterWidget: const Offstage(),
                        onChanged: (value) {
                          //provider.setPrice(double.tryParse(value) ?? 0.0);
                        },
                        hintText: 'Product Price',
                        hintStyle: context.subTitleTxtStyleblack,
                        fillColor: context.appColor.whiteColor,
                      ),

                      Gap(10.h),
                      CustomTextField(
                        controller:
                            provider.productProductDiscountPriceController,
                        keyBoardType: TextInputType.number,
                        validator: (val) {
                          if (val.toString().isEmpty) {
                            return "Please enter Discount Price";
                          }
                          return null;
                        },
                        counterWidget: const Offstage(),
                        onChanged: (value) {},
                        hintText: 'Discount Price',
                        hintStyle: context.subTitleTxtStyleblack,
                        fillColor: context.appColor.whiteColor,
                      ),

                      // Discount Price

                      Gap(10.h),

                      // Product Stock Switch
                      SwitchListTile(
                        title: Text('In Stock'),
                        value: provider.inStock,
                        activeColor: context.appColor.primarycolor,
                        onChanged: (value) {
                          provider.toggleStock(value);
                        },
                      ),
                      if (provider.inStock)
                        CustomTextField(
                          controller: provider.productStockController,
                          keyBoardType: TextInputType.number,
                          validator: (val) {
                            if (val.toString().isEmpty) {
                              return "Please enter stock quntity";
                            }
                            return null;
                          },
                          counterWidget: const Offstage(),
                          onChanged: (value) {},
                          hintText: 'Stock quantity',
                          hintStyle: context.subTitleTxtStyleblack,
                          fillColor: context.appColor.whiteColor,
                        ),

                      Gap(10.h),
                      CustomTextField(
                        maxLines: 5,
                        controller: provider.productqlongDescriptionController,
                        validator: (val) {
                          if (val.toString().isEmpty) {
                            return "Please enter Long Description";
                          }
                          return null;
                        },
                        counterWidget: const Offstage(),
                        onChanged: (value) {},
                        hintText: 'Product Long Description',
                        hintStyle: context.subTitleTxtStyleblack,
                        fillColor: context.appColor.whiteColor,
                      ),
                      Gap(10.h),
                      Container(
                        height: 120.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: context.appColor.greyColor400),
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          onTap: () {
                            provider..pickImage(context);
                          },
                          child: provider.selectedImage == null
                              ? Center(
                                  child: Icon(
                                    Icons.camera,
                                    size: 100,
                                  ),
                                )
                              : Image.file(
                                  provider.selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),

                      Gap(50.h),

                      SizedBox(
                        width: double.infinity,
                        child: ButtonElevated(
                            text: 'Add to Product List',
                            backgroundColor: provider.isImageLoading
                                ? context.appColor.primarycolor
                                : context.appColor.greyColor,
                            onPressed: provider.isImageLoading
                                ? () async {
                                    var status =
                                        await provider.createProduct(context);
                                    if (status) {
                                      _showBottomSheet(context);
                                    }
                                  }
                                : null),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }));
  }

  // Function to show the Bottom Sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
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
                child: Text('Product added', style: context.subTitleStyle),
              ),

              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  child: Text(
                      'Your Product has been added to the list \nand is visible to customers',
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
                        text: 'View',
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        backgroundColor: context.appColor.primarycolor),
                  ),
                ),
              ),
              Gap(10.h),
              Center(
                  child: SizedBox(
                      width: double.infinity,
                      child: ButtonElevated(
                        text: 'Add more Product',
                        textColor: context.appColor.primarycolor,
                        onPressed: () {
                          Navigator.pop(context);

                          //context.clearAndPush(routePath: MyRoutes.LOGIN);
                        },
                        backgroundColor: context.appColor.whiteColor,
                        borderColor: context.appColor.primarycolor,
                      )))
            ],
          ),
        );
      },
    );
  }
}
