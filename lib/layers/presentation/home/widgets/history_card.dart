import 'package:flutter/material.dart';

enum CardType { historyCard, accessmentCard }

class HistoryCard extends StatelessWidget {
  final CardType cardType;
  const HistoryCard({super.key, required this.cardType});

  @override
  Widget build(BuildContext context) {
    final Color cardThemeColor = cardType == CardType.historyCard
        ? Theme.of(context).colorScheme.inversePrimary
        : Theme.of(context).colorScheme.secondary;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
                color:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.15),
                spreadRadius: -19,
                blurRadius: 18.8,
                offset: const Offset(0, 21))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: cardThemeColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(15)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          'ZOO.OO •',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: cardThemeColor),
                        ),
                        Text(
                          ' Physical Examination',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: cardThemeColor),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                SizedBox(
                  width: 20,
                  child: IconButton(
                      iconSize: 30,
                      onPressed: () {},
                      icon: Icon(
                        Icons.navigate_next_rounded,
                        color: cardThemeColor,
                      )),
                )
              ],
            ),
            if (cardType == CardType.historyCard)
              const SizedBox(
                height: 28,
              ),
            if (cardType == CardType.historyCard)
              Text(
                "Emerson Calzoni",
                style: TextStyle(
                    fontFamily: 'ManropeBold',
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            if (cardType == CardType.historyCard)
              Row(children: [
                Expanded(
                    child: Text(
                  'Make • 36 Year old • 84 kg',
                  style: Theme.of(context).textTheme.bodySmall,
                )),
                Text(
                  "02.03.2024",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ])
          ],
        ),
      ),
    );
  }
}
