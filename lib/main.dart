import 'package:flutter/material.dart';

import 'features/core/app.dart';
import 'features/core/injection.dart' as di;

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  runApp(MyApp(
    navigatorKey: globalKey,
  ));
}
