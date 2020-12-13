import 'package:flutter/foundation.dart' as foundation;

import 'product.dart';
import 'products_repository.dart';

double _salesTaxRate = 0.06;
double _shippingCostPerItem = 7;

class AppStateModel extends foundation.ChangeNotifier {
  List<Product> _availableProducts;
  Category _selectedCategory = Category.all;
  final _productsInCart = <int, int>{};

  Map<int, int> get productInCart {
    return Map.from(_productsInCart);
  }

  int get totalCartQuantity {
    return _productsInCart.values
        .fold(0, (accumulator, value) => accumulator + value);
  }

  Category get selectedCategory {
    return _selectedCategory;
  }

  double get subtotalCost {
    return _productsInCart.keys.map((id) {
      return getProductById(id).price * _productsInCart[id];
    }).fold(0, (previousValue, element) => previousValue + element);
  }

  double get shippingCost {
    return _shippingCostPerItem *
        _productsInCart.values
            .fold(0.0, (previousValue, element) => previousValue + element);
  }

  double get tax {
    return subtotalCost * _salesTaxRate;
  }

  double get totalCost {
    return subtotalCost + shippingCost + tax;
  }

  List<Product> getProducts() {
    if (_availableProducts == null) {
      return [];
    }
    if (_selectedCategory == Category.all) {
      return List.from(_availableProducts);
    } else {
      return _availableProducts.where((p) {
        return p.category == _selectedCategory;
      }).toList();
    }
  }

  List<Product> search(String searchTerms) {
    return getProducts().where((product) {
      return product.name.toLowerCase().contains(searchTerms.toLowerCase());
    }).toList();
  }

  void addProductToCart(int productId) {
    if (!_productsInCart.containsKey(productId)) {
      _productsInCart[productId] = 1;
    } else {
      _productsInCart[productId]++;
    }
  }

  void removeItemFromCart(int productId) {
    if (_productsInCart.containsKey(productId)) {
      if (_productsInCart[productId] == 1) {
        _productsInCart.remove(productId);
      } else {
        _productsInCart[productId]--;
      }
    }
    notifyListeners();
  }

  Product getProductById(int id) {
    return _availableProducts.firstWhere((p) => p.id == id);
  }

  void clearCart() {
    _productsInCart.clear();
  }

  void loadProducts() {
    _availableProducts = ProductsRepository.loadProducts(Category.all);
  }

  void setCategory(Category newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }
}
