import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ElementScreenTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.assignment_rounded, size: 120.0, color: Colors.green),
          ],
        )
    );
  }
}
