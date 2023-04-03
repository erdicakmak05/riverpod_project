// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import '../model/product_model.dart';
import '../riverpod/product_riverpod.dart';

class ProductItemWidget extends StatelessWidget {
  ProductModel model;
  Function setFavorite;
  Function addBasket;
  ProductItemWidget(
      {required this.model,
      required this.setFavorite,
      required this.addBasket});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: 10.allBR),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: 10.allBR,
                child: Container(
                    height: 150, child: Image.network(model.imagePath)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        model.description,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        model.price.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GrockContainer(
                        onTap: () {
                          addBasket();
                        },
                        padding: 3.allP,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(CupertinoIcons.bag_badge_plus,
                                color: Colors.black),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Ekle",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 12,
          left: 8,
          child: GrockContainer(
            onTap: () {
              setFavorite();
            },
            padding: 3.allP,
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                  ),
                ]),
            child: Icon(
              model.favorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              color: model.favorite ? Colors.red : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
