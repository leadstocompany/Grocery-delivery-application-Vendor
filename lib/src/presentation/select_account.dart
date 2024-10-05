import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';

class SelectAccount extends StatefulWidget {
  const SelectAccount({super.key});

  @override
  State<SelectAccount> createState() => _SelectAccountState();
}

class _SelectAccountState extends State<SelectAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Container _buildBody(BuildContext context) {
    return Container(
        height: context.height,
        width: context.width,
        decoration: BoxDecoration(
          color: context.appColor.blackColor,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.splashscreensImage),
            opacity: 0.8,
          ),
        ),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: SafeArea(
              child: Column(
                children: [
                  _subLogo(),
                  welcomeEshopTxt(),
                  eCommerceforBusinessTxt(),
                  //  signInyourAccTxt(),
                  signInBtn(),
                  signUpBtn()
                ],
              ),
            )));
  }

  _subLogo() {
    return Padding(
        padding: const EdgeInsetsDirectional.only(top: 30.0),
        child: SvgPicture.asset(
          'assets/images/logokamduh.svg',
          color: Colors.white,
          // colorFilter: ColorFilter.mode(
          //     Theme.of(context).colorScheme.primarytheme, BlendMode.srcIn),
        ));
  }

  welcomeEshopTxt() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 30.0),
      child: Text(
        'WELCOME ESHOP',

        // getTranslated(context, 'WELCOME_ESHOP')!,
        // style: Theme.of(context).textTheme.titleMedium!.copyWith(
        //     color: Theme.of(context).colorScheme.fontColor,
        //     fontWeight: FontWeight.bold),
      ),
    );
  }

  eCommerceforBusinessTxt() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 5.0,
      ),
      child: Text('ECOMMERCE APP FOR ALL BUSINESS'
          // getTranslated(context, 'ECOMMERCE_APP_FOR_ALL_BUSINESS')!,
          // style: Theme.of(context).textTheme.titleSmall!.copyWith(
          //     color: Theme.of(context).colorScheme.fontColor,
          //     fontWeight: FontWeight.normal),
          ),
    );
  }

  signInyourAccTxt() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 80.0, bottom: 40),
      child: Text('SIGNIN_ACC_LB'
          //  getTranslated(context, 'SIGNIN_ACC_LBL')!,
          // style: Theme.of(context).textTheme.titleMedium!.copyWith(
          //     color: Theme.of(context).colorScheme.fontColor,
          //     fontWeight: FontWeight.bold),
          ),
    );
  }

  signInBtn() {
    return CupertinoButton(
      child: Container(
          width: MediaQuery.of(context).size.width! * 0.8,
          height: 45,
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Text(
            'LOGIN',
            textAlign: TextAlign.center,
          )),
      onPressed: () {
        // Navigator.pushNamed(context, Routers.loginScreen,
        //     arguments: {"isPop": false});
      },
    );
  }

  signUpBtn() {
    return CupertinoButton(
      child: Container(
          width: MediaQuery.of(context).size.width! * 0.8,
          height: 45,
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Text(
            'SKIP',
            textAlign: TextAlign.center,
          )),
      onPressed: () 
      {
        context.clearAndPush(routePath: MyRoutes.LOGIN);
      },
    );
  }
}
