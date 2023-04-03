import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:riverpod_project/riverpod/product_riverpod.dart';
import 'package:riverpod_project/riverpod/riverpod_managment.dart';

import '../../companends/product_widget_item.dart';

class Anasayfa extends ConsumerWidget {
  const Anasayfa({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);

    return Scaffold(
      body: Padding(
        padding: [20, 15].horizontalAndVerticalP,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ürünler",
              style:
                  Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16),
            ),
            Expanded(
              child: GrockList(
                  shrinkWrap: true,
                  scrollEffect: const ScrollPhysics(),
                  padding: [0, 10].horizontalAndVerticalP,
                  itemCount: read.product.length,
                  itemBuilder: (context, index) {
                    return ProductItemWidget(
                      model: watch.product[index],
                      addBasket: () {
                        read.addBasket(read.product[index]);
                      },
                      setFavorite: () {
                        read.setFavorite(watch.product[index]);
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
