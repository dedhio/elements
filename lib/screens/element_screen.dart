import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elements/models/element_model.dart';
import 'package:elements/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class ElementScreen extends StatefulWidget {

  final DocumentSnapshot element;

  ElementScreen({this.element});

  @override
  _ElementScreenState createState() => _ElementScreenState(element);
}

class _ElementScreenState extends State<ElementScreen> {

  final _simboloController = TextEditingController();
  final _nomeController = TextEditingController();
  final _massaController = TextEditingController();
  final _numeroController = TextEditingController();
  final _familiaController = TextEditingController();
  final _periodoController = TextEditingController();
  final _distribuicaoController = TextEditingController();
  final _ionsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  DocumentSnapshot element;

  _ElementScreenState(DocumentSnapshot element);

  @override
  Widget build(BuildContext context) {

    InputDecoration _buildDecoration(String label){
      return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
      );
    }

    final _fieldStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );

    return Scaffold(
      backgroundColor: Colors.grey[850],
        appBar: AppBar(
          elevation: 0,
          title: Text('Criar Elemento'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.save),
              onPressed: (){
              },
            ),
          ],
        ),
        body: ScopedModelDescendant<ElementModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(child: CircularProgressIndicator(),);

            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(20),
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    child: Text(
                      "?",
                      style: TextStyle(color: Colors.grey[850],
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                    backgroundColor: Colors.grey[200],
                  ),
                  TextFormField(
                    controller: _simboloController,
                    style: _fieldStyle,
                    decoration: _buildDecoration("Simbolo"),
                    validator: (text) {
                      if (text.isEmpty) return "O simbolo deve ser informado.";
                      if (text.length > 2)
                        return "O simbolo deve ter no máximo 2 caracteres";
                    },
                  ),
                  TextFormField(
                    controller: _nomeController,
                    style: _fieldStyle,
                    decoration: _buildDecoration("Nome"),
                    validator: (text) {
                      if (text.isEmpty) return "O nome deve ser informado.";
                    },
                  ),
                  TextFormField(
                    controller: _massaController,
                    style: _fieldStyle,
                    decoration: _buildDecoration("Massa"),
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true),
                    onSaved: (t) {},
                    validator: (text) {
                      if (text.isEmpty) return "A massa deve ser informada.";
                    },
                  ),
                  TextFormField(
                    controller: _numeroController,
                    style: _fieldStyle,
                    decoration: _buildDecoration("Número Atômico"),
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true),
                    validator: (text) {
                      if (text.isEmpty) return "O número atômico deve ser informado.";
                    },
                  ),
                  TextFormField(
                    controller: _familiaController,
                    style: _fieldStyle,
                    decoration: _buildDecoration("Familia"),
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true),
                    validator: (text) {
                      if (text.isEmpty) return "A família deve ser informada.";
                    },
                  ),
                  TextFormField(
                    controller: _periodoController,
                    style: _fieldStyle,
                    decoration: _buildDecoration("Período"),
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true),
                    validator: (text) {
                      if (text.isEmpty) return "O período deve ser informado.";
                    },
                  ),
                  TextFormField(
                    controller: _distribuicaoController,
                    style: _fieldStyle,
                    decoration: _buildDecoration("Distribuição"),
                    validator: (text) {
                      if (text.isEmpty) return "A distribuição deve ser informada.";
                    },
                  ),
                  TextFormField(
                    controller: _ionsController,
                    style: _fieldStyle,
                    decoration: _buildDecoration("Íons"),
                    validator: (text) {
                      if (text.isEmpty) return "O tipo de íons deve ser informado.";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      child: Text("Criar Elemento",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: (){
                        if(_formKey.currentState.validate()){

                          Map<String, dynamic> elementData = {
                            "simbolo": _simboloController.text,
                            "nome": _nomeController.text,
                            "massa": _massaController.text,
                            "numero": _numeroController.text,
                            "familia": _familiaController.text,
                            "periodo": _periodoController.text,
                            "distribuicao": _distribuicaoController.text,
                            "ions": _ionsController.text,
                          };

                          model.cadastrar(
                            elementData: elementData,
                            onSuccess: _onSuccess,
                            onFail: _onFail
                          );

                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>HomeScreen())
                          );

                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        )
    );
  }

  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Elemento criado com sucesso!"),
          backgroundColor: Theme.of(context).primaryColor,
          duration: Duration(seconds: 2),
        )
    );
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context).pop();
    });
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao criar elemento!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
  }

  void saveElement() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();

      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Salvando elemento...", style: TextStyle(color: Colors.white),),
            duration: Duration(minutes: 1),
            backgroundColor: Colors.pinkAccent,
          )
      );

      bool success = await saveElementFirebase();

      _scaffoldKey.currentState.removeCurrentSnackBar();

      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text(success ? "Elemento salvo!" : "Erro ao salvar elemento!", style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.pinkAccent,
          )
      );
    }
  }

  bool saveElementFirebase(){
    return false;
  }

}
