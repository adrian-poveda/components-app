import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 45),
        child: Column(
          children: [
            Text('Change image size',
              style: TextStyle(fontSize: 20),
            ),
            _createSlider(),
            Expanded(child: _createImage())
          ],
        )
      ),
    );
  }

 Widget _createSlider() {

   return Slider(
     value: _sliderValue,
     min: 10,
     max: 400,
     activeColor: Colors.indigoAccent,
     label: 'Change image size',
     onChanged: ( value ){
       setState(() {
         _sliderValue = value;
       });
     }
   );
 }

 Widget _createImage() {

   return Image(
     image: NetworkImage('https://i.pinimg.com/originals/50/98/e4/5098e44fa43e8c6cb0cc558aea547400.png'),
     width: _sliderValue,
     fit: BoxFit.contain,
   );
 }
}