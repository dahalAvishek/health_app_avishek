import 'package:flutter/material.dart';
import 'package:health_app_2/constants/app_colors.dart';
import 'package:health_app_2/constants/routes/route_builder.dart';


void main() {
  runApp(const MyApp());
}

class NoOverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Health App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        // appBarTheme: const AppBarTheme(
        //   titleTextStyle:  TextStyle(color: Colors.black,
        //   fontFamily: 'lato',
        //   fontSize: 16,
        //   fontWeight: ),
        // )
        primaryColor: Colors.orange,
        bottomSheetTheme:
            const BottomSheetThemeData(surfaceTintColor: Colors.white),
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            // onSurface: AppColors.dark,
            primary: AppColors.white,
            onPrimary: AppColors.black,
            secondary: AppColors.orange,
            onSecondary: AppColors.orange.withOpacity(0.12),
            error: AppColors.red,
            onError: AppColors.red,
            surface: AppColors.white,
            onSurface: AppColors.black),
        useMaterial3: true,
        // inputDecorationTheme: to be put,
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 24, vertical: 13)),
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              iconColor: WidgetStatePropertyAll(AppColors.grayText),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)))),
              foregroundColor: WidgetStatePropertyAll(AppColors.grayText),
              textStyle: WidgetStatePropertyAll(TextStyle(
                  fontSize: 12,
                  fontFamily: "Manrope",
                  color: AppColors.grayText))),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 24, fontFamily: "HauoraBold"),
          displayMedium: TextStyle(fontSize: 16, fontFamily: "SatoshiRegular"),
          displaySmall: TextStyle(fontSize: 12, fontFamily: "HauoraRegular"),
          titleMedium: TextStyle(fontSize: 16, fontFamily: "HauoraRegular"),
          bodyLarge: TextStyle(fontSize: 18, fontFamily: "HauoraRegular"),
          bodyMedium: TextStyle(fontSize: 16, fontFamily: "HauoraRegular"),
          bodySmall: TextStyle(fontSize: 14, fontFamily: "HauoraRegular"),
        ),
      ),
      builder: (context, child) =>
          ScrollConfiguration(behavior: NoOverScrollBehavior(), child: child!),
      routerConfig: router,
    );
  }
}
