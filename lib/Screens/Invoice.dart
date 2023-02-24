import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:invoice_genarator/Utils/variables.dart';
import 'dart:ui' as ui;

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {

  final GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              title: const Text(
                "Invoice",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      captureImage();
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
            body:  RepaintBoundary(
                key: globalKey,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                              "---------------------------------------------------------------------------")),
                      Expanded(
                        child: ListView.builder(
                          itemCount: data1.length,
                          itemBuilder: (context, index) {
                            return Cont(index);
                          },
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text("---------------------------------------------------------------------------")),
                      Row(
                        children: [
                          const SizedBox(width: 30,),
                          const Text("Total",
                              style: TextStyle(color: Colors.black, fontSize: 20)),
                          const Spacer(),
                          Text(
                            "₹$sum2",
                            style: const TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(width: 30,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          const SizedBox(width: 30,),
                          const Text("TAX 15%",
                              style: TextStyle(color: Colors.black, fontSize: 20)),
                          const Spacer(),
                          Text(
                            "₹${(sum2*15)/100}",
                            style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(width: 30,),
                        ],
                      ),
                      const SizedBox(height: 50,),
                      Row(
                        children: [
                          const SizedBox(width: 30,),

                          const Text(" Grand Total",
                              style: TextStyle(color: Colors.black, fontSize: 20)),


                          const Spacer(),
                          Text(
                            "₹${sum2 + (sum2*15)/100}",
                            style: const TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(width: 30,),
                        ],
                      ),
                      SizedBox(height: 80,),
                    ],
                  ),
                ),
              ),
            ));
  }

  // ignore: non_constant_identifier_names
  Widget Cont(int n) {
    return Row(
      children: [

        const SizedBox(
          width: 30,
        ),
        Text("${n + 1}."),
        // ignore: prefer_const_constructors
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 100,
            child: Text(
              "${data1[n].name}",
              style: const TextStyle(color: Colors.black, fontSize: 20),
            )),
        // const Expanded(
        //   child: SizedBox(),
        // ),
        Container(width: 50, alignment:Alignment.centerRight,child: Text("₹${data1[n].price}")),
        Container(width: 50, alignment:Alignment.centerRight,child: Text("${data1[n].quantity}")),
        Expanded(child: SizedBox()),
        Container(width: 50, alignment:Alignment.centerRight,child: Text("${prices[n]}")),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }
  void captureImage() async{

    RenderRepaintBoundary? boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;

    final ui.Image? image = await boundary?.toImage();

    final ByteData? byteData = await image!.toByteData(format: ui.ImageByteFormat.png);
    var pngBytes = byteData!.buffer.asUint8List();

    final result = await ImageGallerySaver.saveImage(pngBytes,name: "My Post.png",quality: 100);

    print("@@@@@@@@@@@@@@@@@@@@@ $result");
  }
}
