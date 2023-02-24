import 'package:flutter/material.dart';
import 'package:invoice_genarator/Screens/AddProduct.dart';
import 'package:invoice_genarator/Screens/HomeScreen.dart';
import 'package:invoice_genarator/Screens/Invoice.dart';
import 'package:invoice_genarator/Screens/logo.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Logo(),
        'homescreen':(context)=>Homescreen(),
        'add':(context)=>AddProduct(),
        'invo':(context)=>Invoice(),
      },
    ),
  );
}
