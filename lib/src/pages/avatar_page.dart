import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget{
 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Avatar Page'),
        actions: [
         Container(
          padding:EdgeInsets.all(5.0) , 
          child:CircleAvatar(
            backgroundImage:
            NetworkImage
            ('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fvignette.wikia.nocookie.net%2Fmarvelcinematicuniverse%2Fimages%2F8%2F82%2FAIW_Empire_-_P%25C3%25B3ster_de_Thanos_sin_texto.png%2Frevision%2Flatest%3Fcb%3D20180324042516%26path-prefix%3Des&f=1&nofb=1'),
            radius:30.0
            ),
          ),
          
          Container(
          margin: EdgeInsets.only(right:10.0),
          child:CircleAvatar(
            child:Text('SL'),
            backgroundColor:Colors.brown.shade600,

            ),
          )
        ],
      ),
      body: Center(
        child:FadeInImage(
          image:NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fvignette.wikia.nocookie.net%2Fmarvelcinematicuniverse%2Fimages%2F8%2F82%2FAIW_Empire_-_P%25C3%25B3ster_de_Thanos_sin_texto.png%2Frevision%2Flatest%3Fcb%3D20180324042516%26path-prefix%3Des&f=1&nofb=1'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds:200),
        ),
      ),
    


    );
  }
}