import 'package:flutter/material.dart';
import 'package:qrscanner_v2/src/models/scan_model.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ScanModel scanModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
      ),
      body: Center(
        child: Text(scanModel.valor),
      ),
    );
  }
}
