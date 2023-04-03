// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  bool favorite;
  String imagePath;
  String title;
  double price;
  String description;

  ProductModel({
    required this.favorite,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description,
  });
}
