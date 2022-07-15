import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../const/productProvider.dart';
import '../minor_screens/product_details.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key, required this.selectedCategory}) : super(key: key);
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.68,
            child: GridView.count(
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              crossAxisCount: 2,
              children: List.generate(
                  productProvider.getProductListByCategory(selectedCategory).length,
                      (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetails(
                                productId: productProvider.getProductListByCategory(selectedCategory)[index].id,
                              )
                      ),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: size.width / 2.5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 160,
                          width: 160,
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              productProvider.getProductListByCategory(selectedCategory)[index].productPhotos[0],
                            ),
                          ),
                        ),
                        Text(productProvider.getProductListByCategory(selectedCategory)[index].productName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),),
                        Text('THB'+productProvider.getProductListByCategory(selectedCategory)[index].productPrice.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
