import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/riverpod/riverpod_managment.dart';

class BattomNavBar extends ConsumerWidget {
  const BattomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(bottomNavBarRiverpod);
    var read = ref.read(bottomNavBarRiverpod);

    return BottomNavigationBar(
      items: read.items,
      currentIndex: read.currentIndex,
      onTap: (index) {
        read.setCurrentIndex(index);
      },
    );
  }
}
