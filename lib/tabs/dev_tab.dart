import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:elements/widgets/element_tile.dart';


class DevTab extends StatefulWidget {

  @override
  _DevTabState createState() => _DevTabState();
}

class _DevTabState extends State<DevTab> with AutomaticKeepAliveClientMixin{


  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView(
      children: <Widget>[
        GestureDetector(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/bibi.jpeg"),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Gabrielle Oliveira",
                          style: TextStyle(fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("admin@example.com",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text("999363636",
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          onTap: (){
          },
        ),
        GestureDetector(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/dedhio.jpeg"),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Geovani Lopes",
                          style: TextStyle(fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("admin@example.com",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text("999363636",
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          onTap: (){
          },
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
