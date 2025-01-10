
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';

class ProductFormScreen1 extends StatefulWidget {
  @override
  State<ProductFormScreen1> createState() => _ProductFormScreen1State();
}

class _ProductFormScreen1State extends State<ProductFormScreen1> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getCategoryByLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField<String>(
                    value: provider.selectedCategory.isNotEmpty
                        ? provider.selectedCategory
                        : null,
                    hint: Text('Select Category'),
                    items: provider.categories
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      provider.setCategory(value!);
                    },
                  ),
                  if (provider.selectedCategory.isNotEmpty)
                    DropdownButtonFormField<String>(
                      value: provider.selectedSubcategory.isNotEmpty
                          ? provider.selectedSubcategory
                          : null,
                      hint: Text('Select Subcategory'),
                      items: provider.subcategories[provider.selectedCategory]!
                          .map(
                            (subcategory) => DropdownMenuItem(
                              value: subcategory,
                              child: Text(subcategory),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        provider.setSubcategory(value!);
                      },
                    ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Submit logic
                      //  provider.submitProduct();
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}