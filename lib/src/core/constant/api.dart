class APIURL {
  static const BASE_URL = "https://www.mv.frontshopemporium.in/xam/";
  static const String sendOtp = "${BASE_URL}auth/send-otp/vendor";
  static const String verifyOtp = "${BASE_URL}auth/verify-otp/vendor";
  static const String login = "${BASE_URL}auth/login/vendor";
  static const String vendorRegister = "${BASE_URL}auth/register/vendor";
  static const String createStore = "${BASE_URL}stores";
  static const String getStore = "${BASE_URL}stores/";

  static const String updateStore = "${BASE_URL}stores/";
  static const String forgetPassword = "${BASE_URL}auth/forgot-password/vendor";
  static const String verifyForgetPassword =
      "${BASE_URL}auth/forgot-password-verify-otp/vendor";
  static const String reset_password = "${BASE_URL}auth/reset-password/vendor";
  static const String get_category = "${BASE_URL}categories";
  static const String getProduct = "${BASE_URL}products/vendor";
  static const String getCategoryByLevel = "${BASE_URL}categories/by-level/1";
  static const String getMe = "${BASE_URL}auth/me";
  static const String refresh_token = "${BASE_URL}auth/refresh-token";
  static const String createProduct = "${BASE_URL}products";
  static const String vendorLogOut = "${BASE_URL}auth/logout/vendor";
  static const String uploadImage = "${BASE_URL}images/upload";
  static const String uploadImages = "${BASE_URL}images/uploads";
  static const String deleteProduct = "${BASE_URL}products/";
  static const String updateProduct = "${BASE_URL}products/";
  static const String myOrder = "${BASE_URL}orders/store";
  static const String productTags = "${BASE_URL}product-tags";
  static const String vendorOtpSubmit =
      "${BASE_URL}delivery/verify-delivery-partner-otp";

  static const String updateStatus = "${BASE_URL}orders/items/";

  static const String getWallet = "${BASE_URL}wallet/vendor";

  static const String insightsTotalOrders =
      "${BASE_URL}insights/total-orders/vendor";
  static const String insightsCompleteOrders =
      "${BASE_URL}insights/complete-orders/vendor";
  static const String insightsCancelledOrders =
      "${BASE_URL}insights/cancelled-orders/vendor";
  static const String insightsMostPopularItemOrders =
      "${BASE_URL}insights/most-popular-items/vendor";
  static const String addAddress = "${BASE_URL}user/addresses";
  static const String checkPin = "${BASE_URL}pin-codes/check/";
    static const String updateProfile = "${BASE_URL}user/profile";
}
