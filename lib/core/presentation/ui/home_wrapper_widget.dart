import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_app_2/core/presentation/ui/health_app_fonts_icons.dart';

class HomeWrapperWidget extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const HomeWrapperWidget({super.key, required this.navigationShell});

  @override
  State<HomeWrapperWidget> createState() => _HomeWrapperWidgetState();
}

class _HomeWrapperWidgetState extends State<HomeWrapperWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(child: widget.navigationShell),
      bottomNavigationBar: Material(
        color: Theme.of(context).colorScheme.primary,
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: 58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      if (widget.navigationShell.currentIndex != 0) {
                        widget.navigationShell
                            .goBranch(0, initialLocation: true);
                      }
                    },
                    icon: Icon(
                      HealthAppFonts.home,
                      // Icons.home_outlined,
                      size: 24,
                      color: (widget.navigationShell.currentIndex == 0)
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.grey,
                    )),
                IconButton(
                    onPressed: () {
                      if (widget.navigationShell.currentIndex != 1) {
                        widget.navigationShell.goBranch(1);
                      }
                    },
                    icon: Icon(
                      HealthAppFonts.patients,
                      size: 24,
                      color: (widget.navigationShell.currentIndex == 1)
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.grey,
                    )),
                IconButton(
                    onPressed: () {
                      if (widget.navigationShell.currentIndex != 2) {
                        widget.navigationShell.goBranch(2);
                      }
                    },
                    icon: Icon(
                      HealthAppFonts.history,
                      size: 24,
                      color: (widget.navigationShell.currentIndex == 2)
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.grey,
                    )),
                IconButton(
                    onPressed: () {
                      if (widget.navigationShell.currentIndex != 3) {
                        widget.navigationShell.goBranch(3);
                      }
                    },
                    icon: Icon(
                      HealthAppFonts.settings,
                      size: 24,
                      color: (widget.navigationShell.currentIndex == 3)
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.grey,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
