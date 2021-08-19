import 'package:cupertino_store_flutter/model/product.dart';
import 'package:flutter/foundation.dart' as foundation;

import '../model/product.dart' as model;
import '../repository/products_repository.dart' as repository;

double _salesTaxRate = 0.06;
double _shippingCostPerItem = 7.0;

class AppStateModel extends foundation.ChangeNotifier {
  // All the available products.
  List<model.Product> _availableProducts = [];

  // The currently selected category of products.
  model.Category _selectedCategory = model.Category.all;

  // The IDs and quantities of products currently in the cart.
  final _productsInCart = <int, int>{};

  Map<int, int> get productsInCart => Map.from(_productsInCart);

  // Toal number of items in the cart.
  int get totalCartQuantity => _productsInCart.values
      .fold(0, (previousValue, element) => previousValue + element);

  model.Category get selectedCategory => _selectedCategory;

  // Totaled prices of the items in the cart.
  double get subtotalCost {
    return _productsInCart.keys
        .map(
          (id) => getProductById(id).price * _productsInCart[id]!,
        )
        .fold(
          0,
          (previousValue, element) => previousValue + element,
        );
  }

  // Total shipping cost for the items in the cart.
  double get shippingCost {
    return _shippingCostPerItem *
        _productsInCart.values.fold(
          0.0,
          (previousValue, element) => previousValue + element,
        );
  }

  // Sales tax for the items in the cart
  double get tax => subtotalCost * _salesTaxRate;

  // Total cost to order everything in the cart.
  double get totalCost => subtotalCost + shippingCost + tax;

  // Returns a copy of the list of available products, filtered by category.
  List<Product> getProducts() {
    if (_selectedCategory == model.Category.all) {
      return List.from(_availableProducts);
    }

    return _availableProducts
        .where((p) => p.category == _selectedCategory)
        .toList();
  }

  // Search the product catalog.
  List<model.Product> search(String searchTerms) {
    return getProducts()
        .where(
          (p) => p.name.toLowerCase().contains(searchTerms.toLowerCase()),
        )
        .toList();
  }

  // Adds a product to the cart.
  void addProductToCart(int productId) {
    if (!_productsInCart.containsKey(productId)) {
      _productsInCart[productId] = 1;
    } else {
      _productsInCart[productId] = _productsInCart[productId]! + 1;
    }

    notifyListeners();
  }

  // Removes an item from the cart.
  void removeItemFromCart(int productId) {
    if (_productsInCart.containsKey(productId)) {
      if (_productsInCart[productId] == 1) {
        _productsInCart.remove(productId);
      } else {
        _productsInCart[productId] = _productsInCart[productId]! - 1;
      }
    }

    notifyListeners();
  }

  // Returns the product instance matching the provided id.
  model.Product getProductById(int id) {
    return _availableProducts.firstWhere((p) => p.id == id);
  }

  // Removes everything from the cart.
  void clearCart() {
    _productsInCart.clear();
    notifyListeners();
  }

  // Loads the list of available products from the repo.
  void loadProducts() {
    _availableProducts =
        repository.ProductsRepository.loadProducts(model.Category.all);
    notifyListeners();
  }

  void setCategory(model.Category newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }
}
