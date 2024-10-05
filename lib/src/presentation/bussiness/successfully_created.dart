import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';

class PinCreated extends StatefulWidget {
  const PinCreated({super.key});

  @override
  State<PinCreated> createState() => _PinCreatedState();
}

class _PinCreatedState extends State<PinCreated> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      // Navigate to another route after 2 seconds (if needed)
      context.clearAndPush(routePath: MyRoutes.APPROVEDSTATUS);
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Use Center to align the content in the middle
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Center the column content
            children: [
              SvgPicture.asset(
                AppImages.submit,
                fit: BoxFit.fill,
                width: 150,
                height: 100,
              ),
              const SizedBox(height: 20), // Add space between image and text
              Text(
                'Pin Created',
                style: context.subTitleStyle,
              ),
              Text(
                'Your details have been saved successfully',
                style: context.subTitleTxtStyleblack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
