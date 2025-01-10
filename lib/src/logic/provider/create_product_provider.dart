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


import 'package:flutter/material.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
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
 TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productUnitController = TextEditingController();
   TextEditingController productPriceController = TextEditingController();

    TextEditingController productProductDiscountPriceController = TextEditingController();
     TextEditingController productStockController = TextEditingController();
      TextEditingController productNameController = TextEditingController();


  String selectedCategory = '';
  String selectedSubcategory = '';
  String selectedProduct = '';
  int productQuantity = 1;
  String productDescription = '';
  String productUnit = '';
  double productPrice = 0.0;
  double discountPrice = 0.0;
  bool inStock = true;

  String selectedProductQuantity = '';

  bool isLoading = false;

  final _authRepo = getIt<ProductRepo>();

  // Dynamic Data
  List<String> categories = [];
  Map<String, List<String>> subcategories = {};
  Map<String, List<String>> products = {};

  // Setter methods to update state
  void setCategory(String value) {
    selectedCategory = value;
    selectedSubcategory = '';
    selectedProduct = '';
    products.clear();  // Clear products when category is selected
    loadSubcategories(value);  // Load subcategories for the selected category
    notifyListeners();
  }

  void setSubcategory(String value) {
    selectedSubcategory = value;
    selectedProduct = '';
    loadProducts(value);  // Load products for the selected subcategory
    notifyListeners();
  }

  void setProduct(String value) {
    selectedProduct = value;
    notifyListeners();
  }

  void setProductQuantity(String value) {
    selectedProductQuantity = value;
    notifyListeners();
  }

  void setDescription(String value) {
    productDescription = value;
    notifyListeners();
  }

  void setUnit(String value) {
    productUnit = value;
    notifyListeners();
  }

  void setPrice(double value) {
    productPrice = value;
    notifyListeners();
  }

  void setDiscountPrice(double value) {
    discountPrice = value;
    notifyListeners();
  }

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
        categories = categoryList.map((cat) => cat.name ?? '').toList();

        // Populate subcategories for each category
        subcategories = {
          for (var cat in categoryList)
            cat.name ?? 'Unknown Category': cat.childCategories!
                .map((sub) => sub.name ?? 'Unknown Subcategory')
                .toList(),
        };

        isLoading = false;
        notifyListeners();
      },
    );
  }

  // Load subcategories for a selected category
  void loadSubcategories(String categoryName) {
    final category = subcategories[categoryName];
    if (category != null) {
      // Update subcategory list based on the selected category
      subcategories[categoryName] = category;
    }
  }

  // Load products for a selected subcategory
  void loadProducts(String subcategoryName) {
    // Assuming you have a similar structure to fetch products based on subcategory
    final category = subcategories[selectedCategory] ?? [];
    final subcategory = category.firstWhere(
      (sub) => sub == subcategoryName,
      orElse: () => 'Unknown Product',
    );

    // Simulate product loading based on subcategory
    if (subcategory != 'Unknown Product') {
      products = {
        subcategory: ['iPhone', 'Samsung', 'OnePlus'],  // Example product list
      };
    } else {
      products.clear();
    }
    notifyListeners();
  }
}



