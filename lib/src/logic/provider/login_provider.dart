import 'package:flutter/material.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/logic/repo/auth_repo.dart';

class LoginProvider extends ChangeNotifier {
  final _authRepo = getIt<AuthRepo>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailOrPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmsNewPassword = TextEditingController();
  final TextEditingController countryCodes = TextEditingController();

  String countryCode = '';

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

  Future<bool> forgetPassword(BuildContext context, String countryCode) async {
    context.showLoader(show: true);
    countryCodes.text = countryCode;

    var data = {"phone": countryCode + phoneController.text};

    print("Check dddd data: $data");

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

  Future<bool> verifyForgetPassword(BuildContext context, String value) async {
    context.showLoader(show: true);

    var data = {
      "phone": countryCodes.text + phoneController.text,
      "otp": value
    };

    print("Check request data: $data");

    try {
      var result = await _authRepo.verifyForgetPassword(data);

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
              content: Text("Otp verify successful!"),
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

  Future<bool> reset_password(BuildContext context) async {
    context.showLoader(show: true);

    var data = {
      "resetToken": await SharedPrefUtils.getResetToken(),
      "newPassword": newPassword.text
    };

    print("Check request data: $data");

    try {
      var result = await _authRepo.reset_password(data);

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
              content: Text("Password successfully created!"),
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
