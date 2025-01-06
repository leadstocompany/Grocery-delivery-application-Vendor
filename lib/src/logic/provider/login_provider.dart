import 'package:flutter/material.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/logic/repo/auth_repo.dart';

class LoginProvider extends ChangeNotifier {
  final _authRepo = getIt<AuthRepo>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailOrPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<bool> login(BuildContext context) async {
    context.showLoader(show: true);

    var data = {
      "phone": "+91" + emailOrPasswordController.text,
      "password": passwordController.text
    };

    print("Check request data: $data");

    try {
      var result = await _authRepo.login(data);

      context.showLoader(show: false);

      return result.fold(
        (error) {
          // Show error Snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message),
              backgroundColor: Colors.red,
            ),
          );
          return false; // Login failed
        },
        (response) {
          // Login success
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login successful!"),
              backgroundColor: Colors.green,
            ),
          );
          return true;
        },
      );
    } catch (e) {
      context.showLoader(show: false);
      print("Unexpected error: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Something went wrong. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  // Future<bool> forgetPassword(BuildContext context, String countryCode) async {
  //   context.showLoader(show: true);
  //   var data = {"phone": countryCode + phoneController.text};
  //   print("check response ${data}");
  //   try {
  //     var response = await _authRepo.forgetPassword(data);
  //     context.showLoader(show: false);
  //     return true;
  //   } catch (e) {
  //     context.showLoader(show: false);
  //     print("Error sending OTP: $e");
  //     return false;
  //   }
  // }

  Future<bool> forgetPassword(BuildContext context, String countryCode) async {
    context.showLoader(show: true);

    var data = {"phone": countryCode + phoneController.text};

    print("Check request data: $data");

    try {
      var result = await _authRepo.forgetPassword(data);

      context.showLoader(show: false);

      return result.fold(
        (error) {
          // Show error Snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message),
              backgroundColor: Colors.red,
            ),
          );
          return false; // Login failed
        },
        (response) {
          // Login success
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Send Otp successful!"),
              backgroundColor: Colors.green,
            ),
          );
          return true;
        },
      );
    } catch (e) {
      context.showLoader(show: false);
      print("Unexpected error: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Something went wrong. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }
}
