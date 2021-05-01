import 'package:flutter/material.dart';
import 'package:qrscanner_v2/src/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans = [];

  String typeSelected = "http";

  createScan(String value) async{
    final newScan = new ScanModel(valor: value);

    final id = await DbProvider.db.createScan(newScan);

    newScan.id  = id;

    if(this.typeSelected == newScan.tipo){
      this.scans.add(newScan);

    }
    
    notifyListeners();

  }

}