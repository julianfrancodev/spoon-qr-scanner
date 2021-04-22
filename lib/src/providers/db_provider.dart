import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qrscanner_v2/src/models/scan_model.dart';
export 'package:qrscanner_v2/src/models/scan_model.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbProvider {
  static Database _database;
  static final DbProvider db = DbProvider._();

  DbProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();

    return _database;
  }

  Future<Database> initDatabase() async {
    //Path donde esta la base de datos

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScansDB.db');

    print(path);

    //Crear la base de datos

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
              CREATE TABLE Scans (
                id INTEGER  PRIMARY KEY,
                tipo TEXT,
                valor TEXT
              );              
          ''');
    });
  }

  Future<int> createScanRaw(ScanModel newScan) async {
    final id = newScan.id;

    final tipo = newScan.tipo;

    final valor = newScan.valor;

    // Verificar la base de datos
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans(id, tipo, valor) values ($id, '$tipo', '$valor')
    ''');

    return res;
  }

  Future<int> createScan(ScanModel newScan) async {
    final db = await database;

    final res = await db.insert('Scans', newScan.toJson());

    // Es el id del ultimo registro insertado
    return res;
  }

  Future<ScanModel> getScanBy(int id) async {
    final db = await database;

    final res = await db.query("Scans", where: 'id  = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;

    final res = await db.query("Scans");

    return res.isNotEmpty
        ? res.map((e) => ScanModel.fromJson(e)).toList()
        : null;
  }

  Future<List<ScanModel>> getScansByType(String type) async {
    final db = await database;

    final res = await db.query("Scans", where: 'tipo = ?', whereArgs: [type]);

    return res.isNotEmpty
        ? res.map((e) => ScanModel.fromJson(e)).toList()
        : null;
  }

  Future<int> updateScan(ScanModel scanModel) async {
    final db = await database;

    final res = await db.update('Scans', scanModel.toJson(),
        where: 'id = ?', whereArgs: [scanModel.id]);

    return res;
  }

  Future<int> deleteScans (int id) async{
    final db = await database;

    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<int> deleteAllScans () async{
    final db = await database;

    final res = await db.delete('Scans');

    return res;
  }

}
