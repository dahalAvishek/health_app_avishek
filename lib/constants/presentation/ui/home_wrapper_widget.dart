import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        child: const SizedBox(
          child: Text("app bar"),
        ),
      ),
    );
  }
}
