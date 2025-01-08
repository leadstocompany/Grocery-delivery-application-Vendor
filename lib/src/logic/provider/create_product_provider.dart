import 'package:flutter/material.dart';
import 'package:vendor_app/src/core/network_services/service_locator.dart';
import 'package:vendor_app/src/data/prdouct_model.dart';
import 'package:vendor_app/src/logic/repo/product_repo.dart';
import 'package:vendor_app/src/logic/services/product_locator.dart';

class ProductProvider extends ChangeNotifier {
  String selectedCategory = '';
  String selectedSubcategory = '';
  String selectedProduct = '';
  int productQuantity = 1;
  String productDescription = '';
  String productUnit = '';
  double productPrice = 0.0;
  double discountPrice = 0.0;
  bool inStock = true;

  String selectedproducctQuentity = '';

  // Static Data
  List<String> categories = ['Electronics', 'Clothing', 'Groceries'];
  Map<String, List<String>> subcategories = {
    'Electronics': ['Mobiles', 'Laptops'],
    'Clothing': ['Men', 'Women'],
    'Groceries': ['Fruits', 'Vegetables'],
  };

  Map<String, List<String>> products = {
    'Mobiles': ['iPhone', 'Samsung', 'OnePlus'],
    'Laptops': ['Dell', 'HP', 'MacBook'],
    'Men': ['Shirts', 'Trousers'],
    'Women': ['Dresses', 'Tops'],
    'Fruits': ['Apple', 'Banana'],
    'Vegetables': ['Tomato', 'Potato'],
  };

  void setCategory(String value) {
    selectedCategory = value;
    selectedSubcategory = '';
    selectedProduct = '';
    notifyListeners();
  }

  void setProductQuentity(String value) {
    selectedproducctQuentity = value;
    notifyListeners();
  }

  void setSubcategory(String value) {
    selectedSubcategory = value;
    selectedProduct = '';
    notifyListeners();
  }

  void setProduct(String value) {
    selectedProduct = value;
    notifyListeners();
  }

  void setQuantity(int value) {
    productQuantity = value;
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

  void submitProduct() {
    // Add your submit logic here
    print('Product Submitted');
  }

///////////////////////////////////////////////////////////////////  create product //////////////////////
  final _authRepo = getIt<ProductRepo>();

  bool isLoading = false;
  List<Poduct> products1 = [];

  Future<void> getProduct() async {
    isLoading = true;
    notifyListeners();

    final result = await _authRepo.getProduct({});
    result.fold(
      (error) {
        // Handle error
        isLoading = false;
        notifyListeners();
      },
      (productList) {
        products1 = productList.product!;
        isLoading = false;
        notifyListeners();
      },
    );
  }



  
}
