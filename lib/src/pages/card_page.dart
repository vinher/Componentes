import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding:EdgeInsets.all(10.0),
        children: <Widget> [
          _cardTipoSimple(),
          //SizedBox:tamaño de la separación de las tarjetas
          SizedBox(height:5.0),
          _cardTipoConImagen(),

        ],
        
        ),
    );
  }
}

Widget _cardTipoSimple(){
  return Card(
    elevation:8.0,
    shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)),
    child: Column(
      children:<Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color:Colors.green.shade600),
          title:Text('Titulo de Tarjeta'),
          subtitle: Text('Subtitulo'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          FlatButton(child:Text('Cancelar'),
          onPressed: (){},
          ),
          FlatButton(child:Text('Ok'),
          onPressed: (){},
          ),
        ],)
      ]
    ),
  );
}
Widget _cardTipoConImagen(){
  return Card(
    //clipBehavior:Clip.antiAlias: Permite que nada se salga de la tarjeta
    clipBehavior: Clip.antiAlias,
    elevation:8.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Column(
      children:[
        FadeInImage(
          image: NetworkImage('https://wallup.net/wp-content/uploads/2016/03/10/343179-landscape-nature.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds:200),
          height: 300.0,
          fit: BoxFit.cover,
        ),
        //Image(
          //image:NetworkImage('https://wallup.net/wp-content/uploads/2016/03/10/343179-landscape-nature.jpg'),
        //),
        Container(
          padding: EdgeInsets.all(10.0),
          child:Text('Probando como se ve'),
        )
        
      ]
    ),
  );
}