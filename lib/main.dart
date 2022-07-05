import 'package:flutter/material.dart';
import 'package:lotto/view/lotto_page.dart';

void main(){runApp(MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lotto',
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
      home: LottoPage()
    );
  }
}



