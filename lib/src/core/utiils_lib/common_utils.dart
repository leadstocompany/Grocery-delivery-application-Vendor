import 'dart:math' as math;


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/globle_variable.dart';
import 'package:vendor_app/src/presentation/widgets/utils_method.dart';




/// Hides soft keyboard if already shown
///
enum SnackType {
  success,
  alert,
  error
}


void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void buzzSnackBar(BuildContext context,String title){

  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
    duration: const Duration(seconds: 1),
    backgroundColor:const Color(0xffEDF8F1),
    elevation: 0,
    content: Column(
      children: [
        Row(
          children: [
           // Image.asset(AppImages.colorBell,height: 22,width: 22,),
           const SizedBox(width: 10,),
            Expanded(child: Text("You have Buzzed to ${title}",style: context.titleStyle.copyWith(fontSize: 14),))
            , InkWell(
                onTap: (){
                  ScaffoldMessenger.of(context).clearSnackBars();
                },
                child: Icon(Icons.clear))
          ],
        ),
        Gap( 8.h,),
        Padding(
          padding:  EdgeInsets.only(left: 8.0,right: 50.w),
          child: StreamBuilder<int>(
            stream: UtilsMethod.counterStream(),
            builder: (context, snapshot) {
              return LinearProgressIndicator(
                value:(snapshot.data??0)/100,
              );
            }
          ),
        )
      ],
    ),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 185.h,
        right: 0,
        left: 0),
  ));
}


/// Show snackbar
void showSnackBar(
    { BuildContext ?context,
    required String message,
    SnackType snackType  = SnackType.success,
    bool canDismiss = true,
    bool sticky = false,
    SnackBarBehavior behaviour = SnackBarBehavior.floating,
    }) {
  //if (!context?.mounted??) return;
  //Clear snack bars
  ScaffoldMessenger.of(context??GlobalVariable.globalScaffoldKey.currentContext!).clearSnackBars();
  // Snack bar
  final snackBar = SnackBar(
    behavior: behaviour,
    padding: EdgeInsets.zero,
    elevation: 0,
    content: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:snackType==SnackType.success? const [
            Color(0xFF61B15A),
            Color(0xFF6ABE8B)
          ]:snackType==SnackType.alert?
          const [
            Color(0xFFFF8906),
            Color(0xFFFFA745),
          ]:
          const [
            Colors.red,
            Colors.redAccent,
          ],
        ),
      ),
      child: Text(
        message,
        style: (context??GlobalVariable.globalScaffoldKey.currentContext!).titleStyle.copyWith(fontSize: 16.sp,color: Colors.white),
      textAlign: TextAlign.center,
      ),
    ),
    duration: sticky ? const Duration(days: 365) : const Duration(seconds: 3),
    dismissDirection:
        canDismiss ? DismissDirection.down : DismissDirection.none,
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context??GlobalVariable.globalScaffoldKey.currentContext!).showSnackBar(snackBar);
}

// Format File Size
String getFileSizeString({required int bytes, int decimals = 0}) {
  if (bytes <= 0) {
    return "0";
  }
  const suffixes = ["b", "kb", "mb", "gb", "tb"];
  var i = (math.log(bytes) / math.log(1024)).floor();
  return ((bytes / math.pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
}
