import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_v2/src/providers/scan_list_provider.dart';
import 'package:qrscanner_v2/src/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: ()async{
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     "#ed8bef",
        //     "Cancelar",
        //     false,
        //     ScanMode.QR);

        final barcodeScanner = "http://quirky-haibt-6b16cd.netlify.app/";

        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

        scanListProvider.createScan(barcodeScanner);

        if(barcodeScanner == "-1"){
          return;
        }

       final newScan = await scanListProvider.createScan('geo:5.514093, -73.363972');

        launchURL(context, newScan);

        },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
