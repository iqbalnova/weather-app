import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/core/app.dart';
import 'features/core/injection.dart' as di;

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  di.init();

  runApp(MyApp(
    navigatorKey: globalKey,
  ));
}
