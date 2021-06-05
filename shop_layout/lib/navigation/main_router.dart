import 'package:nuvigator/nuvigator.dart';
import 'package:shop_layout/models/movel.dart';
import 'package:shop_layout/screens/cart_detail_screen.dart';
import 'package:shop_layout/screens/detail_screen.dart';
import 'package:shop_layout/screens/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

part 'main_router.g.dart';

@nuRouter
class MainRouter extends NuRouter {

  @NuRoute()
  ScreenRoute home() => ScreenRoute(
    builder: (_) => HomeScreen(),
  );

  @NuRoute()
  ScreenRoute detail({Movel movel}) => ScreenRoute(
    builder: (_) => DetailScreen(movel: movel),
  );

  @NuRoute()
  ScreenRoute cart() => ScreenRoute(
    builder: (_) => CartDetailScreen(),
  );

  @override
  Map<RouteDef, ScreenRouteBuilder> get screensMap  => _$screensMap;
}