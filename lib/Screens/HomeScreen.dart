import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/Modlclass.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  data d1 = data();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Product List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
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
                  Text(""),
                  Expanded(child: SizedBox()),
                  Text(""),
                  SizedBox(
                    width: 10,
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                            onTap: () {},
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.edit)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Edit"),
                              ],
                            )),
                        PopupMenuItem(
                          onTap: () {
                            setState(() {
                              // data d1 = data();
                              // d1.productName?.removeAt(inde);
                              // d1.productPrice?.removeAt(inde);
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
                          ),
                        ),
                      ];
                    },
                    icon: Icon(Icons.more_vert),
                  )
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, 'add').then(
                  (value) => setState(() {}),
            );
          },
          child: Icon(Icons.add)),
      ),
    );
  }
}
