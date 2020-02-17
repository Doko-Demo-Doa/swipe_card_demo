import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swiper_demo/common/static_data.dart' as routes;
import 'package:swiper_demo/screens/home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.HomeRoute:
      return MaterialPageRoute(builder: (_) => Home());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No path for ${settings.name}'),
                ),
              ));
  }
}
