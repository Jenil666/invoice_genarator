import 'package:flutter/material.dart';
import 'package:invoice_genarator/Utils/variables.dart';

import '../Utils/Modlclass.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  List<data> AllData = [];
  TextEditingController addProductName = TextEditingController();
  TextEditingController addProductPrice = TextEditingController();
  TextEditingController addProductquantity= TextEditingController();
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                data d1 = data(name: addProductName.text,price: addProductPrice.text,quantity: addProductquantity.text);
                data1.add(d1);
                addProductPrice.clear();
                addProductName.clear();
                addProductquantity.clear();
              },
              icon: Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                addProductPrice.clear();
                addProductName.clear();
              },
              icon: Icon(
                Icons.cancel,
                color: Colors.white,
              )),
          backgroundColor: Colors.black,
          title: Text("Add Product Details"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: addProductName,
                decoration: InputDecoration(
                    hintText: "Add Product Name",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2))),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: addProductPrice,
                decoration: InputDecoration(
                    hintText: "Add Product Price",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2))),
                keyboardType: TextInputType.phone,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: addProductquantity,
                decoration: InputDecoration(
                    hintText: "Add Product Quantity",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2))),
                keyboardType: TextInputType.phone,
              ),
            ),


          ],
        ),
      ),
    );
  }
  // Widget Cont({String? smartProductName, String? smartProductPrice, int? inde})
  // {
  //   return Container(
  //     margin: EdgeInsets.all(5),
  //     padding: EdgeInsets.all(15),
  //     height: 70,
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         color: Colors.white,
  //         border: Border.all(color: Colors.black, width: 2)),
  //     child: Row(
  //       children: [
  //         Text("$smartProductName"),
  //         Expanded(child: SizedBox()),
  //         Text("$smartProductPrice"),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         PopupMenuButton(
  //           itemBuilder: (context) {
  //             return [
  //               PopupMenuItem(
  //                   onTap: () {},
  //                   child: Row(
  //                     children: [
  //                       IconButton(
  //                           onPressed: () {}, icon: Icon(Icons.edit)),
  //                       SizedBox(
  //                         width: 5,
  //                       ),
  //                       Text("Edit"),
  //                     ],
  //                   )),
  //               PopupMenuItem(
  //                 onTap: () {
  //                   setState(() {
  //                     data d1 = data();
  //                     // d1.productName!.removeAt(inde);
  //                     // d1.productPrice!.removeAt(inde);
  //                   });
  //                 },
  //                 child: Row(
  //                   children: [
  //                     Icon(
  //                       Icons.delete,
  //                       color: Colors.red,
  //                     ),
  //                     SizedBox(
  //                       width: 5,
  //                     ),
  //                     Text(
  //                       "Delete",
  //                       style: TextStyle(color: Colors.red),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ];
  //           },
  //           icon: Icon(Icons.more_vert),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
