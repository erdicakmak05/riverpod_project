import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

import '../../companends/product_widget_item.dart';
import '../../riverpod/riverpod_managment.dart';

class Sepet extends ConsumerWidget {
  const Sepet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var basket = ref.watch(productRiverpod);

    return Scaffold(
      body: basket.basket.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Henüz Sepette Ürününüz Bulunmuyor"),
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
                    "Sepetteki Ürünler",
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
                        itemCount: basket.basket.length,
                        itemBuilder: (context, index) {
                          return ProductItemWidget(
                            model: basket.product[index],
                            addBasket: () {
                              basket.addBasket(basket.basket[index]);
                            },
                            setFavorite: () {
                              basket.setFavorite(basket.basket[index]);
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
