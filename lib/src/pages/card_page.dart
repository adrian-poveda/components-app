import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards')),
      body: ListView(
        padding: EdgeInsets.all(10),
        //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        children: [
          _cardFirstType(),
          SizedBox(height: 10),
          _cardSecondType(),
          SizedBox(height: 10)
        ],
      ),
    );
  }

 Widget _cardFirstType() {

   return Card(
     child: Column(
       children: [
         ListTile(
           leading: Icon(Icons.photo_album, color: Colors.blue, size: 100),
           title: Text('Cards Title'),
           subtitle: Text('Subtitle of the card'),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             FlatButton(
               child: Text('Cancel'),
               onPressed: () {},
             ),
             FlatButton(
               child: Text('OK'),
               onPressed: () {},
             )
           ],
         )
       ],
     ),
   );



  }

  Widget _cardSecondType() {

    return Card(
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage('https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
            placeholder: AssetImage('assets/original.gif'),
            fadeInDuration: Duration(milliseconds: 400),
            height: 300,
            fit: BoxFit.cover
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Image description'),
          )
        ],
      ),
    );

  }
}