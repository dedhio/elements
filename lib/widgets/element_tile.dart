import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'edit_element_dialog.dart';

class ElementTile extends StatelessWidget {

  final DocumentSnapshot element;

  ElementTile(this.element);

  TextStyle textStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        element.data["simbolo"],
        style: textStyle,
      ),
      subtitle: Text(
        element.data["nome"],
        style: textStyle,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_right, color: Colors.white,),
          Text(
            "Massa ${element.data["massa"]}",
            textAlign: TextAlign.right,
            style: textStyle,
          ),
          Text(
            "Distribuição ${element.data["distribuicao"]}",
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


