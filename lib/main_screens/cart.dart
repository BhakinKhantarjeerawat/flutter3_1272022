import 'package:flutter/material.dart';
import 'package:flutter3_1272022/const/productProvider.dart';
import 'package:flutter3_1272022/main_screens/order_summary.dart';
import 'package:flutter3_1272022/widgets/global_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> filteredProductList = productProvider.getProductInCart;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: const Text("Cart Screen"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                productProvider.clearCart();
              });
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: productProvider.getProductInCart.isEmpty
            ? Text(
                'No Product Added Yet!',
                style: TextStyle(fontSize: 34, color: Colors.grey),
              )
            : ListView.builder(
                itemCount: filteredProductList.length,
                itemBuilder: ((context, index) {
                  return Card(
                      child: SizedBox(
                    height: 120,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: Image(
                            image: AssetImage(
                                filteredProductList[index].productPhotos[0]),
                          ),
                        ),
                        Flexible(
                            child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          filteredProductList[index]
                                              .productName,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey),
                                        ),
                                        Spacer(),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              productProvider
                                                  .deleteSingleProductInCart(
                                                      filteredProductList[index]
                                                          .id);
                                            });
                                          },
                                          child: Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Baht' +
                                              filteredProductList[index]
                                                  .productPrice
                                                  .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.red),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    productProvider
                                                        .reduceOrderedNumber(
                                                            filteredProductList[
                                                                    index]
                                                                .id);
                                                  });
                                                },
                                                child: Icon(
                                                  FontAwesomeIcons.minus,
                                                ),
                                              ),
                                              Text(
                                                productProvider
                                                    .getOrderedNumber(
                                                        filteredProductList[
                                                                index]
                                                            .id)
                                                    .toString(),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    productProvider
                                                        .increaseOrderedNumber(
                                                            filteredProductList[
                                                                    index]
                                                                .id);
                                                  });
                                                },
                                                child:
                                                    Icon(FontAwesomeIcons.plus),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )))
                      ],
                    ),
                  ));
                  //   ListTile(leading: Text(
                  //     // testList[index]
                  //     filteredProductList[index].productName
                  // ),);
                })),
        // Text("Your cart is empty",style: TextStyle(fontSize: 30),),
        // const SizedBox(height: 50),
        //   Material(
        //     color: Colors.blue,
        //     borderRadius: BorderRadius.circular(25),
        //     child: MaterialButton(
        //       onPressed: () {
        //         Navigator.pushReplacement(context,
        //             MaterialPageRoute(builder: (context) => const CustomerHomeScreen()));
        //       },
        //       child: const Text("Continue Shopping",
        //         style: TextStyle(fontSize: 30),),),
        //   ),
        // ],
      ),
      // ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Text(
              'Total: \$',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              productProvider.getTotalPriceInCart().toString(),
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const Spacer(),
            Container(
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(25)),
                child: MaterialButton(
                  onPressed: () {
                    if (productProvider.getProductInCart.isEmpty){
                      GlobalWidgets.showToast(color: Colors.deepOrange, msg: "No product added yet");
                    } else {
                      GlobalWidgets.showErrorDialog(
                        context: context,
                      );
                    }
                  },
                  child: Text('Check Out'),
                ))
          ],
        ),
      ),
    );
  }
}

