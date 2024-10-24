import 'package:flutter/material.dart';

class Routes {
  static const String result = 'result';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case result:
        final resultOptions = settings.arguments as Map;
        return MaterialPageRoute(builder: (_) => );
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: Text('${settings.name}は存在しません', style: const TextStyle(fontSize: 30))),
        ));
    }
  }
}
