import 'package:flutter/material.dart';
import 'package:qrscanner_v2/src/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];

  String typeSelected = "http";

  Future<ScanModel> createScan(String value) async {
    final newScan = new ScanModel(valor: value);

    final id = await DbProvider.db.createScan(newScan);

    newScan.id = id;

    if (this.typeSelected == newScan.tipo) {
      this.scans.add(newScan);
    }

    notifyListeners();

    return newScan;
  }

  loadScans() async {
    final scans = await DbProvider.db.getAllScans();

    this.scans = [...scans];

    notifyListeners();
  }

  loadScansByType(String tipo) async {

    final scans = await DbProvider.db.getScansByType(tipo);

    this.scans = [...scans];
    this.typeSelected = tipo;

    notifyListeners();
  }

  removeAll() async {
    await DbProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  removeScanById(int id) async {
    await DbProvider.db.deleteScans(id);
  }
}
