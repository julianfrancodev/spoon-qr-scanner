import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_v2/src/providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {

  final String type;

  const ScanTiles({Key key, @required this.type}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final scanListsProvider = Provider.of<ScanListProvider>(context);

    final scans = scanListsProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i){
        return ListTile(
          leading: Icon(
            this.type == 'http'? Icons.home_outlined :
            Icons.ac_unit,
            color: Theme.of(context).primaryColor,),
          title: Text(scans[i].valor),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
          onTap: (){
            print("abriendo algo");
          },
        );
      },
    );
  }
}
