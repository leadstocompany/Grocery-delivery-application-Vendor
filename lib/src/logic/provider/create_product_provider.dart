// import 'package:flutter/material.dart';
// import 'package:vendor_app/src/core/network_services/service_locator.dart';
// import 'package:vendor_app/src/data/prdouct_model.dart';
// import 'package:vendor_app/src/logic/repo/product_repo.dart';
// import 'package:vendor_app/src/logic/services/product_locator.dart';

// class ProductProvider extends ChangeNotifier {
//   String selectedCategory = '';
//   String selectedSubcategory = '';
//   String selectedProduct = '';
//   int productQuantity = 1;
//   String productDescription = '';
//   String productUnit = '';
//   double productPrice = 0.0;
//   double discountPrice = 0.0;
//   bool inStock = true;

//   String selectedproducctQuentity = '';

//   // Static Data
//   List<String> categories = ['Electronics', 'Clothing', 'Groceries'];
//   Map<String, List<String>> subcategories = {
//     'Electronics': ['Mobiles', 'Laptops'],
//     'Clothing': ['Men', 'Women'],
//     'Groceries': ['Fruits', 'Vegetables'],
//   };

//   Map<String, List<String>> products = {
//     'Mobiles': ['iPhone', 'Samsung', 'OnePlus'],
//     'Laptops': ['Dell', 'HP', 'MacBook'],
//     'Men': ['Shirts', 'Trousers'],
//     'Women': ['Dresses', 'Tops'],
//     'Fruits': ['Apple', 'Banana'],
//     'Vegetables': ['Tomato', 'Potato'],
//   };

//   void setCategory(String value) {
//     selectedCategory = value;
//     selectedSubcategory = '';
//     selectedProduct = '';
//     notifyListeners();
//   }

//   void setProductQuentity(String value) {
//     selectedproducctQuentity = value;
//     notifyListeners();
//   }

//   void setSubcategory(String value) {
//     selectedSubcategory = value;
//     selectedProduct = '';
//     notifyListeners();
//   }

//   void setProduct(String value) {
//     selectedProduct = value;
//     notifyListeners();
//   }

//   void setQuantity(int value) {
//     productQuantity = value;
//     notifyListeners();
//   }

//   void setDescription(String value) {
//     productDescription = value;
//     notifyListeners();
//   }

//   void setUnit(String value) {
//     productUnit = value;
//     notifyListeners();
//   }

//   void setPrice(double value) {
//     productPrice = value;
//     notifyListeners();
//   }

//   void setDiscountPrice(double value) {
//     discountPrice = value;
//     notifyListeners();
//   }

//   void toggleStock(bool value) {
//     inStock = value;
//     notifyListeners();
//   }

//   void submitProduct() {
//     // Add your submit logic here
//     print('Product Submitted');
//   }

// ///////////////////////////////////////////////////////////////////  create product //////////////////////
//   final _authRepo = getIt<ProductRepo>();

//   bool isLoading = false;
//   List<Poduct> products1 = [];

//   Future<void> getProduct() async {
//     isLoading = true;
//     notifyListeners();

//     final result = await _authRepo.getProduct({});
//     result.fold(
//       (error) {
//         // Handle error
//         isLoading = false;
//         notifyListeners();
//       },
//       (productList) {
//         products1 = productList.product!;
//         isLoading = false;
//         notifyListeners();
//       },
//     );
//   }

//    Future<void> getCategoryByLevel() async {
//     isLoading = true;
//     notifyListeners();

//     final result = await _authRepo.getCategoryByLevel({});
//     result.fold(
//       (error) {
//         // Handle error
//         isLoading = false;
//         notifyListeners();
//       },
//       (categorylist)
//        {

//         isLoading = false;
//         notifyListeners();
//       },
//     );
//   }

// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/data/ProductCategoryModel.dart';
import 'package:vendor_app/src/data/prdouct_model.dart';
import 'package:vendor_app/src/logic/repo/product_repo.dart';

