import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vendor_app/src/core/utiils_lib/custom_dio_exception.dart';
import 'package:vendor_app/src/core/utiils_lib/response_type_def.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/data/prdouct_model.dart';
import 'package:vendor_app/src/data/vendor_otpModel.dart';
import 'package:vendor_app/src/logic/services/product_locator.dart';
import 'package:vendor_app/src/logic/services/service_locator.dart';

class ProductRepo {
  final ProductService _productServices;

  ProductRepo(this._productServices);

  FutureResult<PrdouctModel> getProduct(data) async {
    try {
      var response = await _productServices.getProduct(data);

      final PrdouctModel prdouctModel =
          prdouctModelFromJson(response.toString());

      if (prdouctModel.product!.isNotEmpty)
       {
        print("check data are fetch are note");
      }

      //  final String model = response.toString();

      return right(prdouctModel);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }
}
