import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/logic/provider/create_product_provider.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';

class HighlightField extends StatelessWidget {
  final int index;
  final String keyText;
  final String valueText;

  const HighlightField(
      {required this.index, required this.keyText, required this.valueText});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        return Card(
          color: Colors.white10,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // CustomTextField(
                //   controller: TextEditingController(text: keyText),
                //   keyBoardType: TextInputType.text,
                //   onChanged: (value)
                //   {
                //     provider.updateHighlight(index, value,
                //         provider.highlights[index]["value"] ?? "");
                //   },
                //   hintText: 'Key',
                //   hintStyle: context.subTitleTxtStyleblack,
                //   fillColor: context.appColor.whiteColor,
                // ),
                TextField(
                  decoration: InputDecoration(labelText: "Key"),
                  controller: TextEditingController(text: keyText),
                
                  onChanged: (value) {
                    provider.updateHighlight(index, value,
                        provider.highlights[index]["value"] ?? "");
                  },
                ),
                SizedBox(height: 10),

                // CustomTextField(
                //   controller: TextEditingController(text: valueText),
                //   keyBoardType: TextInputType.text,
                //   onChanged: (value) {
                //     provider.updateHighlight(
                //         index, provider.highlights[index]["key"] ?? "", value);
                //   },
                //   hintText: 'Value',
                //   hintStyle: context.subTitleTxtStyleblack,
                //   fillColor: context.appColor.whiteColor,
                // ),
                TextField(
                  decoration: InputDecoration(labelText: "Value"),
                  controller: TextEditingController(text: valueText),
                  onChanged: (value) {
                    provider.updateHighlight(
                        index, provider.highlights[index]["key"] ?? "", value);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
