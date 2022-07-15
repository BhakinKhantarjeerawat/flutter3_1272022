import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../const/productProvider.dart';
import '../models/product_model.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> filteredProductList = productProvider.getProductInCart;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        backgroundColor: Colors.white,
        title: Row(children: [
          // Text(
          //   'Total: \$',
          //   style: TextStyle(fontSize: 18),
          // ),
          Text(
              'Total: ' + productProvider.getTotalPriceInCart().toString(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ],)
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
                            image: AssetImage(filteredProductList[index].productPhotos[0]),
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
                                          filteredProductList[index].productName,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey),
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
                                              Text(
                                                productProvider.getOrderedNumber(filteredProductList[index].id).toString(),
                                                style: TextStyle(fontSize: 20),
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
            })),
      ),
      // ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'type the delivery address here',
          ),
        )
      ),
    );
  }
}

