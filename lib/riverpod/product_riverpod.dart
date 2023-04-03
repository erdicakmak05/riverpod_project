import 'package:flutter/material.dart';
import '../model/product_model.dart';
import 'package:grock/grock.dart';

class ProductRiverpod extends ChangeNotifier {
  List<ProductModel> product = [];
  List<ProductModel> favorites = [];
  List<ProductModel> basket = [];
  double totalPrice = 0;

  void setTotalPrice(ProductModel model) {
    totalPrice += model.price;
  }

  void addBasket(ProductModel model) {
    basket.add(model);
    setTotalPrice(model);

    // Grock.snackBar(
    //   title: "Başarılı",
    //   description: "${model.title} başarıyla sepete eklendi",
    //   leading: const Icon(Icons.check),
    //   blur: 20,
    //   opacity: 0.2,
    //   curve: Curves.elasticInOut,
    // );

    notifyListeners();
  }

  void setFavorite(ProductModel model) {
    if (model.favorite) {
      model.favorite = false;
      favorites.remove(model);
      notifyListeners();
    } else {
      model.favorite = true;
      favorites.add(model);
      notifyListeners();
    }
  }

  void init() {
    for (int i = 0; i < 15; i++) {
      product.add(ProductModel(
          favorite: false,
          imagePath: i.randomImage(),
          title: "Iphone ${i + 1}",
          price: 1000.0,
          description: "64 GB RAM, 128 MP CAMERA"));
    }
  }
}
