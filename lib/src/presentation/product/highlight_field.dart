

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';

class HighlightField extends StatelessWidget {
  final int index;

  const HighlightField({required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        return Card(
          color: Colors.white.withOpacity(0.9),
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: provider.keyControllers[index],
                  labelText: "Title",
                  keyBoardType: TextInputType.text,
                  onChanged: (value) {
                    provider.updateHighlight(index, value,
                        provider.highlights[index]["value"] ?? "");
                  },
                  hintText: 'Title',
                  hintStyle: context.subTitleTxtStyleblack,
                  fillColor: context.appColor.whiteColor,
                ),

                // TextField(
                //   decoration: InputDecoration(labelText: "Key"),
                //   controller: provider.keyControllers[index],
                //   onChanged: (value) {
                //     provider.updateHighlight(index, value,
                //         provider.highlights[index]["value"] ?? "");
                //   },
                // ),

                SizedBox(height: 10),

                CustomTextField(
                  controller: provider.valueControllers[index],
                  keyBoardType: TextInputType.text,
                  onChanged: (value) {
                    provider.updateHighlight(
                        index, provider.highlights[index]["key"] ?? "", value);
                  },
                  hintText: 'Value',
                  labelText: "Value",
                  hintStyle: context.subTitleTxtStyleblack,
                  fillColor: context.appColor.whiteColor,
                ),

                // TextField(
                //   decoration: InputDecoration(labelText: "Value"),
                //   controller: provider.valueControllers[index],
                //   onChanged: (value) {
                //     provider.updateHighlight(
                //         index, provider.highlights[index]["key"] ?? "", value);
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