// class ProductProvider extends ChangeNotifier {
//   String selectedCategory = '';
//   String selectedSubcategory = '';
//   String selectedProduct = '';
//   int productQuantity = 1;
//   String productDescription = '';
//   String productUnit = '';
//   double productPrice = 0.0;
//   double discountPrice = 0.0;
//   bool inStock = true;

//   String selectedProductQuantity = '';

//   bool isLoading = false;

//   final _authRepo = getIt<ProductRepo>();

//   // Dynamic Data
//   List<String> categories = [];
//   Map<String, List<String>> subcategories = {};
//    Map<String, List<String>> products = {};

//   // Setter methods to update state
//   void setCategory(String value) {
//     selectedCategory = value;
//     selectedSubcategory = '';
//     notifyListeners();
//   }

//   void setSubcategory(String value) {
//     selectedSubcategory = value;
//     notifyListeners();
//   }

//   void setProduct(String value) {
//     selectedProduct = value;
//     notifyListeners();
//   }

//   void setProductQuantity(String value) {
//     selectedProductQuantity = value;
//     notifyListeners();
//   }

//   void setDescription(String value) {
//     productDescription = value;
//     notifyListeners();
//   }

//   void setUnit(String value) {
//     productUnit = value;
//     notifyListeners();
//   }

//   void setPrice(double value) {
//     productPrice = value;
//     notifyListeners();
//   }

//   void setDiscountPrice(double value) {
//     discountPrice = value;
//     notifyListeners();
//   }

//   void toggleStock(bool value) {
//     inStock = value;
//     notifyListeners();
//   }

//   // Fetch categories from API
//   Future<void> getCategoryByLevel() async {
//     isLoading = true;
//     notifyListeners();

//     final result = await _authRepo.getCategoryByLevel({});
//     result.fold(
//       (error) {
//         isLoading = false;
//         notifyListeners();
//       },
//       (categoryList)
//       {
//        categories = categoryList.map((cat) => cat.name ?? '').toList();

//        subcategories =
//        {
//      for (var cat in categoryList)
//       cat.name ?? 'Unknown Category': // Fallback to 'Unknown Category' if name is null
//       cat.childCategories!.map((sub) => sub.name ?? 'Unknown Subcategory').toList(),  // Fallback to 'Unknown Subcategory'
//      };

//         subcategories =
//        {
//      for (var cat in categoryList)
//       cat.name ?? 'Unknown Category': // Fallback to 'Unknown Category' if name is null
//       cat.childCategories!.map((sub) => sub.name ?? 'Unknown Subcategory').toList(),  // Fallback to 'Unknown Subcategory'
//      };

//         isLoading = false;
//         notifyListeners();
//       },
//     );
//   }
// }

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
//   Map<String, List<String>> subcategories = {};
//   //Map<String, List<String>> products = {};
// Map<String, List<ProductCategoryModel>> products = {};

  // Setter methods to update state
  void setCategory(ProductCategoryModel category) {
    selectedCategory = category;
    selectedSubcategory = null;
    selectedProduct = null;
    products.clear(); // Clear products when category is selected
    loadSubcategories(category); // Load subcategories for the selected category
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

  // void setUnit(String value) {
  //   productUnit = value;
  //   notifyListeners();
  // }

  // void setPrice(double value) {
  //   productPrice = value;
  //   notifyListeners();
  // }

  // void setDiscountPrice(double value) {
  //   discountPrice = value;
  //   notifyListeners();
  // }

  void toggleStock(bool value) {
    inStock = value;
    notifyListeners();
  }

  // Fetch categories from API
  Future<void> getCategoryByLevel() async {
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
  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _selectedImage = File(pickedFile.path);
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
    print("djfkj  ${productStockController.text}");

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
        "productImages": [selectedImage!.path.toString()]
      };
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
}
