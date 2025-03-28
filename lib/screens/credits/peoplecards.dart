// People cards made with <3 by Jimwel L. Valdez. Copyright (c) 2025. All rights reserved.
import 'package:flutter/material.dart';

class PeopleCards extends StatelessWidget {
  const PeopleCards({super.key});

  @override
  Widget build(BuildContext context) {
    // Get yung theme sa current build
    final theme = Theme.of(context);

    // Store grpmates in list to avoid repetitive code
    final List<Map<String, String>> people = [
      {
        "name": "JIMWEL L. VALDEZ",
        "image": "assets/images/people/valdez.jpg",
        "role": "Project Lead, Game Developer, UI/UX Design",
      },
      {
        "name": "CHRISTINE JASLINE D. NATIVIDAD",
        "image": "assets/images/people/natividad.jpg",
        "role": "Game Developer, UI/UX Design",
      },
      {
        "name": "KATE ANNE S. DAVID",
        "image": "assets/images/people/david.jpg",
        "role": "Game Developer, UI/UX Design",
      },
      {
        "name": "CHESTER JONATHAN C. TAYAG",
        "image": "assets/images/people/tayag.jpg",
        "role": "Game Concepts, UI/UX Design",
      },
      {
        "name": "BRYAN AARON B. SANTIAGO",
        "image": "assets/images/people/placeholder.jpg",
        "role": "UI/UX Design",
      },
      {
        "name": "LUIS MIGUEL I. CAYANAN",
        "image": "assets/images/people/placeholder.jpg",
        "role": "UI/UX Design",
      },
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,

      // Mag-iiterate for every person
      children:
          people.map((person) {
            return SizedBox(
              width: (MediaQuery.of(context).size.width - 40 - 12) / 2,
              height: 260,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: theme.colorScheme.tertiary.withAlpha(30),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        
                        // Person image
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('${person["image"]}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Person name
                        Text(
                          '${person["name"]}',
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),

                        // Person role
                        Text(
                          '${person["role"]}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white.withAlpha(180),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
