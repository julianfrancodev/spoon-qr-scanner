import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_v2/src/pages/directions_page.dart';
import 'package:qrscanner_v2/src/pages/maps_page.dart';
import 'package:qrscanner_v2/src/providers/db_provider.dart';
import 'package:qrscanner_v2/src/providers/ui_provider.dart';
import 'package:qrscanner_v2/src/widgets/custom_navigation_bar.dart';
import 'package:qrscanner_v2/src/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Historial"),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Obtener el seleted desde el provider

    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOption;

    // todo: temporal leer la base de datos

    final tempScan = new ScanModel(valor: "http://www.google.com",tipo: 'http');


    DbProvider.db.getAllScans().then((value) => print(value));

    switch(currentIndex){

      case 0:
        return MapsPage();

      case 1:
        return DirectionsPage();



      default:
        return MapsPage();
    }
  }
}

