import 'package:flutter/cupertino.dart';
import 'package:qrscanner_v2/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, ScanModel scanModel) async {
 if(scanModel.tipo == 'http'){
   await canLaunch(scanModel.valor) ? await launch(scanModel.valor ) : throw 'Could not launch ${scanModel.valor}';
 }else{
   Navigator.pushNamed(context, 'map',arguments: scanModel);
 }
}
