import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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

        final barcodeScanner = "https://quirky-haibt-6b16cd.netlify.app/";



        print(barcodeScanner);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
