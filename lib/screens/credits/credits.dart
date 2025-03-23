// Credits page made with <3 by Jimwel L. Valdez. Copyright (c) 2025. All rights reserved.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Credits extends StatelessWidget {
  const Credits({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CREDITS', style: theme.textTheme.bodyLarge),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.white,
            ),
            onPressed: () {
              print("Credits clicked");
              Get.back();
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
                    Text('CREDITS', style: theme.textTheme.bodyLarge),
                    Text(
                      '19999',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
