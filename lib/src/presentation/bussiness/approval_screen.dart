import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';

class ApprovalScreen extends StatefulWidget {
  const ApprovalScreen({super.key});

  @override
  State<ApprovalScreen> createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 2), () async 
    {
      await SharedPrefUtils.setToken(authToken: "1");
      // Navigate to another route after 2 seconds (if needed)
      context.clearAndPush(routePath: MyRoutes.SELECTACCOUNT);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.w), // Padding for responsiveness
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Card with circular corners
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r), // Circular corners
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w), // Padding inside the card
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Success image
                      SvgPicture.asset(
                        AppImages.success,
                        fit: BoxFit.fill,
                        width: 150,
                        height: 100,
                      ),
                      Gap(20.h), // Spacing between the image and text
                      // Success message
                      Text(
                        'Business Details  Received',
                        style: context.subTitleStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Gap(40.h), // Spacing between the card and the below text
              // Waiting for approval message
              Text(
                'Waiting for Approval.....',
                style: context.subTitleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
