import 'package:flutter/material.dart';
import 'package:invoice_genarator/Utils/Modlclass.dart';
import 'package:invoice_genarator/Utils/variables.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: Text("Invoice",style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.image_outlined,color: Colors.white,))
        ],
      ),
          body: Center(
            child: Text("${}"),
          ),
    ));
  }
}
