import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raghuvir_developers/src/config/theme.dart';
import 'package:raghuvir_developers/src/config/strings.dart';
import 'package:raghuvir_developers/src/view/authentication/sign_in.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Material nav key
  static GlobalKey<NavigatorState> materialNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: Strings.appName,
          navigatorKey: materialNavKey,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeConfig.lightTheme,
          darkTheme: ThemeConfig.darkTheme,
          home: LoginPage(),
        );
      },
    );
  }
}


// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // Material nav key
//   static GlobalKey<NavigatorState> materialNavKey = GlobalKey<NavigatorState>();


// }
