import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shimmer/shimmer.dart';

import 'edit_element_dialog.dart';

class ElementTile extends StatelessWidget {

  final DocumentSnapshot element;

  ElementTile(this.element);

  TextStyle textStyle = TextStyle(color: Colors.grey[850]);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
        child: ExpansionTile(
          childrenPadding: EdgeInsets.only(left: 30, top: 0, right: 10, bottom: 10),
          expandedAlignment: Alignment.centerLeft,
          leading: GestureDetector(
            onTap: (){
              showDialog(context: context,
                  builder: (context) => EditElementDialog(
                    element: element,
                  )
              );
            },
            child: CircleAvatar(
              child: Text(
                element.data["simbolo"],
                style: TextStyle(color: Colors.grey[850], fontWeight: FontWeight.w500, fontSize: 25),
              ),
              backgroundColor: Colors.grey[200],
            ),
          ),
          title: Text(
            element.data["nome"],
            style: TextStyle(color: Colors.grey[850], fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            "${element.data["massa"]}",
            style: TextStyle(color: Colors.grey[850], fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Numero atômico: ${element.data["numero"]}",
                  style: textStyle,
                ),
                Text(
                  "Distribuição: ${element.data["distribuicao"]}",
                  style: textStyle,
                ),
                Text(
                  "Familia: ${element.data["familia"]}",
                  style: textStyle,
                ),
                Text(
                  "Periodo: ${element.data["periodo"]}",
                  style: textStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );






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


