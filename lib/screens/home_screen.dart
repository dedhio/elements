import 'package:elements/widgets/edit_element_dialog.dart';
import 'package:flutter/material.dart';
import 'package:elements/tabs/elements_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

  }


  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Elements", style: TextStyle(fontSize: 25),),
      ),
      backgroundColor: Colors.grey[850],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.pinkAccent,
            primaryColor: Colors.white,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.white54)
            )
        ),
        child: BottomNavigationBar(
            currentIndex: _page,
            onTap: (p){
              _pageController.animateToPage(
                  p,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease
              );
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  title: Text("Elementos")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Desenvolvedores")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.help),
                  title: Text("Ajuda")
              )
            ]
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (p){
            setState(() {
              _page = p;
            });
          },
          children: <Widget>[
            ElementsTab(),
            Container(color: Colors.grey,),
            Container(color: Colors.tealAccent,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
        onPressed: (){
          showDialog(context: context,
              builder: (context) => EditElementDialog()
          );
        },
      )
    );
  }
}
