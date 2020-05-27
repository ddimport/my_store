import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController contBarcode = new TextEditingController();
  TextEditingController contDescription = new TextEditingController();
  TextEditingController contCost = new TextEditingController();
  TextEditingController contPrice = new TextEditingController();
  TextEditingController contRack = new TextEditingController();
  TextEditingController contPicture = new TextEditingController();
  TextEditingController contPackage = new TextEditingController();
  TextEditingController contParenBarcode = new TextEditingController();

  void addData(){
    var url="http://ddshop.gr/my_store/adddata.php";
    http.post(url, body: {
      "it_barcode": contBarcode.text,
      "it_descripcion": contDescription.text,
      "it_costo": contCost.text,
      "it_price": contPrice.text,
      "it_rack": contRack.text,
      "it_picture": contPicture.text,
      "it_package": contPackage.text,
      "it_parent": contParenBarcode.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                TextField(
                  controller: contBarcode,
                  decoration: InputDecoration(hintText: "Barcode", labelText: "Barcode"),
                ),
                TextField(
                  controller: contDescription,
                  decoration: InputDecoration(hintText: "Description", labelText: "Description"),
                ),
                TextField(
                  controller: contCost,
                  decoration: InputDecoration(hintText: "Cost", labelText: "Cost"),
                ),
                TextField(
                  controller: contPrice,
                  decoration: InputDecoration(hintText: "Price", labelText: "Price"),
                ),
                TextField(
                  controller: contRack,
                  decoration: InputDecoration(hintText: "Rack", labelText: "Rack"),
                ),
                TextField(
                  controller: contPicture,
                  decoration: InputDecoration(hintText: "Picture URL", labelText: "Picture URL"),
                ),
                TextField(
                  controller: contPackage,
                  decoration: InputDecoration(hintText: "Package", labelText: "Package"),
                ),
                TextField(
                  controller: contParenBarcode,
                  decoration: InputDecoration(hintText: "Parent Barcode", labelText: "Parent Barcode"),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  child: Text("ADD DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}