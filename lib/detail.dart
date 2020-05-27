import 'package:flutter/material.dart';
import './main.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

void deleteData(){
  var url="http://ddshop.gr/my_store/deletedata.php";
  http.post(url, body: {
  "it_id": widget.list[widget.index]['id']
  });
}

void confirm(){
  AlertDialog alertDialog = new AlertDialog(
    content: Text("Are you sure want to delete the record : '${widget.list[widget.index]['descripcion']}'"),
    actions: <Widget>[
      RaisedButton(
        child: Text("OK DELETE!",style: TextStyle(color: Colors.black),),
        color: Colors.red,
        onPressed: (){
          deleteData();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context)=> Home(),
            )
          );
        },
      ),
      RaisedButton(
        child: Text("CANCEL",style: TextStyle(color: Colors.black),),
        color: Colors.green,
        onPressed: ()=> Navigator.pop(context),
      ),
    ],
  );

  showDialog(context: context, child: alertDialog );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text("${widget.list[widget.index]['descripcion']}")),
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Barcode :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  subtitle: Text(
                    "${widget.list[widget.index]['barcode']}",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Description :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  subtitle: Text(
                    "${widget.list[widget.index]['descripcion']}",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Cost :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  subtitle: Text(
                    "${widget.list[widget.index]['costo']}",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Price :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  subtitle: Text(
                    "${widget.list[widget.index]['price']}",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Rack :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  subtitle: Text(
                    "${widget.list[widget.index]['puesto']}",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Picture URL :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  subtitle: Text(
                    "${widget.list[widget.index]['imagen']}",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Package :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  subtitle: Text(
                    "${widget.list[widget.index]['paqueto']}",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Parent Barcode :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  subtitle: Text(
                    "${widget.list[widget.index]['parentBarcode']}",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("EDIT"),
                      color: Colors.green,
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => EditData(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    RaisedButton(
                      child: Text("DELETE"),
                      color: Colors.red,
                      onPressed: ()=>confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
