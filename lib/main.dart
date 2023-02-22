import 'package:flutter/material.dart';
import 'package:invoice_genarator/Screens/AddProduct.dart';
import 'package:invoice_genarator/Screens/HomeScreen.dart';
import 'package:invoice_genarator/Screens/Invoice.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: 'invo',
      routes: {
        '/':(context)=>Homescreen(),
        'add':(context)=>AddProduct(),
        'invo':(context)=>Invoice(),
      },
    ),
  );
}
