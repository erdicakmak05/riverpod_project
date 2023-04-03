import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:riverpod_project/model/product_model.dart';
import 'package:riverpod_project/riverpod/product_riverpod.dart';
import 'package:riverpod_project/view/favorite/riverpod/favorite_riverpod.dart';

final bottomNavBarRiverpod =
    ChangeNotifierProvider((_) => BottomNavBarRiverpod());

final productRiverpod = ChangeNotifierProvider((_) => ProductRiverpod());

final favoriteRiverpod = ChangeNotifierProvider((_) => FavoriteRiverpod());
