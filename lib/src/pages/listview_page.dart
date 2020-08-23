import 'package:flutter/material.dart';
import 'dart:async';



class ListviewPage extends StatefulWidget {
  ListviewPage({Key key}) : super(key: key);

  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numList = new List();
  int _lastImage  = 0;
  bool _isloading = false;

  @override
  void initState() {
    super.initState();

    _add10Images();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
         //_add10Images();
         fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose(); //Prevenir fugas de memoria
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
      ),
      body: Stack(
        children: [
          _createList(),
          _createLoading()
        ],
      )
      
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

  Future<Null> fetchData() async{
    //Simular un delay antes de recoger los siguientes registros
    _isloading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, http_response); //Cuando pasen los 2 segundos, lanzar el método de abajo

  }

  void http_response() {

    _isloading = false; //Porque ya he terminado de cargar
    _add10Images();
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );

  }

  Widget _createLoading() {

    if(_isloading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator()
          ],),
          SizedBox(height: 15)
        ],
      );
    }else{
      return Container();
    }
  }
}