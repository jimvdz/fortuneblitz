// Homepage made with <3 by Jimwel L. Valdez (jimvdz). Copyright (c) 2025. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fortuneblitz/screens/home/gamecards.dart';

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
              print("Credits clicked");
            },
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(4),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            spacing: 48,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Points sa taas ng screen
              Container(
                margin: const EdgeInsets.only(top: 56),
                child: Column(
                  spacing: 8,
                  children: [
                    Text('CURRENT POINTS', style: theme.textTheme.bodyLarge),
                    Text(
                      '19999',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                    SizedBox(height: 4), // for spacing kasi may leading yung texts
                    FilledButton(
                      onPressed: () => {print("Reset score clicked")},
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 24.0,
                          ),
                        ),
                      ),
                      child: Text(
                        'Reset Score',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),

              // For cards containing the games
              Container(
                margin: const EdgeInsets.only(bottom: 56, left: 20, right: 20),
                child: GameCards(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
