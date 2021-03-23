import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:elements/screens/home_screen.dart';

void main() async{
  runApp(MyApp());

  QuerySnapshot snapshot = await Firestore.instance.collection('elementos').getDocuments();
  snapshot.documents.forEach((d) {
    print(d.data);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elements',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}