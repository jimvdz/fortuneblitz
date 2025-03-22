// Homepage made with <3 by Jimwel Valdez (jimvdz). Copyright (c) 2025. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get yung theme sa current build

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FORTUNE BLITZ', style: theme.textTheme.bodyLarge),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/info.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {
              print("wow");
            },
            style: IconButton.styleFrom(
              backgroundColor:
                  theme.colorScheme.secondary,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(4),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('CURRENT POINTS', style: theme.textTheme.bodyLarge),
            Text(
              '19999',
              style: theme.textTheme.headlineLarge?.copyWith(
                color: theme.colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
