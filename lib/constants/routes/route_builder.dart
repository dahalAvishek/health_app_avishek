import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../layers/presentation/home/screens/home_screen.dart';
import '../presentation/ui/home_wrapper_widget.dart';
import 'app_routes.dart';

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (context, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                end: Offset.zero,
                begin: const Offset(1.0, 0.0),
              ).animate(animation),
              child: child,
            );
          },
        );
}

class NoTransition extends CustomTransitionPage<void> {
  NoTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 0),
          transitionsBuilder: (context, animation, __, child) {
            return child;
          },
        );
}

final _homeShellNavigatorKey = GlobalKey<NavigatorState>();
final _patientsShellNavigationKey = GlobalKey<NavigatorState>();
final _historyShellNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(initialLocation: HOME_ROUTE, routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeWrapperWidget(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(navigatorKey: _homeShellNavigatorKey, routes: [
          GoRoute(
              path: HOME_ROUTE,
              pageBuilder: (context, state) {
                return CustomSlideTransition(child: const HomeScreen());
              })
        ])
      ]),
]);
