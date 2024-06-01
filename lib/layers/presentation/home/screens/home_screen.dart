import 'package:flutter/material.dart';
import 'package:health_app_2/layers/presentation/home/widgets/history_card.dart';

import '../../../../core/constants/date_constamts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  SizedBox(
                    height: 42,
                    width: 42,
                    child: ClipOval(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset('assets/images/PhysicianImage.jpg')),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    height: 42,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          "Dr. Johnson",
                          style: TextStyle(
                            fontFamily: 'ManropeExtraBold',
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    height: 42,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          weekdays[now.weekday] ?? "",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          '${now.day.toString()} ${months[now.month]}, ${now.year}',
                          style: TextStyle(
                            fontFamily: 'ManropeExtraBold',
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent history',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'See more',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 12,
                            color: Theme.of(context).colorScheme.onSurface,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ...List.generate(
                  3,
                  (index) => const SizedBox(
                      width: double.maxFinite, child: HistoryCard()))
            ],
          ),
        ),
      ),
    );
  }
}
