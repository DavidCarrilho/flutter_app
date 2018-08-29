import 'package:flutter/material.dart';

enum _MaterialListType {
  umaLinha,
  umaLinhaComAvatar,
  duasLinhas,
  tresLinhas,
}

class ListasPage extends StatefulWidget {
  const ListasPage({ Key key }) : super(key: key);

  @override
  _ListasPageState createState() => new _ListasPageState();
}

class _ListasPageState extends State<ListasPage> {
  static final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  PersistentBottomSheetController<Null> _bottomSheet;
  _MaterialListType _itemType = _MaterialListType.tresLinhas;
  bool ordenacaoReversa = false;

  bool _showAvatars = true;
  bool _showIcons = false;

  List<String> items = <String>[
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'Y', 'X', 'Z'
  ];

  void changeItemType(_MaterialListType type) {
    setState(() {
      _itemType = type;
    });
    _bottomSheet?.setState(() { });
  }

  void _showConfigurationSheet() {
    final PersistentBottomSheetController<Null> bottomSheet = scaffoldKey.currentState.showBottomSheet((BuildContext bottomSheetContext) {
      return new Container(
        decoration: const BoxDecoration(
          border: const Border(top: const BorderSide(color: Colors.black26)),
        ),
        child: new ListView(
          shrinkWrap: true,
          primary: false,
          children: <Widget>[
            new MergeSemantics(
              child: new ListTile(
                  dense: true,
                  title: const Text('Uma Linha'),
                  trailing: new Radio<_MaterialListType>(
                    groupValue: _itemType,
                    onChanged: changeItemType,
                  )
              ),
            ),
            new MergeSemantics(
              child: new ListTile(
                  dense: true,
                  title: const Text('Duas Linhas'),
                  trailing: new Radio<_MaterialListType>(
                    value: _MaterialListType.duasLinhas,
                    groupValue: _itemType,
                    onChanged: changeItemType,
                  )
              ),
            ),
            new MergeSemantics(
              child: new ListTile(
                dense: true,
                title: const Text('Três Linhas'),
                trailing: new Radio<_MaterialListType>(
                  value: _MaterialListType.tresLinhas,
                  groupValue: _itemType,
                  onChanged: changeItemType,
                ),
              ),
            ),
            new MergeSemantics(
                child: ListTile(
                  dense: true,
                  title: const Text('Show Avatar'),
                  trailing: Checkbox(
                      value: _showAvatars,
                      onChanged: (bool value) {
                        setState(() {
                          _showAvatars = value;
                        });
                        _bottomSheet?.setState(() {});
                      }
                  ),
                )
            ),
            new MergeSemantics(
                child: ListTile(
                  dense: true,
                  title: const Text('Show Ícone'),
                  trailing: Checkbox(
                      value: _showIcons,
                      onChanged: (bool value) {
                        setState(() {
                          _showIcons = value;
                        });
                        _bottomSheet?.setState(() {});
                      }
                  ),
                )
            ),          ],
        ),
      );
    });

    setState(() {
      _bottomSheet = bottomSheet;
    });

    _bottomSheet.closed.whenComplete(() {
      if (mounted) {
        setState(() {
          _bottomSheet = null;
        });
      }
    });
  }

  Widget buildListTile(BuildContext context, String item) {
    Widget secondary;
    if (_itemType == _MaterialListType.duasLinhas) {
      secondary = const Text('Texto Secundário');
    } else if (_itemType == _MaterialListType.tresLinhas) {
      secondary = const Text(
        'Essa linha adicional aparece com o modelo 3 linhas. Vou adicionar mais texto aqui para quebrar a terceira linha..',
      );
    }
    return new MergeSemantics(
      child: new ListTile(
        isThreeLine: _itemType == _MaterialListType.tresLinhas,
        leading: _showAvatars ? ExcludeSemantics(child: CircleAvatar(child: Text(item))): null,
        trailing: _showIcons ? Icon(Icons.info, color: Theme.of(context).disabledColor) : null,
        title: new Text('Esse item representa a letra $item.'),
        subtitle: secondary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String itemTypeText;
    switch (_itemType) {
      case _MaterialListType.umaLinha:
      case _MaterialListType.umaLinhaComAvatar:
        itemTypeText = 'Uma Linha';
        break;
      case _MaterialListType.duasLinhas:
        itemTypeText = 'Duas Linhas';
        break;
      case _MaterialListType.tresLinhas:
        itemTypeText = 'Três Linhas';
        break;
    }

    Iterable<Widget> listTiles = items.map((String item) => buildListTile(context, item));
    listTiles = ListTile.divideTiles(context: context, tiles: listTiles);

    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Listas Page'),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            tooltip: 'Sort',
            onPressed: () {
              setState(() {
                ordenacaoReversa = !ordenacaoReversa;
                items.sort((String a, String b) => ordenacaoReversa ? b.compareTo(a) : a.compareTo(b));
              });
            },
          ),
          new IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: _bottomSheet == null ? _showConfigurationSheet : null,
          ),
            ],
      ),
      body: new Scrollbar(
        child: new ListView(
          children: listTiles.toList(),
        ),
      ),
    );
  }
}