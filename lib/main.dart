import 'package:flutter/material.dart';
import 'package:health_app_2/core/constants/app_colors.dart';
import 'package:health_app_2/core/routes/route_builder.dart';

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
            onSurface: AppColors.grayText),
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
          displayLarge: TextStyle(fontSize: 24, fontFamily: "Manrope"),
          displayMedium: TextStyle(fontSize: 16, fontFamily: "Manrope"),
          displaySmall: TextStyle(fontSize: 12, fontFamily: "ManropeBold"),
          titleMedium: TextStyle(fontSize: 16, fontFamily: "Manrope"),
          bodyLarge: TextStyle(fontSize: 18, fontFamily: "Manrope"),
          bodyMedium: TextStyle(fontSize: 16, fontFamily: "Manrope"),
          bodySmall: TextStyle(fontSize: 14, fontFamily: "Manrope"),
        ),
      ),
      builder: (context, child) =>
          ScrollConfiguration(behavior: NoOverScrollBehavior(), child: child!),
      routerConfig: router,
    );
  }
}
