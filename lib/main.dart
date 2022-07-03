import 'package:flutter/material.dart';
import 'scorersPageVeiw.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     theme:ThemeData.dark() ,
     home: scorersPageVeiw(),
   );
  }
}


