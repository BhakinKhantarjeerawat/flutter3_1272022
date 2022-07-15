class ProductModel {
  ProductModel(
      {required this.id,
      required this.productCategory,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productInTotal,
      required this.productPhotos,
      this.orderedNumber = 1,
      });
  final int id;
  final String productCategory;
  final String productName;
  final String productDescription;
  final int productPrice;
  final int productInTotal;
  final List<String> productPhotos;
  late int orderedNumber;
}
