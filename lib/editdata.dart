import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController contBarcode;
  TextEditingController contDescription;
  TextEditingController contCost;
  TextEditingController contPrice;
  TextEditingController contRack;
  TextEditingController contPicture;
  TextEditingController contPackage;
  TextEditingController contParenBarcode;

  void editData() {
    var url="http://ddshop.gr/my_store/editdata.php";
    http.post(url, body: {
      "it_id": widget.list[widget.index]['id'],
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
  void initState() {
    contBarcode = TextEditingController(text: widget.list[widget.index]['barcode']);
    contDescription = TextEditingController(text: widget.list[widget.index]['descripcion']);
    contCost = TextEditingController(text: widget.list[widget.index]['costo']);
    contPrice = TextEditingController(text: widget.list[widget.index]['price']);
    contRack = TextEditingController(text: widget.list[widget.index]['puesto']);
    contPicture = TextEditingController(text: widget.list[widget.index]['imagen']);
    contPackage = TextEditingController(text: widget.list[widget.index]['paqueto']);
    contParenBarcode = TextEditingController(text: widget.list[widget.index]['parentBarcode']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                TextField(
                  controller: contBarcode,
                  decoration: InputDecoration(
                      hintText: "Barcode", labelText: "Barcode"),
                ),
                TextField(
                  controller: contDescription,
                  decoration: InputDecoration(
                      hintText: "Description", labelText: "Description"),
                ),
                TextField(
                  controller: contCost,
                  decoration:
                      InputDecoration(hintText: "Cost", labelText: "Cost"),
                ),
                TextField(
                  controller: contPrice,
                  decoration:
                      InputDecoration(hintText: "Price", labelText: "Price"),
                ),
                TextField(
                  controller: contRack,
                  decoration:
                      InputDecoration(hintText: "Rack", labelText: "Rack"),
                ),
                TextField(
                  controller: contPicture,
                  decoration: InputDecoration(
                      hintText: "Picture URL", labelText: "Picture URL"),
                ),
                TextField(
                  controller: contPackage,
                  decoration: InputDecoration(
                      hintText: "Package", labelText: "Package"),
                ),
                TextField(
                  controller: contParenBarcode,
                  decoration: InputDecoration(
                      hintText: "Parent Barcode", labelText: "Parent Barcode"),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  child: Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context)=> new Home()
                      )
                    );
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
