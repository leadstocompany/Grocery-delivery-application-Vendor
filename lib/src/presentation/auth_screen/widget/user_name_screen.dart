import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/string/app_string.dart';
import 'package:vendor_app/src/logic/provider/PageNotifier.dart';
import 'package:vendor_app/src/presentation/widgets/custom_text_field.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class UserNameScreen extends StatelessWidget {
  const UserNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageNotifier = Provider.of<PageNotifier>(context, listen: false);

    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.pleaseProvideUserName,
            style: context.subTitleTextStyle.copyWith(fontSize: 17.sp),
          ),
          Gap(20.h),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  validator: (val) {
                    if (val.toString().isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  maxLength: 64,
                  counterWidget: const Offstage(),
                  // controller: context.read<AuthCubit>().userName,
                  hintText: AppString.firstName,
                  fillColor: context.appColor.greyColor100,
                ),
                Gap(10.h),
                CustomTextField(
                  validator: (val) {
                    if (val.toString().isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  maxLength: 64,
                  counterWidget: const Offstage(),
                  // controller: context.read<AuthCubit>().userName,
                  hintText: AppString.lastName,
                  fillColor: context.appColor.greyColor100,
                ),
                Gap(10.h),
                CustomTextField(
                  validator: (val) {
                    if (val.toString().isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  maxLength: 64,
                  counterWidget: const Offstage(),
                  // controller: context.read<AuthCubit>().userName,
                  hintText: AppString.email,
                  fillColor: context.appColor.greyColor100,
                ),
              ],
            ),
          ),
          const Gap(5),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              AppString.max64Char,
              style: context.smallTxtStyle,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ButtonElevated(
                text: AppString.continueTxt,
                 backgroundColor: context.appColor.primarycolor,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    pageNotifier.goToNextPage();
                  }
                }),
          ),
          Gap(25.h),
          Gap(30.h),
        ],
      ),
    );
  }
}
