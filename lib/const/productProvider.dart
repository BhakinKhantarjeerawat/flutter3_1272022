import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {

  clearCart() {
    _productsInCart.clear();
  }

  removeProductFromCart({required productId}) {
    if (_productsInCart.where((element) => element.id == productId).isNotEmpty) {
      _productsInCart.removeWhere((element) => element.id == productId);
    } else {
      print('ATTENTION: productId which is not existed in _productsInCart has been asked to be removed. This is wrong');
      return null;
    }
  }

  appendProductToCart({required productId}) {
    if (_productsInCart.where((element) => element.id == productId).isEmpty) {
      ProductModel result = _productList
          .where((element) => element.id == productId)
          .single;
      _productsInCart.add(result);
    } else {
      print('ATTENTION: The same productId has been asked to append to _productsInCart');
      return null;
    }
  }

  List<ProductModel> getProductListByCategory(category) {
    final result = _productList.where((element) => element.productCategory == category).toList();
    return result;
  }

  // int getProductListNumberByCategory(category) {
  //   final result = _productList.where((element) => element.productCategory == category);
  //   return result;
  // }

  List<ProductModel> get getProductInCart {
    return _productsInCart;
  }

  ProductModel getSingleProductById(id) {
    final result = _productList.where((element) => element.id == id ).first;
    return result;
  }

  increaseOrderedNumber(id) {
    if (_productList.where((element) => element.id == id ).first.orderedNumber <
        _productList.where((element) => element.id == id ).first.productInTotal
    ) {
      _productList.where((element) => element.id == id ).first.orderedNumber ++;
    } else {
      return null;
    }
  }

  reduceOrderedNumber(id) {
    if (_productList.where((element) => element.id == id ).first.orderedNumber <= 1) {
      print('ATTENTION: There is a request to remove the product even if the total numbe is already equaly or less than 1');
     return null;
    } else {
      _productList
          .where((element) => element.id == id)
          .first
          .orderedNumber --;
    }
  }

  deleteSingleProductInCart(id) {
    _productsInCart.remove(_productList.where((element) => element.id == id ).first);
  }

  getOrderedNumber(id) {
    return _productList.where((element) => element.id == id ).first.orderedNumber;
  }

  int getTotalPriceInCart() {
    int totalPrice = 0;
    for(ProductModel i in _productsInCart) {
      totalPrice += i.productPrice * i.orderedNumber;
    }
    return totalPrice;
}

  bool checkIfProductAlreadyInCart(productId) {
    if (_productsInCart.where((element) => element.id == productId).isNotEmpty)
    {
      return true;
  } else {
      // print('Error: checkIfProductAlreadyInCart');
      return false;
    }
  }

  static List<ProductModel> _productsInCart = [];

  static List<ProductModel>  _productList = [
    ProductModel(
      id: 1,
      productCategory: 'men',
      productName: 'Male Shirt',
      productDescription: 'light and comfort',
      productPrice: 100,
      productInTotal: 10,
      productPhotos: [
        'images/men/men0.jpg',
        'images/men/men1.jpg'
      ]
    ),
    ProductModel(
      id: 2,
      productCategory: 'men',
      productName: 'Riding Jacket',
      productDescription: 'comfort and cool',
      productPrice: 200,
      productInTotal: 20,
        productPhotos: [
          'images/men/men2.jpg',
          'images/men/men3.jpg'
        ]
    ),
    ProductModel(
      id: 3,
      productCategory: 'men',
      productName: 'Winter Jacket',
      productDescription: 'warm and easy to watch',
      productPrice: 300,
      productInTotal: 30,
        productPhotos: [
          'images/men/men4.jpg',
          'images/men/men5.jpg'
        ]
    ),
    ProductModel(
      id: 4,
      productCategory: 'women',
      productName: 'Night Skirt',
      productDescription: 'elegant',
      productPrice: 400,
      productInTotal: 40,
        productPhotos: [
          'images/women/women0.jpg',
          'images/women/women1.jpg'
        ]
    ),
    ProductModel(
      id: 5,
      productCategory: 'women',
      productName: 'Night Dress',
      productDescription: 'fashionable',
      productPrice: 500,
      productInTotal: 50,
        productPhotos: [
          'images/women/women3.jpg',
          'images/women/women4.jpg'
        ]
    ),
    ProductModel(
        id: 6,
        productCategory: 'men',
        productName: 'Male Storage',
        productDescription: 'Handsome',
        productPrice: 600,
        productInTotal: 60,
        productPhotos: [
          'images/bags/bags0.jpg',
          'images/bags/bags1.jpg'
        ]
    ),
    ProductModel(
        id: 7,
        productCategory: 'men',
        productName: 'Male Bags',
        productDescription: 'Portable',
        productPrice: 700,
        productInTotal: 70,
        productPhotos: [
          'images/bags/bags2.jpg',
          'images/bags/bags3.jpg'
        ]
    ),
  ];

}
