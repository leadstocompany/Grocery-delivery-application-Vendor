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
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class ProductFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<ProductProvider>(
            builder: (context, provider, child) 
            {
              return 
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: provider.selectedCategory.isNotEmpty
                            ? provider.selectedCategory
                            : null,
                        hint: Text(
                          'Select Category',
                          style: context.subTitleTxtStyleblack,
                        ),
                        items: provider.categories
                            .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category,
                                    style: context.buttonTestStyle,
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          provider.setCategory(value!);
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: ''), // Removes default underline
                      ),
                    ),

                    if (provider.selectedCategory.isNotEmpty) ...{
                      Gap(15.h),
                      Container(
                        height: 40.h,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color:
                              Colors.white, // Background color of the container
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                          border:
                              Border.all(color: Colors.grey), // Border color
                        ),
                        child: DropdownButtonFormField<String>(
                          value: provider.selectedSubcategory.isNotEmpty
                              ? provider.selectedSubcategory
                              : null,
                          hint: Text(
                            'Select Subcategory',
                            style: context.subTitleTxtStyleblack,
                          ),
                          items:
                              provider.subcategories[provider.selectedCategory]!
                                  .map((subcategory) => DropdownMenuItem(
                                        value: subcategory,
                                        child: Text(
                                          subcategory,
                                          style: context.buttonTestStyle,
                                        ),
                                      ))
                                  .toList(),
                          onChanged: (value) {
                            provider.setSubcategory(value!);
                          },
                          decoration: InputDecoration.collapsed(hintText: ''),
                        ),
                      ),
                      Gap(15.h),
                    },

                    if (provider.selectedSubcategory.isNotEmpty) ...{
                      Container(
                        height: 40.h,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color:
                              Colors.white, // Background color of the container
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                          border:
                              Border.all(color: Colors.grey), // Border color
                        ),
                        child: DropdownButtonFormField<String>(
                          value: provider.selectedProduct.isNotEmpty
                              ? provider.selectedProduct
                              : null,
                          hint: Text(
                            'Select Product',
                            style: context.subTitleTxtStyleblack,
                          ),
                          items:
                              provider.products[provider.selectedSubcategory]!
                                  .map((product) => DropdownMenuItem(
                                        value: product,
                                        child: Text(
                                          product,
                                          style: context.buttonTestStyle,
                                        ),
                                      ))
                                  .toList(),
                          onChanged: (value) {
                            provider.setProduct(value!);
                          },
                          decoration: InputDecoration.collapsed(hintText: ''),
                        ),
                      ),
                    },

                    Gap(15.h),

                    Container(
                      height: 40.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: provider.selectedproducctQuentity.isNotEmpty
                            ? provider.selectedproducctQuentity
                            : null,
                        hint: Text(
                          'Select Products Quantity',
                          style: context.subTitleTxtStyleblack,
                        ),
                        items: provider.categories
                            .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category,
                                    style: context.buttonTestStyle,
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          provider.setProductQuentity(value!);
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: ''), // Removes default underline
                      ),
                    ),
                    Gap(10.h),
                    CustomTextField(
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      counterWidget: const Offstage(),
                      onChanged: (value) {
                        provider.setDescription(value);
                      },
                      hintText: 'Product Description',
                      hintStyle: context.subTitleTxtStyleblack,
                      fillColor: context.appColor.whiteColor,
                    ),

                    Gap(10.h),
                    CustomTextField(
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      counterWidget: const Offstage(),
                      onChanged: (value) {
                        provider.setUnit(value);
                      },
                      hintText: 'Product Unit',
                      hintStyle: context.subTitleTxtStyleblack,
                      fillColor: context.appColor.whiteColor,
                    ),

                    Gap(10.h),
                    CustomTextField(
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      counterWidget: const Offstage(),
                      onChanged: (value) {
                        provider.setPrice(double.tryParse(value) ?? 0.0);
                      },
                      hintText: 'Product Price',
                      hintStyle: context.subTitleTxtStyleblack,
                      fillColor: context.appColor.whiteColor,
                    ),

                    Gap(10.h),
                    CustomTextField(
                      validator: (val) {
                        if (val.toString().isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      counterWidget: const Offstage(),
                      onChanged: (value) {
                        provider
                            .setDiscountPrice(double.tryParse(value) ?? 0.0);
                      },
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
                    Gap(50.h),

                    SizedBox(
                      width: double.infinity,
                      child: ButtonElevated(
                          text: 'Add to Product List',
                          backgroundColor: context.appColor.primarycolor,
                          onPressed: () {
                            _showBottomSheet(context);
                          }),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
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
