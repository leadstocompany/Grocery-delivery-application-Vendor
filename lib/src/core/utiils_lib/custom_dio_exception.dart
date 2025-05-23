// import 'package:dio/dio.dart';
// import 'package:vendor_app/src/core/utiils_lib/response_type_def.dart';
// import 'package:dio/dio.dart';

// import 'package:dio/dio.dart';

// class CustomDioExceptions implements Exception {
//   late String message;

//   CustomDioExceptions.fromDioException(DioException dioException) {
//     switch (dioException.type) {
//       case DioExceptionType.cancel:
//         message = "Request to API server was cancelled";
//         break;
//       case DioExceptionType.connectionTimeout:
//         message = "Connection timeout with API server";
//         break;
//       case DioExceptionType.receiveTimeout:
//         message = "Receive timeout in connection with API server";
//         break;
//       case DioExceptionType.badResponse:
//         message = _handleStatusError(
//           dioException.response?.statusCode,
//           dioException.response?.data,
//         );
//         break;
//       case DioExceptionType.sendTimeout:
//         message = "Send timeout in connection with API server";
//         break;
//       case DioExceptionType.unknown:
//         message = "Unexpected error occurred";
//         break;
//       default:
//         message = "Something went wrong";
//         break;
//     }
//   }

//   String _handleStatusError(int? statusCode, dynamic error)
//    {
//     switch (statusCode) {
//       case 400:
//         return error["message"] ?? 'Bad request';
//       case 401:
//         return error["message"] ?? 'Unauthorized';
//       case 403:
//         return error["message"] ?? 'Forbidden';
//       case 404:
//         return error["message"] ?? 'Not Found';
//       case 422:
//         return error["message"] ?? 'Cannot proceed with the data provided.';
//       case 406:
//         return error["message"] ?? 'Input Mismatched';
//       case 500:
//         return error["message"] ?? 'Internal server error';
//       case 502:
//         return error["message"] ?? 'Bad gateway';
//       default:
//         return error["message"] ?? 'Oops something went wrong';
//     }
//   }

//   /// Handle the error and return a `CustomError`
//   static CustomError handleError(DioException e) {
//     final errorMessage = CustomDioExceptions.fromDioException(e).toString();
//     return CustomError(errorMessage, e.response?.statusCode);
//   }

//   @override
//   String toString() => message;
// }

// // class CustomDioExceptions implements Exception {
// //   late String message;

// //   CustomDioExceptions.fromDioException(DioException dioException) {
// //     switch (dioException.type)
// //     {
// //       case DioExceptionType.cancel:
// //         message = "Request to API server was cancelled";
// //         break;
// //       case DioExceptionType.connectionTimeout:
// //         message = "Connection timeout with API server";
// //         break;
// //       case DioExceptionType.receiveTimeout:
// //         message = "Receive timeout in connection with API server";
// //         break;
// //       case DioExceptionType.badResponse:
// //         message = _handleStatusError(
// //           dioException.response?.statusCode,
// //           dioException.response?.data,
// //         );
// //         break;
// //       case DioExceptionType.sendTimeout:
// //         message = "Send timeout in connection with API server";
// //         break;
// //       case DioExceptionType.unknown:
// //         message = "Unexpected error occurred";
// //         break;
// //       default:
// //         message = "Something went wrong";
// //         break;
// //     }
// //   }

// //   String _handleStatusError(int? statusCode, dynamic error) {
// //     switch (statusCode) {
// //       case 400:
// //         return error["message"] ?? 'Bad request';
// //       case 401:
// //         return error["message"] ?? 'Unauthorized';
// //       case 403:
// //         return error["message"] ?? 'Forbidden';
// //       case 404:
// //         return error["message"] ?? 'Not Found';
// //       case 422:
// //         return error["message"] ?? 'Can not proceed with the data provided.';
// //       case 406:
// //         return error["message"] ?? 'Input Mismatched';
// //       case 500:
// //         return error["message"] ?? 'Internal server error';
// //       case 502:
// //         return error["message"] ?? 'Bad gateway';
// //       default:
// //         return error["message"] ?? 'Oops something went wrong';
// //     }
// //   }

// //   /// call this method from api repo to handle the error
// //   static CustomError handleError(DioException e)
// //   {
// //     final errorMessage = CustomDioExceptions.fromDioException(e).toString();

// //     return CustomError(errorMessage, e.response?.statusCode);
// //   }

// //   @override
// //   String toString() => message;
// // }
import 'package:dio/dio.dart';
import 'package:vendor_app/src/core/utiils_lib/response_type_def.dart';

class CustomDioExceptions implements Exception {
  late String message;

  CustomDioExceptions.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleStatusError(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleStatusError(int? statusCode, dynamic error) {
    if (error is Map<String, dynamic>) {
      // Extract the actual message inside the response
      final errorMessage = error["message"];
      if (errorMessage is Map<String, dynamic>) {
        return errorMessage["message"] ?? "Unknown error";
      }
      return errorMessage ?? "Unknown error";
    }

    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 422:
        return 'Cannot proceed with the data provided.';
      case 406:
        return 'Input Mismatched';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  //   final int statusCode;
  // final String message;
  // final String? error;

  static CustomError handleError(DioException e) {
    final errorMessage = CustomDioExceptions.fromDioException(e).toString();

    return CustomError(
        statusCode: e.response?.statusCode ?? 0,
        message: errorMessage,
        error: e.message);
  }

  @override
  String toString() => message;
}
