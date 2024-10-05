import 'package:flutter/material.dart';

class PageNotifier extends ChangeNotifier {
  int _currentIndex = 0;
  final int _totalPages = 4; // Set total number of pages
  final PageController _pageController = PageController();

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;

  // Calculate progress as a percentage
  double get progress => (_currentIndex + 1) / _totalPages;

  void goToNextPage() {
    // Ensure that the current index is updated correctly
    if (_currentIndex < _totalPages - 1) {
      _currentIndex++; // Increment the index here
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      notifyListeners(); // Notify listeners to update the view
    }
  }

  // Method to navigate to a specific page
  // void goToPage(int index) {
  //   if (index < _totalPages && index >= 0) {
  //     _currentIndex = index;
  //     _pageController.jumpToPage(_currentIndex); // Instantly move to page
  //     notifyListeners();
  //   }
  // }

  // New method: Navigate to a specific page
  // Navigate to a specific page
  void goToPage(int index) {
    if (index >= 0 && index < _totalPages) {
      _currentIndex = index;
      print("Navigating to page: $_currentIndex"); // Debug print
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
