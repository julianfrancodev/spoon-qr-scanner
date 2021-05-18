import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_v2/src/providers/scan_list_provider.dart';

class DirectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final scanListsProvider = Provider.of<ScanListProvider>(context);

    final scans = scanListsProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i){
        return ListTile(
          leading: Icon(Icons.ac_unit, color: Theme.of(context).primaryColor,),
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
