import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/companends/bottom_navigation_bar.dart';
import 'package:riverpod_project/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:riverpod_project/riverpod/riverpod_managment.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => BaseScaffold_State();
}

class BaseScaffold_State extends ConsumerState<BaseScaffold> {
  @override
  void initState() {
    ref.read(productRiverpod).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(bottomNavBarRiverpod);

    return Scaffold(
      appBar: appBarBuild(watch),
      bottomNavigationBar: BattomNavBar(),
      body: watch.body(),
    );
  }

  CupertinoNavigationBar appBarBuild(BottomNavBarRiverpod watch) {
    return CupertinoNavigationBar(
      middle: Text(
        watch.appBarTitle(),
      ),
    );
  }
}
