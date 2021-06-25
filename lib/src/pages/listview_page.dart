import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  //Scroll Controller 

  ScrollController _scrollController =new ScrollController();


  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar();
  _scrollController.addListener(() {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      //_agregar();
      fetchData();
    }
  });
  }
  //Metodo para evitar perdidas de memoria
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Listas'),
        ),
        body:Stack(children: [
          _crearLista(),
          _crearLoading()
        ],)
        
      );
  }

Widget _crearLista(){
    return RefreshIndicator(
        onRefresh: obtenerPagina,
        child: ListView.builder(
        controller: _scrollController,
        itemBuilder:(BuildContext context, int index){
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),//Agregar Imagen de cargando 
          );
        },
        itemCount: _listaNumeros.length,
      
      ),
    );
 }
 Future<Null> obtenerPagina()async{
   final duration = new Duration(seconds: 2);
   new Timer (duration,(){
     _listaNumeros.clear();
     _ultimoItem++;
     _agregar();
   });
   return Future.delayed(duration);
 }


void _agregar(){
  for (var i = 1; i<10; i++){
    _ultimoItem++;
    _listaNumeros.add(_ultimoItem);
  }
  setState(() {
    
  });
}
Future<Null> fetchData() async{
  _isLoading = true;
  setState(() {

  });
    final duration = new Duration(seconds: 2);
  new Timer(duration, respuestaHTTP);

}
void respuestaHTTP(){
_isLoading = false;
_scrollController.animateTo(
  _scrollController.position.pixels +100,
   duration:Duration(milliseconds: 250), 
   curve: Curves.fastOutSlowIn);
_agregar();
  }  
Widget _crearLoading(){
  if(_isLoading){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),

          ],
        ),
        SizedBox(
          height:15.0
        )
    ],);
  }else{
    return Container();
  }
}

}





