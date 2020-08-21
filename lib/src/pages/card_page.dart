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
          _cardFirstType()
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
}