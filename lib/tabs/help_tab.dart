import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:elements/widgets/element_tile.dart';


class HelpTab extends StatefulWidget {

  @override
  _HelpTabState createState() => _HelpTabState();
}

class _HelpTabState extends State<HelpTab> with AutomaticKeepAliveClientMixin{


  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'O que faz esse APP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Text(
                  'Arquitetura e funcionamento',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 17
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Nesta sessão iremos explicar o funcionamento do app. O aplicativo foi implementado '
                        'com o framework Flutter, desenvolvido pelo Google. A vantagem deste '
                        'framework é criar código nativo para Android e IOS com apenas uma implementação. '
                        'O Elements lista uma série de elementos da tabela periódica, previamente '
                        'cadastros em uma base única chamada Firebase. Os elementos são exibidos '
                        'na forma de lista de elementos dropdown, onde é possível expandir cada '
                        'elemento para ver os detalhes. Caso queira adicionar algum elemento, '
                        'basta clicar no símbolo de “+” no canto inferior e preencher o formulário. '
                        'Deve-se respeitar algumas validações para que o app envie os dados para '
                        'o FireBase.',
                    softWrap: true,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
