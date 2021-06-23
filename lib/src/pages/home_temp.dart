import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget{
  final opciones = ['Uno','dos','tres','cuatro','cinco'];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text('Componbentes Temas'),
      ),
      body: ListView(
        //children:_crearItems()
        children:_crearItemsCorta()  
      ),
    );
  }

List<Widget> _crearItems(){

List<Widget> lista = new List<Widget>();
 
  for(String opt in opciones){
    final tempWidget = ListTile(
      title:Text(opt),
    );

    lista.add(tempWidget);
    lista.add(Divider());

  }

  return lista;
}
List<Widget> _crearItemsCorta(){
  return opciones.map((item){
    return Column(
      children: [
        ListTile(
          title: Text(item),
          subtitle: Text('Subtitulo'),
          leading: Icon(Icons.access_alarm_rounded),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){},
        ),
        Divider()
      ],
);
    
  }).toList();
}

}