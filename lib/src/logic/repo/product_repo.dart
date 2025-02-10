import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vendor_app/src/core/utiils_lib/custom_dio_exception.dart';
import 'package:vendor_app/src/core/utiils_lib/response_type_def.dart';
import 'package:vendor_app/src/core/utiils_lib/shared_pref_utils.dart';
import 'package:vendor_app/src/data/ProductCategoryModel.dart';
import 'package:vendor_app/src/data/prdouct_model.dart';
import 'package:vendor_app/src/data/upload_image.dart';
import 'package:vendor_app/src/data/upload_multiple_images.dart';
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

      if (prdouctModel.data!.isNotEmpty)
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

  FutureResult<List<ProductCategoryModel>> getCategoryByLevel(data) async 
  {
    try {
      var response = await _productServices.getCategoryByLevel(data);

      final List<ProductCategoryModel> productModels = (response.data as List)
            .map((item) => ProductCategoryModel.fromJson(item))
            .toList();
      if (response != null && response.data != null) 
      {
        // Parse the response data into a list of ProductCategoryModel
        final List<ProductCategoryModel> productModels = (response.data as List)
            .map((item) => ProductCategoryModel.fromJson(item))
            .toList();

        // Print or handle the fetched data
        if (productModels.isNotEmpty) 
        {
          print(
              "Data successfully fetched and parsed: ${productModels.length} categories.");
        }
      }
      return right(productModels);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

    FutureResult<String> createProduct(data) async {
    try {
      var response = await _productServices.createProduct(data);
      final String model = response.toString();

      return right(model);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }
 
 FutureResult<String> deleteProduct(data,id) async
  {
    try {
      var response = await _productServices.deleteProduct(data,id);
      final String model = response.toString();

      return right(model);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

   FutureResult<String> updateProduct(data,id) async
  {
    try {
      var response = await _productServices.updateProduct(data,id);
      final String model = response.toString();

      return right(model);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }

  
 
 
   FutureResult<UploadImage> uploadImage(File imageFile) 
   async {
    try {
      final response = await _productServices.uploadImage(imageFile);
      UploadImage upload=uploadImageFromJson(response.toString());
      return right(upload);
    } on DioException catch (e) {
      final error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }
  FutureResult<UploadMultipleImages> uploadImages(List<File> imageFiles) async 
  {
    try {
      final response = await _productServices.uploadImages( imageFiles);
      UploadMultipleImages upload = uploadMultipleImagesFromJson(response.toString());
      return right(upload);
    } on DioException catch (e) {
      final error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }




}
