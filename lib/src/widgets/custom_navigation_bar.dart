import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_v2/src/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOption;
    print(currentIndex);
    return BottomNavigationBar(
      onTap: (int i) {
        uiProvider.setSelectedMenuOption = i;
      },
      elevation: 0,
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map_sharp),
          label: "Mapa",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: "Direcciones"),
      ],
    );
  }
}
