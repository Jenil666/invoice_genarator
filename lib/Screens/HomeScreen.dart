import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_genarator/Utils/variables.dart';

import '../Utils/Modlclass.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, 'add').then(
                (value) => setState(() {}),
              );
            },
            child: Icon(Icons.add)),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Product List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: productPrice.length,
        itemBuilder: (context, index) {
          return Cont(productName[index], productPrice[index],index);
        },
      ),
    ));
  }

  Widget Cont(String SmartproductName, String SmartproductPrice,int inde) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(15),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2)),
      child: Row(
        children: [
          Text("$SmartproductName"),
          Expanded(child: SizedBox()),
          Text("$SmartproductPrice"),
          SizedBox(
            width: 10,
          ),
          PopupMenuButton(
            // onSelected: (value) {
            //   value = popupmenu;
            // },
           //enabled: popupmenu!,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    onTap: (){

                    },
                    child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Edit"),
                  ],
                )),
                PopupMenuItem(
                    onTap: (){
                      setState(() {
                        productName.removeAt(inde);
                      });
                    },
                    child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Delete",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                )),
              ];
            },
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
    );
  }
}
