import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiper_demo/locator.dart';
import 'package:swiper_demo/services/navigation_service.dart';

import 'package:swiper_demo/common/static_data.dart' as routes;
import 'package:swiper_demo/router.dart' as router;

void main() {
  setupLocator();
  runApp(SwiperDemoApp());
}

class SwiperDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [],
        child: MaterialApp(
          title: 'Flutter Swiper Demo',
          theme: ThemeData(
            primarySwatch: Colors.pink,
          ),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: router.generateRoute,
          onUnknownRoute: (settings) =>
              MaterialPageRoute(builder: (context) => Text('Nothing')),
          initialRoute: routes.HomeRoute,
        ));
  }
}
