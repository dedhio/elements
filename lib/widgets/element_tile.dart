import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'edit_element_dialog.dart';

class ElementTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  ElementTile(this.snapshot);

  TextStyle textStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        snapshot.data["simbolo"],
        style: textStyle,
      ),
      subtitle: Text(
        snapshot.data["nome"],
        style: textStyle,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_right, color: Colors.white,),
          Text(
            "Massa ${snapshot.data["massa"]}",
            textAlign: TextAlign.right,
            style: textStyle,
          ),
          Text(
            "Distribuição ${snapshot.data["distribuicao"]}",
            style: textStyle,
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditElementDialog())
        );
       },
    );
  }
}


