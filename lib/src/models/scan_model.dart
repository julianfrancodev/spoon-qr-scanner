import 'dart:convert';
import 'package:meta/meta.dart';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  int id;
  String valor;
  String tipo;

  ScanModel({
    this.id,
    this.valor,
    this.tipo,
  }) {
    if (this.tipo.contains("http")) {
      this.tipo = 'http';
    } else {
      this.tipo = "geo";
    }
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        valor: json["valor"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "valor": valor,
        "tipo": tipo,
      };
}
