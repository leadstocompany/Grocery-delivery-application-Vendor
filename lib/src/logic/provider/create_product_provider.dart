import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/snack_bar.dart';
import 'package:vendor_app/src/data/ProductCategoryModel.dart';
import 'package:vendor_app/src/data/prdouct_model.dart';
import 'package:vendor_app/src/logic/repo/product_repo.dart';

import 'package:flutter/material.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/data/prdouct_model.dart';
import 'package:vendor_app/src/logic/repo/product_repo.dart';
import 'package:vendor_app/src/logic/services/product_locator.dart';

class ProductProvider extends ChangeNotifier {
  ProductCategoryModel? selectedCategory;
  // String selectedSubcategory = '';
  // String selectedProduct = '';

  ProductCategoryModel? selectedSubcategory;
  ProductCategoryModel? selectedProduct;

  String productId = '';
  // String productDescription = '';
  // String productUnit = '';
  // double productPrice = 0.0;
  // double discountPrice = 0.0;
  bool inStock = true;

  String selectedProductQuantity = '';

  bool isLoading = false;

  final _authRepo = getIt<ProductRepo>();

  // Dynamic Data
  List<ProductCategoryModel> categories = [];
  Map<String, List<ProductCategoryModel>> subcategories = {};
  Map<String, List<ProductCategoryModel>> products = {};

  void setCategory(ProductCategoryModel category)
   {
    selectedCategory = category;
    selectedSubcategory = null;
    selectedProduct = null;
    products.clear(); 
    loadSubcategories(category);
    notifyListeners();
   }

  void setSubcategory(ProductCategoryModel subcategory) {
    selectedSubcategory = subcategory;
    selectedProduct = null;
    loadProducts(subcategory); // Load products for the selected subcategory
    notifyListeners();
  }

  void loadSubcategories(ProductCategoryModel category) {
    if (category.childCategories != null) {
      subcategories[category.name!] = category.childCategories!;
    } else {
      subcategories.clear();
    }
    notifyListeners();
  }

  // Load products for a selected subcategory
  void loadProducts(ProductCategoryModel subcategory) {
    if (subcategory.childCategories != null) {
      products[subcategory.name!] = subcategory.childCategories!;
    } else {
      products.clear();
    }
    notifyListeners();
  }

  void setProduct(ProductCategoryModel product) {
    productId = product.id!;
    selectedProduct = product;
    notifyListeners();
  }

  void setProductQuantity(String value) {
    selectedProductQuantity = value;
    notifyListeners();
  }

  
  void toggleStock(bool value) {
    inStock = value;
    notifyListeners();
  }

  void clearData() {
    productDescriptionController.clear();
    productUnitController.clear();
    productPriceController.clear();
    productProductDiscountPriceController.clear();
    productStockController.clear();
    productNameController.clear();
    productquantityController.clear();
    productqlongDescriptionController.clear();
    _isImageLoading = false;
    _selectedImage = null;

    selectedCategory = null;
    selectedSubcategory = null;
    selectedProduct = null;
    selectedSubcategory;
    categories = [];

    subcategories.forEach((key, value) => value.clear());
    products.forEach((key, value) => value.clear());
    subcategories = {};
    products = {};
  }

  // Fetch categories from API
  Future<void> getCategoryByLevel() async {
    clearData();
    isLoading = true;
    notifyListeners();

    final result = await _authRepo.getCategoryByLevel({});
    result.fold(
      (error) {
        isLoading = false;
        notifyListeners();
      },
      (categoryList) {
        // Populate categories and subcategories dynamically
        categories = categoryList;

        // Populate subcategories for each category
        for (var category in categoryList) {
          if (category.childCategories != null) {
            subcategories[category.name!] = category.childCategories!;
          }

          if (category.childCategories != null) {
            products[category.name!] = category.childCategories!;
          }
        }

        isLoading = false;
        notifyListeners();
      },
    );
  }

  // Load subcategories for a selected category

  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  File? get selectedImage => _selectedImage;

  // Method to pick an image
  Future<void> pickImage(BuildContext context) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _selectedImage = File(pickedFile.path);
      uploadImage(context);
      notifyListeners();
    }
  }

  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productUnitController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productProductDiscountPriceController =
      TextEditingController();
  TextEditingController productStockController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productquantityController = TextEditingController();
  TextEditingController productqlongDescriptionController =
      TextEditingController();

  Future<bool> createProduct(BuildContext context) async {
    context.showLoader(show: true);

    try {
      var data = {
        "categoryId": productId,
        "quantity": productquantityController.text,
        "description": productDescriptionController.text,
        "unit": productUnitController.text,
        "basePrice": productPriceController.text,
        "discountPrice": productProductDiscountPriceController.text,
        "isInStock": inStock,
        "stock": int.parse(productStockController.text.isEmpty
            ? '0'
            : productStockController.text),
        "name": selectedProduct!.name,
        "additionalInfo": productqlongDescriptionController.text,
        "productImages": [_uploadedUrl]
      };

      print("hjhdfjg  ${data}");
      var result = await _authRepo.createProduct(data);

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
              content: Text("Product created successful!"),
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

  Future<bool> deleteProduct(BuildContext context, String id) async {
    context.showLoader(show: true);

    try {
      var data = {};

      var result = await _authRepo.deleteProduct(data, id);

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
          _showSnackBar(context, "Product deleted successful!", Colors.green);

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

  bool isLoadingg = false;
  List<Product> products1 = [];

  Future<void> getProduct() async {
    isLoadingg = true;
    notifyListeners();

    final result = await _authRepo.getProduct({});
    result.fold(
      (error) {
        // Handle error
        isLoadingg = false;
        notifyListeners();
      },
      (productList) {
        print("nfjkkjjfgk  ${productList}");
        products1 = productList.data!;
        isLoadingg = false;
        notifyListeners();
      },
    );
  }

//  Future<bool> uploadImage(BuildContext context) async
//  {
//     context.showLoader(show: true);

//     try {
//       var data = {
//         "image": selectedImage!.path,

//       };
//       var result = await _authRepo.uploadImage(data);
//       context.showLoader(show: false);

//       return result.fold(
//         (error)
//          {
//           // Show error Snackbar
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(error.message),
//               backgroundColor: Colors.red,
//             ),
//           );
//           return false; // Login failed
//         },
//         (response)
//         {

//           print("check thie respodnse ${ response.status}");

//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text("Product created successful!"),
//               backgroundColor: Colors.green,
//             ),
//           );
//           return true;
//         },
//       );
//     } catch (e) {
//       context.showLoader(show: false);
//       print("Unexpected error: $e");

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Something went wrong. Please try again."),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return false;
//     }
//   }

  bool _isImageLoading = false;
  bool get isImageLoading => _isImageLoading;

  String _uploadedUrl = '';

  Future<bool> uploadImage(BuildContext context) async {
    final result = await _authRepo.uploadImage(selectedImage!);

    return result.fold(
      (error) {
        // _showSnackBar(context, error.message, Colors.red);
        return false;
      },
      (uploadImage) {
        _isImageLoading = true;
        _uploadedUrl = uploadImage.data!.url.toString();
        notifyListeners();

        _showSnackBar(context, "Image uploaxded successfully!", Colors.green);
        return true;
      },
    );
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    showTopSnackBar(context, message, color);
  }
}
