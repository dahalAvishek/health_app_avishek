import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final String label;
  const CustomActionButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.maxFinite,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          isExtended: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          onPressed: () {},
          label: Text(
            label,
            style: (TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
                fontFamily: 'ManropeBold')),
          ),
        ),
      ),
    );
  }
}
