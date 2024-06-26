import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_2/core/constants/app_colors.dart';
import 'package:health_app_2/core/routes/route_builder.dart';
import 'package:health_app_2/layers/presentation/home/blocs/patient/patient_bloc.dart';
import 'package:health_app_2/utils/dependencies_injection.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
  // await serviceLocator();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<PatientBloc>(),
        ),
      ],
      child: MaterialApp.router(
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
              surface: AppColors.grayText.withOpacity(1),
              inversePrimary: AppColors.blue,
              onSurface: AppColors.grayText),
          useMaterial3: true,
          iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(0)))),
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
            bodyMedium: TextStyle(fontSize: 14, fontFamily: "ManropeExtraBold"),
            bodySmall: TextStyle(fontSize: 14, fontFamily: "ManropeBold"),
          ),
        ),
        builder: (context, child) => ScrollConfiguration(
            behavior: NoOverScrollBehavior(), child: child!),
        routerConfig: router,
      ),
    );
  }
}
