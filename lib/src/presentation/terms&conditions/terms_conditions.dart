import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/logic/provider/terms_conditions.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';
// Import the provider

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context); // Handle back button functionality
          },
        ),
        title: Text(
          'Terms & Conditions',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            _buildSectionTitle('1. General Terms'),
            _buildSectionContent(
              'Welcome to Frontshop Emporium! We’re delighted to have you here. By accessing or using our platform, '
              'we kindly ask that you review and agree to our terms and conditions. These ensure a safe and seamless '
              'experience for everyone. If you have any concerns or do not agree with these terms, we respect your '
              'choice to refrain from using our platform. Thank you for understanding!',
            ),
            _buildSectionTitle('2. User Terms'),
            _buildSubSectionTitle('Eligibility'),
            _buildSectionContent(
              '• Users must provide accurate and complete information during registration.',
            ),
            _buildSubSectionTitle('User Responsibilities'),
            _buildSectionContent(
              '• Ensure your account details are secure. You are responsible for all activities under your account.\n'
              '• Use the platform in compliance with all applicable laws and regulations.\n'
              '• Do not engage in fraudulent, abusive, or harmful activities, including posting inappropriate content '
              'or exploiting platform features.',
            ),
            _buildSubSectionTitle('Order and Payment'),
            _buildSectionContent(
              '• Orders are confirmed only upon payment.\n'
              '• Prices, discounts, and offers are subject to change without notice.',
            ),
            _buildSectionTitle('3. Vendor Terms'),
            _buildSubSectionTitle('Registration and Eligibility'),
            _buildSectionContent(
              '• Vendors must provide valid business details and adhere to local commerce regulations.\n'
              '• Vendors must be legally registered businesses and provide necessary documentation (e.g., business '
              'licenses, tax identification). The Company reserves the right to approve or deny vendor applications.\n'
              '• Both parties agree to keep proprietary information confidential. Vendor information will not be shared '
              'without consent, except as required by law.',
            ),
            _buildSubSectionTitle('Vendor Responsibilities'),
            _buildSectionContent(
              '• Maintain accurate product descriptions, prices, and inventory levels.\n'
              '• Ensure timely dispatch and delivery of products. Resolve user complaints promptly.\n'
              '• Vendors must ensure that all products meet quality and safety standards.',
            ),
            _buildSectionTitle('4. Delivery Partner Terms'),
            _buildSubSectionTitle('Eligibility'),
            _buildSectionContent(
              '• Delivery Partners must provide valid identification. Delivery Partners must be legally registered entities '
              'or individuals with appropriate licenses and follow all traffic rules and regulations.',
            ),
            _buildSectionTitle('5. Privacy Policy'),
            _buildSectionContent(
              'Frontshop Emporium is committed to protecting your privacy.\n'
              '• We do not sell your data to third parties.\n'
              '• Data may be shared with service providers, delivery partners, and legal authorities as necessary.',
            ),
            _buildSectionTitle('6. Refund Policy'),
            _buildSectionContent(
              '• Products are eligible for a refund if they are defective, damaged during delivery, or not as described.\n'
              '• Requests must be initiated within 7 days of receiving the product.',
            ),
            _buildSectionTitle('7. Support Policy'),
            _buildSectionContent(
              '• For assistance, contact our support team via email or live chat available on the platform.\n'
              '• Support hours: Monday to Friday, 9 AM – 6 PM (local time).',
            ),
            SizedBox(height: 20),
            
            Row(
              children: [
                Consumer<PageNotifier>(
                  builder: (context, termsNotifier, _) {
                    return Checkbox(
                      value: termsNotifier.isChecked,
                      onChanged: (bool? value) {
                        termsNotifier.toggleCheckbox(value ?? false);
                      },
                    );
                  },
                ),
                Expanded(
                  child: Text(
                    'I agree to the Terms and Conditions',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
            Gap(20.h),

            // Continue Button
            Consumer<PageNotifier>(
              builder: (context, termsNotifier, _) {
                return Center(
                  child: SizedBox(
                    width: 200,
                    child: ButtonElevated(
                      text: AppString.continueTxt,
                      onPressed: termsNotifier.isChecked
                          ? () async {
                              var result =
                                  await termsNotifier.vendorRegister(context);

                              if (result) {
                                _showBottomSheet(context);
                              }
                            }
                          : null,
                      backgroundColor: termsNotifier.isChecked
                          ? context.appColor.primarycolor
                          : Colors.grey,
                    ),
                  ),
                );
              },
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }

  // Function to show the Bottom Sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
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
                alignment: Alignment.centerLeft,
                child: Text('Create Account', style: context.subTitleStyle),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Set up your store and get your business ready for activation',
                  style: context.subTitleTextStyle,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  leading: SvgPicture.asset(AppImages.icon1),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add business information',
                        style: context.subTitleStyle,
                      ),
                      Text(
                        'Add more information about your business',
                        style: context.subTitleTxtStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  leading: SvgPicture.asset(AppImages.icon2),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Set-up your store',
                        style: context.subTitleStyle,
                      ),
                      Text(
                        'Create and customise your online store',
                        style: context.subTitleTxtStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ButtonElevated(
                    text: 'Continue to Setup',
                    onPressed: () {
                      context.clearAndPush(
                        routePath: MyRoutes.SETUPBUSSINESS,
                        args: {'status': '1'},
                      );
                    },
                    backgroundColor: context.appColor.primarycolor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _buildSubSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );
}

Widget _buildSectionContent(String content) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      content,
      style: TextStyle(fontSize: 14, height: 1.5),
    ),
  );
}



// class TermsAndConditionsScreen extends StatelessWidget {
//   const TermsAndConditionsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => PageNotifier(),
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back_ios_rounded),
//             onPressed: ()
//              {
//               Navigator.pop(context); // Handle back button functionality
//             },
//           ),
//           title: Text(
//             'Terms & Conditions',
//             style: TextStyle(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(16.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Agreement to Terms',
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Gap(10.h),
//               Text(
//                 'By using this app, you agree to the following terms and conditions. Please read them carefully.',
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: Colors.grey[700],
//                 ),
//               ),
//               Gap(20.h),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa.

// Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa.

// Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa.''',
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//               ),
//               Gap(20.h),

//               // Checkbox and text
//               Row(
//                 children: [
//                   Consumer<PageNotifier>(
//                     builder: (context, termsNotifier, _) {
//                       return Checkbox(
//                         value: termsNotifier.isChecked,
//                         onChanged: (bool? value) 
//                         {
//                           termsNotifier.toggleCheckbox(value ?? false);
//                         },
//                       );
//                     },
//                   ),
//                   Text(
//                     'I agree to the Terms and Conditions',
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                     ),
//                   ),
//                 ],
//               ),
//               Gap(20.h),

//               // Continue Button
//               Consumer<PageNotifier>(
//                 builder: (context, termsNotifier, _) {
//                   return Center(
//                     child: SizedBox(
//                       width: 200,
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: ButtonElevated(
//                           text: AppString.continueTxt,
//                           onPressed: () async {
//                             if (termsNotifier.isChecked) {
//                               var result =
//                                   await termsNotifier.vendorRegister(context);

//                               if (result) {
//                                 _showBottomSheet(context);
//                               }
//                             }
//                           },
//                           backgroundColor: termsNotifier.isChecked
//                               ? context.appColor.primarycolor
//                               : Color.fromARGB(255, 160, 239, 157),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               Gap(20.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Function to show the Bottom Sheet
//   void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           padding: EdgeInsets.all(20.w),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Centered App Logo
//               Center(
//                 child: Image.asset(
//                   AppImages.applogo, // Replace with your logo path
//                   height: 100.h, // Adjust height as necessary
//                 ),
//               ),

//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text('Create Account', style: context.subTitleStyle),
//               ),

//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                     'Set up your store and get your business ready for activation',
//                     style: context.subTitleTextStyle),
//               ),

//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: ListTile(
//                   leading: Container(child: SvgPicture.asset(AppImages.icon1)),
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Add business information',
//                         style: context.subTitleStyle,
//                       ),
//                       Text(
//                         'Add more information about your business',
//                         style: context.subTitleTxtStyle,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: ListTile(
//                   leading: Container(child: SvgPicture.asset(AppImages.icon2)),
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Set-up your store',
//                         style: context.subTitleStyle,
//                       ),
//                       Text(
//                         'Create and customise your online store',
//                         style: context.subTitleTxtStyle,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Center(
//                 child: SizedBox(
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: ButtonElevated(
//                         text: 'Continue to Setup',
//                         onPressed: () {
//                           context.clearAndPush(
//                             routePath: MyRoutes.SETUPBUSSINESS,
//                             args: {'status': '1'},
//                           );
//                         },
//                         backgroundColor: context.appColor.primarycolor),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
