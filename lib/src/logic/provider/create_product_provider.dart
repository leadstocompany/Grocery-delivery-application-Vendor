import 'package:flutter/material.dart';

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
}
