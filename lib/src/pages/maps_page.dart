import 'package:flutter/material.dart';
import 'package:qrscanner_v2/src/widgets/scan_tiles.dart';


class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   return ScanTiles(type: 'geo');
  }
}
