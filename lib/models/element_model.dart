import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class ElementModel extends Model {

  Map<String, dynamic> elementData = Map();

  FirebaseStorage firebaseElement;

  bool isLoading = false;

  static ElementModel of(BuildContext context) =>
      ScopedModel.of<ElementModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentElement();
  }

  void cadastrar({@required Map<String, dynamic> elementData,
    @required VoidCallback onSuccess, @required VoidCallback onFail}){

    Firestore.instance.collection("elementos").add(elementData).then((doc){
      //cartProduct.cid = doc.documentID;
    });

    notifyListeners();

    //var result = await _saveElementData(elementData);

  }

  void removeElementItem(String elementId){
    Firestore.instance.collection("elementos").document(elementId).delete();

    notifyListeners();
  }

  Future<Null> _saveElementData(Map<String, dynamic> elementElement) async {
    await Firestore.instance.collection("elementos").document().setData(elementData);
  }

  Future<Null> _loadCurrentElement() async {
    notifyListeners();
  }

}