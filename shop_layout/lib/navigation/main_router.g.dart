// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_router.dart';

// **************************************************************************
// NuvigatorGenerator
// **************************************************************************

class MainRoutes {
  static const home = 'main/home';

  static const detail = 'main/detail';

  static const cart = 'main/cart';
}

class DetailArgs {
  DetailArgs({@required this.movel});

  final Movel movel;

  static DetailArgs parse(Map<String, Object> args) {
    if (args == null) {
      return DetailArgs(movel: null);
    }
    return DetailArgs(
      movel: args['movel'],
    );
  }

  Map<String, Object> get toMap => {
        'movel': movel,
      };
  static DetailArgs of(BuildContext context) {
    final routeSettings = ModalRoute.of(context)?.settings;
    final nuvigator = Nuvigator.of(context);
    if (routeSettings?.name == MainRoutes.detail) {
      final args = routeSettings?.arguments;
      if (args == null)
        throw FlutterError('DetailArgs requires Route arguments');
      if (args is DetailArgs) return args;
      if (args is Map<String, Object>) return parse(args);
    } else if (nuvigator != null) {
      return of(nuvigator.context);
    }
    return null;
  }
}

extension MainRouterNavigation on MainRouter {
  Future<Object> toHome() {
    return nuvigator.pushNamed<Object>(
      MainRoutes.home,
    );
  }

  Future<Object> pushReplacementToHome<TO extends Object>({TO result}) {
    return nuvigator.pushReplacementNamed<Object, TO>(
      MainRoutes.home,
      result: result,
    );
  }

  Future<Object> pushAndRemoveUntilToHome<TO extends Object>(
      {@required RoutePredicate predicate}) {
    return nuvigator.pushNamedAndRemoveUntil<Object>(
      MainRoutes.home,
      predicate,
    );
  }

  Future<Object> popAndPushToHome<TO extends Object>({TO result}) {
    return nuvigator.popAndPushNamed<Object, TO>(
      MainRoutes.home,
      result: result,
    );
  }

  Future<Object> toDetail({Movel movel}) {
    return nuvigator.pushNamed<Object>(
      MainRoutes.detail,
      arguments: {
        'movel': movel,
      },
    );
  }

  Future<Object> pushReplacementToDetail<TO extends Object>(
      {Movel movel, TO result}) {
    return nuvigator.pushReplacementNamed<Object, TO>(
      MainRoutes.detail,
      arguments: {
        'movel': movel,
      },
      result: result,
    );
  }

  Future<Object> pushAndRemoveUntilToDetail<TO extends Object>(
      {Movel movel, @required RoutePredicate predicate}) {
    return nuvigator.pushNamedAndRemoveUntil<Object>(
      MainRoutes.detail,
      predicate,
      arguments: {
        'movel': movel,
      },
    );
  }

  Future<Object> popAndPushToDetail<TO extends Object>(
      {Movel movel, TO result}) {
    return nuvigator.popAndPushNamed<Object, TO>(
      MainRoutes.detail,
      arguments: {
        'movel': movel,
      },
      result: result,
    );
  }

  Future<Object> toCart() {
    return nuvigator.pushNamed<Object>(
      MainRoutes.cart,
    );
  }

  Future<Object> pushReplacementToCart<TO extends Object>({TO result}) {
    return nuvigator.pushReplacementNamed<Object, TO>(
      MainRoutes.cart,
      result: result,
    );
  }

  Future<Object> pushAndRemoveUntilToCart<TO extends Object>(
      {@required RoutePredicate predicate}) {
    return nuvigator.pushNamedAndRemoveUntil<Object>(
      MainRoutes.cart,
      predicate,
    );
  }

  Future<Object> popAndPushToCart<TO extends Object>({TO result}) {
    return nuvigator.popAndPushNamed<Object, TO>(
      MainRoutes.cart,
      result: result,
    );
  }
}

extension MainRouterScreensAndRouters on MainRouter {
  Map<RouteDef, ScreenRouteBuilder> get _$screensMap {
    return {
      RouteDef(MainRoutes.home): (RouteSettings settings) {
        return home();
      },
      RouteDef(MainRoutes.detail): (RouteSettings settings) {
        final args = DetailArgs.parse(settings.arguments);
        return detail(movel: args.movel);
      },
      RouteDef(MainRoutes.cart): (RouteSettings settings) {
        return cart();
      },
    };
  }
}
