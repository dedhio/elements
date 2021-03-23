import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditElementDialog extends StatefulWidget {

  final DocumentSnapshot element;

  EditElementDialog({this.element});

  @override
  _EditElementDialogState createState() => _EditElementDialogState(
      element: element
  );
}

class _EditElementDialogState extends State<EditElementDialog> {

  final TextEditingController _controller;

  _EditElementDialogState({DocumentSnapshot element}) :
        _controller = TextEditingController(text: element != null ?
        element.data["simbolo"] : ""
        );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Teste"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StreamBuilder<bool>(
                    builder: (context, snapshot) {
                      return FlatButton(
                        child: Text("Excluir"),
                        textColor: Colors.red,
                        onPressed: (){
                        }
                      );
                    }
                ),
                StreamBuilder<bool>(
                    builder: (context, snapshot) {
                      return FlatButton(
                        child: Text("Salvar"),
                        onPressed: (){
                        }
                      );
                    }
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}

