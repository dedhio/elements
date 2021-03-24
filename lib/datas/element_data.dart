import 'package:cloud_firestore/cloud_firestore.dart';

class ElementData{

  String id;

  String simbolo;
  String nome;
  String ions;
  String distribuicao;

  int numero;
  int periodo;
  int familia;
  double massa;

  ElementData.fromDocument(DocumentSnapshot documentSnapshot){
    id = documentSnapshot.documentID;
    simbolo = documentSnapshot.data["simbolo"];
    nome = documentSnapshot.data["nome"];
    ions = documentSnapshot.data["ions"];
    distribuicao = documentSnapshot.data["distribuicao"];
    numero = documentSnapshot.data["numero"];
    periodo = documentSnapshot.data["periodo"];
    familia = documentSnapshot.data["familia"];
    massa = documentSnapshot.data["massa"];

  }

  Map<String, dynamic> toMap(){
    return {
      "simbolo": simbolo,
      "nome": nome,
      "ions": ions,
      "distribuicao": distribuicao,
      "numero": numero,
      "periodo": periodo,
      "familia": familia,
      "massa": massa,
    };
  }


}