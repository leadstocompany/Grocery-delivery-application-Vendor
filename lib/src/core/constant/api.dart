class APIURL {

  static const BASE_URL = "http://210.89.44.183:3333/xam/";
  static const String sendOtp = "${BASE_URL}auth/send-otp/vendor";
  static const String verifyOtp = "${BASE_URL}auth/verify-otp/vendor";

  static const String login = "${BASE_URL}/api/v1/login/loginByPassword";
  static const String vendorRegister = "${BASE_URL}auth/register/vendor";
  
  static const String saveBussinessDetails = "${BASE_URL}/api/v1/user/save/business/Details";

}

