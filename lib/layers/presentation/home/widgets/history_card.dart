import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: const Row(
                  children: [
                    Text('ZOO.OO'),
                    Text("• "),
                    Text('Physical Examination')
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
