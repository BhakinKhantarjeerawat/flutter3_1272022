import 'package:flutter/material.dart';
import 'package:flutter3_1272022/const/productProvider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductProvider extends Mock implements ProductProvider {}

void main() {
  MockProductProvider mockProductProvider;

  setUp(() {
    mockProductProvider = MockProductProvider();
  });

  group('ProductProviderClass', () {
    ProductProvider productProvider = ProductProvider();

    test('clearCart', () {
      productProvider.clearCart();
      expect(productProvider.getProductInCart, isEmpty);
    });

    testWidgets('finds a Text widget', (tester) async {
      // Build an App with a Text widget that displays the letter 'H'.
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Text('Check Out'),
        ),
      ));
      expect(find.text('Check Out'), findsOneWidget);
    });

    test('appendSingleProductToCart', () {
      productProvider.appendProductToCart(productId: 3);
      expect(productProvider.getProductInCart.length, 1);
      // Line Below, test preventing adding product with the same id to cart, the test result is "not passed"
      // because the method prevent adding the same productId (productId 3 is added two times in this test
      productProvider.appendProductToCart(productId: 3);
      expect(productProvider.getProductInCart.length, 2);
    });

    // continued from the test above, by changing the productId in the second-time appending,
    // the test is passed.
    test('appendSingleProductToCart', () {
      productProvider.appendProductToCart(productId: 3);
      expect(productProvider.getProductInCart.length, 1);
      productProvider.appendProductToCart(productId: 4);
      expect(productProvider.getProductInCart.length, 2);
    });

    // removing productId which is already existed runs properly, and the test has passed.
    test('testReduceProductInCartWithExistingProductId', () {
      productProvider.appendProductToCart(productId: 3);
      expect(productProvider.getProductInCart.length, 1);
      productProvider.removeProductFromCart(productId: 3);
      expect(productProvider.getProductInCart.length, 0);
    });

    // Test below is not passed as intended because removing productId which is not existed
    // should be prevented.
    test('testReduceProductInCartWithoutExistingProductId', () {
      productProvider.appendProductToCart(productId: 3);
      expect(productProvider.getProductInCart.length, 1);
      productProvider.removeProductFromCart(productId: 2);
      expect(productProvider.getProductInCart.length, 0);
    });

    test('getProductListByCategory', () {
      // productProvider.getProductListByCategory('men');
      expect(productProvider.getProductListByCategory('men')
          , isEmpty);
    });

    test('increaseOrderedNumber', () {
      expect(productProvider.increaseOrderedNumber(0)
          , 2);
    });

    test('getOrderedNumber', () {
      expect(productProvider.getOrderedNumber(0), 1);
    });

  });


}
