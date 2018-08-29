import 'package:flutter/material.dart';

class BotoesPage extends StatefulWidget {
  @override
  _BotoesPageState createState() => new _BotoesPageState();

}


  class _BotoesPageState extends State<BotoesPage>{
  ShapeBorder _buttonShape;
  @override
  Widget build(BuildContext context) {
    final ButtonThemeData buttonTheme = ButtonTheme.of(context).copyWith(
      shape: _buttonShape
    );
    return new Scaffold(
      body: new DefaultTabController(
          length: 5,
          child: new Scaffold(
            appBar: new AppBar(
              bottom: new TabBar(
                  tabs: [
                    new Tab(text: 'Raised'),
                    new Tab(text: 'Flat'),
                    new Tab(text: 'Outline'),
                    new Tab(text: 'Icon'),
                    new Tab(text: 'Action'),
                  ]
              ),
              title: new Text('Botões Page'),
              backgroundColor: Colors.teal,
            ),
            body: new TabBarView(children: [

              new ButtonTheme.fromButtonThemeData(
                  data: buttonTheme,
                  child: buildRaisedButton("Raised Button diciona dimenssoes a Layouts geramente simples e enfatizam funçoes em esapaços ocupados ou amplos"),
              ),

              new ButtonTheme.fromButtonThemeData(
                  data: buttonTheme,
                  child: buildFlatButton('Flat Button é um Botçao mais "Clean", Recomendado para utilizar em barras de ferraentas ou em caixas de dialogos'),
              ),

              new ButtonTheme.fromButtonThemeData(
                  data: buttonTheme,
                  child: builOutlineButton('OutLine Button são botoes opacos e elevam-se quando pressionados, Eles são frequentemente emparelhados com botões em relevo para indicar uma ação secundaria'),
              ),

              //new Text('Icon'),
              new ButtonTheme.fromButtonThemeData(
                  data: buttonTheme,
                  child: buildIconButton(),
              ),

              //new Text('Action'),
              new ButtonTheme.fromButtonThemeData(
                  data: buttonTheme,
                  child: buildActionButton(),

              ),

            ]),
          )),
    );
  }}

  Widget buildRaisedButton(title){
    return
        new Align(
          alignment: const Alignment(0.0, -0.2),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(title,
                          textAlign: TextAlign.center,
                          style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: const Text("RAISED BUTTON"),
                      onPressed: (){

                      },
                    ),
                    const RaisedButton(
                      child: const Text("DESABILITADO"),
                      onPressed: null,
                    ),
                  ],
                ),

                new ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton.icon(
                      icon: const Icon(Icons.add, size: 18.0),
                      label: const Text("RAISED BUTTON"),
                      onPressed: (){

                          },
                    ),
                    new RaisedButton.icon(
                      icon: const Icon(Icons.add, size: 18.0),
                      label: const Text("DESABILITADO"),
                      onPressed: null,

                    ),
                  ],
                )
              ],
          ),
        );
}

Widget buildFlatButton (title){
  return Align(
    alignment: const Alignment(0.0, -0.2),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
              child: Text("FLAT BUTTON"),
              onPressed: (){

              },
            ),
            FlatButton(
              child: Text("DESABILITADO"),
              onPressed: null,
              ),
              ],
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton.icon(
                    icon: const Icon(Icons.add_circle_outline, size: 18.0),
                    label: const Text("FLAT BUTTON"),
                    onPressed: (){

                    },
                  ),
                  FlatButton.icon(
                    icon: const Icon(Icons.add_circle_outline, size: 18.0),
                    label: const Text("DESABILITADO"),
                    onPressed: null,
                  ),
                ],
            )
      ],
    ),
  );
}

Widget builOutlineButton (title){
  return Align(
    alignment: const Alignment(0.0, -0.2),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            OutlineButton(
              child: const Text("OUTLINE BUTTON"),
              onPressed: (){

              },
            ),
            OutlineButton(
              child: const Text("DESSABILITADO"),
            ),
          ],
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              OutlineButton.icon(
                icon: const Icon(Icons.add, size: 18.0),
                label: const Text("OUTLINE BUTTON"),
                onPressed: (){

                },
              ),
              OutlineButton.icon(
                icon: const Icon(Icons.add, size: 18.0),
                label: const Text("DESABILITADO"),
              ),
            ],
        ),
      ],
    ),
  );
}

Widget buildIconButton(){
  return Align(
    alignment: const Alignment(0.0, -0.2),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.thumb_up),
          onPressed: (){
            
          },
        ),
        IconButton(
          icon: const Icon(Icons.thumb_down),
        ),
      ],
    ),
  );
}

Widget buildActionButton(){
  return Align(
    alignment: const Alignment(0.0, -0.2),
    child: FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: (){

      },
    ),
  );
}