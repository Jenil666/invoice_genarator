
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/Modlclass.dart';
import '../Utils/variables.dart';

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
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, 'invo');
            }, icon: Icon(Icons.done))
          ],
          backgroundColor: Colors.black,
          title: Text(
            "Product List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemCount: data1.length,
          itemBuilder: (context, index) {
            return
              Cont(data1[index], index);
          },),
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
  Widget Cont(data d, int inde) {
    TextEditingController updatedname = TextEditingController(text: "${d.name}");
    TextEditingController updatedprice = TextEditingController(text: "${d.price}");
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
          SizedBox(width: 10,),
          Text("${d.name}",style: TextStyle(fontSize: 20),),
          Expanded(child: SizedBox()),
          Text("${d.price}"),
          SizedBox(
            width: 30,
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    onTap: () {},
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    InkWell(
                                      onTap:(){
                                        setState(() {
                                          d.name = updatedname.text;
                                          d.price = updatedprice.text;
                                        });
                                        Navigator.pop(context);
                                      } ,
                                      child: Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        alignment:Alignment.center,
                                        child: Text("Done",style: TextStyle(fontSize: 20,color: Colors.white),),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:(){
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        alignment:Alignment.center,
                                        child: Text("Cancle",style: TextStyle(fontSize: 20,color: Colors.white),),
                                      ),
                                    ),
                                  ],
                                  content: Column(
                                    children: [
                                      TextField(
                                        controller: updatedname,
                                      ),
                                      TextField(
                                        controller: updatedprice,
                                      ),
                                    ],
                                  ),
                                );
                              },);
                            }, icon: Icon(Icons.edit)),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Edit"),
                      ],
                    )),
                PopupMenuItem(
                  onTap: () {
                    setState(() {
                      data d1 = data();
                      data1.removeAt(inde);
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
  }


}