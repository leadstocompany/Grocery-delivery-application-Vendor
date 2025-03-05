import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/snack_bar.dart';
import 'package:vendor_app/src/data/ProductCategoryModel.dart';
import 'package:vendor_app/src/data/prdouct_model.dart';
import 'package:vendor_app/src/data/product_tags.dart';
import 'package:vendor_app/src/data/upload_multiple_images.dart';
import 'package:vendor_app/src/logic/repo/product_repo.dart';

import 'package:flutter/material.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/data/prdouct_model.dart';
import 'package:vendor_app/src/logic/repo/product_repo.dart';
import 'package:vendor_app/src/logic/services/product_locator.dart';

class ProductProvider extends ChangeNotifier {
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productUnitController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productProductDiscountPriceController =
      TextEditingController();
        TextEditingController productdiscount =
      TextEditingController();

  TextEditingController productStockController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productquantityController = TextEditingController();
  TextEditingController productqlongDescriptionController =
      TextEditingController();

  TextEditingController selectProductCommission = TextEditingController();

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

  List<ProductImage> productImage = [];

  // Dynamic Data
  List<ProductCategoryModel> categories = [];
  Map<String, List<ProductCategoryModel>> subcategories = {};
  Map<String, List<ProductCategoryModel>> products = {};

  void setCategory(ProductCategoryModel category) {
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
    loadProducts(subcategory);
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

// jhdgjsfhjhdfjkgjdkfgkjh
  void setProduct(ProductCategoryModel product) {
    productId = product.id!;
    selectedProduct = product;
    selectProductCommission.text =
        product.commissionPercentage + "%  Admin commission";
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
    _isImageLoading = false;

    productDescriptionController.clear();
    productUnitController.clear();
    productPriceController.clear();
    productProductDiscountPriceController.clear();
    productStockController.clear();
    productNameController.clear();
    productquantityController.clear();
    productqlongDescriptionController.clear();
    _isImageLoading = false;

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

  List<DatumTags> tagsList = [];
  List<DatumTags> selectedTags = [];

  Future<void> productTags() async {
    try {
      // Clear existing data before fetching new data
      clearData();

      isLoading = true;
      notifyListeners();

      final result = await _authRepo.productTags({});

      result.fold(
        (error) {
          isLoading = false;
          notifyListeners();
          print("Error fetching product tags: $error"); // Debugging
        },
        (categoryList) {
          if (categoryList.data != null) {
            tagsList = categoryList.data!;
          } else {
            tagsList = []; // Ensure no null assignment
          }
          isLoading = false;
          notifyListeners();
        },
      );
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print("Exception in productTags: $e"); // Catch unexpected errors
    }
  }

  void toggleTag(DatumTags tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
    notifyListeners();
  }

  List<File> _selectedImages = [];

  List<File> get selectedImages => _selectedImages;

  Future<void> pickImages(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      _selectedImages = pickedFiles.map((e) => File(e.path)).toList();

      uploadImages(context);
      notifyListeners(); // Notify UI of changes
    }
  }

  void clearImages() {
    _selectedImages.clear();
    notifyListeners();
  }

  clearfielsd() {
    selectedImages.clear();
    _uploadedUrls.clear();
    selectedTags.clear();
    selectedTags.clear();
    highlights.clear();
    notifyListeners();
  }

  List<String> uploadedUrl = [];

  List<String> tafIds = [];

  //
  Future<bool> createProduct(BuildContext context) async {
    context.showLoader(show: true);

    for (var item in _uploadedUrls) {
      uploadedUrl.add(item.url!);
    }

    for (var item in selectedTags) {
      tafIds.add(item.id!);
    }

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
        "name": productNameController.text,
        "additionalInfo": productqlongDescriptionController.text,
        "productImages": uploadedUrl,
        "productHighlights": getHighlights(),
        "productTagIds": tafIds
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
          clearfielsd();
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
          content: Text("$e"),
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
              backgroundColor: Colors.green,
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

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$e"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  Future<bool> updateProduct(BuildContext context, String id) async {
    context.showLoader(show: true);

    for (var item in _uploadedUrls) {
      uploadedUrl.add(item.url!);
    }
    print("check stock ${productUnitController.text}");
    var data;
    try {
      if (uploadedUrl.isNotEmpty) {
        data = {
          "quantity": productquantityController.text,
          "description": productDescriptionController.text,
          "unit": productUnitController.text,
          "basePrice": productPriceController.text,
          "discountPrice": productProductDiscountPriceController.text,
          "isInStock": inStock,
          "stock": int.parse(productStockController.text.isEmpty
              ? '0'
              : productStockController.text),
          "name": productNameController!.text,
          "productImages": uploadedUrl,
          "additionalInfo": productqlongDescriptionController.text,
        };
      } else {
        data = {
          "quantity": productquantityController.text,
          "description": productDescriptionController.text,
          "unit": productUnitController.text,
          "basePrice": productPriceController.text,
          "discountPrice": productProductDiscountPriceController.text,
          "isInStock": inStock,
          "stock": int.parse(productStockController.text.isEmpty
              ? '0'
              : productStockController.text),
          "name": productNameController!.text,
          "additionalInfo": productqlongDescriptionController.text,
        };
      }

      print("check stock ${data}");

      var result = await _authRepo.updateProduct(data, id);

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
          _uploadedUrls.clear();
          uploadedUrl.clear();
          _showSnackBar(context, "Product Updated successful!", Colors.green);

          return true;
        },
      );
    } catch (e) {
      context.showLoader(show: false);
      print("Unexpected error: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$e"),
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

  bool _isImageLoading = false;
  bool get isImageLoading => _isImageLoading;

  void _showSnackBar(BuildContext context, String message, Color color) {
    showTopSnackBar(context, message, color);
  }

  List<ImageDatum> _uploadedUrls = []; // Store uploaded URLs

  Future<bool> uploadImages(
    BuildContext context,
  ) async {
    if (selectedImages.isEmpty) {
      _showSnackBar(context, "Please select images first!", Colors.red);
      return false;
    }

    context.showLoader(show: true);
    final result = await _authRepo.uploadImages(selectedImages);
    context.showLoader(show: false);

    return result.fold(
      (error) {
        _showSnackBar(context, "Failed to upload images!", Colors.red);
        return false;
      },
      (uploadImage) {
        _isImageLoading = true;
        _uploadedUrls = uploadImage.data!;

        notifyListeners();

        _showSnackBar(context, "Images uploaded successfully!", Colors.green);
        return true;
      },
    );
  }

  // List<Map<String, String>> _highlights = [];

  // List<Map<String, String>> get highlights => _highlights;

  // void addHighlight() {
  //   _highlights.add({"key": "", "value": ""});
  //   notifyListeners();
  // }

  // void removeHighlight(int index) {
  //   if (_highlights.isNotEmpty) {
  //     _highlights.removeAt(index);
  //     notifyListeners();
  //   }
  // }

  // void updateHighlight(int index, String key, String value) {
  //   _highlights[index] = {"key": key, "value": value};
  //   notifyListeners();
  // }

  List<Map<String, String>> highlights = [];
  List<TextEditingController> keyControllers = [];
  List<TextEditingController> valueControllers = [];

  void addHighlight() {
    highlights.add({"key": "", "value": ""});
    keyControllers.add(TextEditingController());
    valueControllers.add(TextEditingController());
    notifyListeners();
  }

  void removeHighlight(int index) {
    highlights.removeAt(index);
    keyControllers[index].dispose();
    valueControllers[index].dispose();
    keyControllers.removeAt(index);
    valueControllers.removeAt(index);
    notifyListeners();
  }

  void updateHighlight(int index, String key, String value) {
    highlights[index] = {"key": key, "value": value};
    notifyListeners();
  }

  List<Map<String, String>> getHighlights() {
    return highlights;
  }
}
