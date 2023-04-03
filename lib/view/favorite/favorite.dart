import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

import '../../companends/product_widget_item.dart';
import '../../riverpod/riverpod_managment.dart';

class Favoriler extends ConsumerWidget {
  const Favoriler({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favorite = ref.watch(productRiverpod);
    var product = ref.watch(productRiverpod);

    return Scaffold(
      body: product.favorites.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Henüz Favori Ürününüz Bulunmuyor"),
                  OutlinedButton(
                      onPressed: () {
                        ref.watch(bottomNavBarRiverpod).setCurrentIndex(0);
                      },
                      child: Text("Ürünlere Git"))
                ],
              ),
            )
          : Padding(
              padding: [20, 15].horizontalAndVerticalP,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Favoriler",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 16),
                  ),
                  Expanded(
                    child: GrockList(
                        shrinkWrap: true,
                        scrollEffect: const ScrollPhysics(),
                        padding: [0, 10].horizontalAndVerticalP,
                        itemCount: favorite.favorites.length,
                        itemBuilder: (context, index) {
                          return ProductItemWidget(
                            model: favorite.favorites[index],
                            addBasket: () {
                              favorite.addBasket(product.favorites[index]);
                            },
                            setFavorite: () {
                              product.setFavorite(product.favorites[index]);
                            },
                          );
                        }),
                  )
                ],
              ),
            ),
    );
  }
}
