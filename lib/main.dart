import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes_page.dart';
import 'package:flutter/material.dart';

//import 'package:componentes/src/pages/home_temp.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Cambiar el idioma
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en','US'),
        const Locale('es','ES')
      ],
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      //home: HomePage(),
      initialRoute: '/',
      routes:getAplicationRoutes(),
    onGenerateRoute: ( RouteSettings settings ){
      return MaterialPageRoute(builder:(BuildContext context) => AlertPage());
    },
    );
  }
}