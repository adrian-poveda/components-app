import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _name  = '';
  String _email = '';
  String _password = '';
  String _selectedDate = '';
  String _finalSelectedDate = '';
  DateTime dateTime = DateTime.now();
  TextEditingController _inputDateTimeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Form')
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _createInput(),
          Divider(),
          _createEmailInput(),
          Divider(),
          _createPasswordInput(),
          Divider(),
          _createDateInput(context),
          Divider(),
          _createPerson()        
        ],
      ),
    );
  }

  Widget _createInput() {

    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        counter: Text('${_name.length} characters'),
        //hintText: 'Your Name',
        labelText: 'Name',
        //helperText: 'Write your name',
        //suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle, size: 50)
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
        
      },
    );

  }

  Widget _createPerson() {


    return ListTile(
      title: Text('$_name'),
      subtitle: Text('$_email'),
    );

  }

  Widget _createEmailInput() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        //hintText: 'Your Name',
        labelText: 'Email',
        //helperText: 'Write your name',
        //suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.alternate_email, size: 50)
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
        
      },
    );
  }

  Widget _createPasswordInput() {

    return TextField(
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        //hintText: 'Your Name',
        labelText: 'Password',
        //helperText: 'Write your name',
        //suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.lock_outline, size: 50)
      ),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
        
      },
    );
  }

  Widget _createDateInput(BuildContext context) {

    return TextField(
      autofocus: false,
      controller: _inputDateTimeController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        //hintText: 'Your Name',
        labelText: 'Date',
        //helperText: 'Write your name',
        //suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.date_range, size: 50)
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: dateTime,
      locale: Locale('en', 'US'),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
    ); //porque devuelve un Future

    if (picked != null){
      setState(() {
        _selectedDate = picked.toString();
        dateTime = DateTime.parse(_selectedDate);
        _finalSelectedDate = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
        _inputDateTimeController.text = _finalSelectedDate;
      });
    }
  }
}