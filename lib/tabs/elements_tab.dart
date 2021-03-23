import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:elements/widgets/element_tile.dart';


class ElementsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            style: TextStyle(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
                hintText: "Pesquisar",
                hintStyle: TextStyle(color: Colors.white),
                icon: Icon(Icons.search, color: Colors.white, size: 20,),
                border: InputBorder.none
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection("elementos").getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var dividedTiles = ListTile
                    .divideTiles(
                    tiles: snapshot.data.documents.map((doc) {
                      return ElementTile(doc);
                    }).toList(),
                    color: Colors.grey[500])
                    .toList();
                return ListView(
                  children: dividedTiles,
                );
              }
            },
          )
        )
      ]
    );
  }
}
