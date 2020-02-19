import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swiper_demo/common/static_data.dart' as routes;
import 'package:swiper_demo/screens/faved.dart';
import 'package:swiper_demo/screens/home.dart';
import 'package:swiper_demo/screens/home_clone.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.HomeRoute:
      return MaterialPageRoute(builder: (_) => Home());
    case routes.HomeCloneRoute:
      return MaterialPageRoute(builder: (_) => HomeClone());
    case routes.FavoritesRoute:
       var data = settings.arguments as List;
      return MaterialPageRoute(builder: (_) => Faved(list: data));
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No path for ${settings.name}'),
                ),
              ));
  }
}
