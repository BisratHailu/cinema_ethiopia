import 'package:flutter/material.dart';

import './Pages/HomePage.dart';

void main() => runApp(CinemaEthiopia());


class CinemaEthiopia extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

   return MaterialApp(
     title: 'Ethio Cinema',
     theme: ThemeData(
       fontFamily: 'Baumans'
     ),
     home: HomePage(),
   );
  }

}