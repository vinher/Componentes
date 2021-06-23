import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = ''; 
  String _email  = '';
  String _password = '';
  String _fecha = '';  
  String _opcionSeleccionada = 'Volar';
  List _poderes = ['Volar','Rayos X','Super Fuerza','Super Velocidad'];
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Inputs ')
      ),
    body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical:20.0),
      children: [
        _crearInput(),
        Divider(),
        _crearEmail(),
        Divider(),
        _crearPassword(),
        Divider(),
        _crearFecha(context),
        Divider(),
        _crearDropdown(),
        Divider(),
        _crearPersona(),
        Divider()
       ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
        //autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(60.0)
          ),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Escribe tu nombre',
          labelText: 'Nombre',
          helperText: 'Solo Es El Nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)
         ),
        onChanged: (valor){
          setState(() {
            _nombre = valor;
  
          });
          
        },
    );
  }



Widget _crearEmail(){
  return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(60.0)
          ),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)
         ),
        onChanged: (valor){
          setState(() {
            _email = valor;
  
          });
          
        },
    ); 
  }

Widget _crearPassword(){
  return TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(60.0)
          ),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)
         ),
        onChanged: (valor){
          setState(() {
            _password = valor;
  
          });
          
        },
    );
}

  Widget _crearFecha(BuildContext context){
      return TextField(
        enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(60.0)
          ),
          hintText: 'Fecha de Nacimiento',
          labelText: 'Fecha de Nacimiento',
          //helperText: 'Introduce tu contraseña',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.perm_contact_cal)
         ),
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
    );
   }
   _selectDate(BuildContext context) async{
     DateTime picked = await showDatePicker(
    context: context, 
     initialDate: new DateTime.now(), 
     firstDate: new DateTime(2021), 
     lastDate: new DateTime(2022),
     //Cambiar el idioma 
     locale: Locale('es','ES')
     );
     if(picked != null){
       setState((){
         _fecha = picked.toString();
         _inputFieldDateController.text = _fecha;
       });
     }

   }
        List<DropdownMenuItem<String>>getOpcionesDropdown(){
          List<DropdownMenuItem<String>> lista = new List();
          _poderes.forEach((poder) {
            lista.add(DropdownMenuItem(
              child:Text(poder),
              value: poder,
            ));
          });
          return lista;
        }
        Widget _crearDropdown(){
          return Row(
            children: [
              Icon(Icons.select_all),
              SizedBox(width:30.0),
              Expanded(
                  child: DropdownButton(
                  value: _opcionSeleccionada,
                  items: getOpcionesDropdown(),
                  onChanged: (opt){
                    setState(() {
                      _opcionSeleccionada = opt;
                    });
                  }),
              )

            ],
          );
          
          
        }   

        Widget _crearPersona(){
          return ListTile(
            title: Text('Nombre: $_nombre' ),
            subtitle: Text('Email:$_email' + '\nContraseña: $_password'),
            trailing: Text(_opcionSeleccionada),           

          );
        }


}