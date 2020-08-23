import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  ListviewPage({Key key}) : super(key: key);

  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numList = new List();
  int _lastImage  = 0;

  @override
  void initState() {
    super.initState();

    _add10Images();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
         _add10Images();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
      ),
      body: _createList()
    );
  }

  Widget _createList(){

    return ListView.builder(

      itemCount: _numList.length,
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index){

        final image = _numList[index];
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
          placeholder: AssetImage('assets/original.gif'),
          height: 300,
          fit: BoxFit.cover,
        );
      },
    );
  }

  void _add10Images(){

    for (var i = 0; i < 10; i++) {
      _lastImage++;
      _numList.add(_lastImage);
    }

    setState(() {
      
    });

  }
}