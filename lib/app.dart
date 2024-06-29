import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/data/di.dart';
import 'app/routes/app_pages.dart';
import 'app/shared/utils/utils.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(_) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: $r.color.transparent,
        systemNavigationBarColor: $r.color.white,
      ),
      child: ScreenUtilInit(
        minTextAdapt: true,
        builder: (_, child) => GetMaterialApp(
          useInheritedMediaQuery: true,
          theme: $r.theme,
          navigatorKey: Get.key,
          transitionDuration: $r.times.pageTransition,
          debugShowCheckedModeBanner: false,
          builder: (context, widget) => ScrollConfiguration(
            behavior: GlobalScrollBehavior(),
            child: MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.noScaling),
              child: widget!,
            ),
          ),
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL,
        ),
      ),
    );
  }
}
