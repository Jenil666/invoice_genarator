import 'package:flutter/material.dart';
import 'package:invoice_genarator/Utils/variables.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                productName.add(addProductName.text);
                productPrice.add(addProductPrice.text);
              });
              print(productPrice);
              print(productName);
              addProductPrice.clear();
              addProductName.clear();
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
        ],
      ),
    ));
  }
}
