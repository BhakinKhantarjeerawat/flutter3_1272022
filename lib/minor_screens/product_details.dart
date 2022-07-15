import 'package:flutter/material.dart';
import 'package:flutter3_1272022/main_screens/cart.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:provider/provider.dart';
import '../const/productProvider.dart';
import '../models/product_model.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    Key? key,
    required this.productId,
  }) : super(key: key);
  final int productId;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    // print(ProductList().getProductList(productId: 2).productName);
    ProductModel selectedProduct = ProductProvider().getSingleProductById(widget.productId);
    return Scaffold(
      // appBar: AppBar(
      //     // backgroundColor: Colors.white,
      //     ),
      body: CustomScrollView(
        slivers: [SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  child: Swiper(
                    pagination:
                        const SwiperPagination(builder: SwiperPagination.fraction),
                    itemCount: selectedProduct.productPhotos.length,
                    itemBuilder: (context, index) {
                      return Image(
                        image: AssetImage(
                            selectedProduct.productPhotos[index]
                        ),
                      );
                    },
                  ),
                ),
                Center(
                    child: Text(
                  selectedProduct.productName,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '\$',
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          selectedProduct.productPrice.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.red),
                        )
                      ],
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    selectedProduct.productInTotal.toString() +
                        ' items ara available in stock',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )
                ]),
                const Center(
                    child: Text(
                  "- Description -",
                  style: TextStyle(fontSize: 30, color: Colors.orange),
                )),
                Text(
                  selectedProduct.productDescription,
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  child:
                  productProvider.checkIfProductAlreadyInCart(selectedProduct.id)
                      !?
                  ElevatedButton(
                      onPressed: null,
                      child: Text('This Product is already in Cart'))
                  :
                  ElevatedButton(
                      onPressed: () {
                        productProvider.appendProductToCart(productId: selectedProduct.id);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                      },
                      child: const Text(
                        'Add To Cart',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ],
            ),
          ),
        ),
    ]
      ),
    );
  }
}
