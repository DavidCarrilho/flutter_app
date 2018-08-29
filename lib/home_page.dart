import 'package:flutter/material.dart';
import 'botoes_page.dart';
import 'listas_page.dart';
import 'cards_page.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
          title: new Text("                      VIDAS"),
        backgroundColor: Colors.teal,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Luan David Carrilho"),
                accountEmail: new Text("luan.david.oliver@gmail.com"),
                currentAccountPicture: new GestureDetector(
                  onTap: () => debugPrint("Toque na Imagem"),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage("file:///home/david/Imagens/IMG_20180701_141316.jpg"),
                  ),
                ),
               //  decoration: ,
            ),
            new ListTile(
              title: new Text("Botões"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new BotoesPage()));
              },
            ),
            new ListTile(
              title: new Text("Listas"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext) => new ListasPage()));
              },
            ),
            new ListTile(
              title: new Text("Cards"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new CardsPage()));
                
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Cancelar"),
              trailing: new Icon(Icons.close),
              onTap: (){
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      body: new Center(
        child: new Text("Aplicação"),
      ),
    );
  }
}