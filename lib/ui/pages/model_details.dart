import 'package:copy_cat/models/db_manager.dart';
import 'package:copy_cat/ui/pages/view_post.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';


class ModelDetails extends StatefulWidget {
  final int modelId;
  final String modelTitle;

  ModelDetails(this.modelTitle, this.modelId);

  @override
  _ModelDetailsState createState() => _ModelDetailsState();
}

class _ModelDetailsState extends State<ModelDetails> {
//  double height = MediaQuery.of(context).size.height;



@override 
void initState(){
  super.initState();
  DBManagerViews.openDB();
}

var items = [
  "Customer Segments",
  "Value Propositions",
  "Channels",
  "Customer Relationships",
  "Revenue Stream",
  "Key Resources",
  "Key Activities",
  "Key Partners",
  "Cost Structure"
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.modelTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {

            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Uidata.btnColor,
        onPressed: (){

        },
        child: Icon(Icons.exit_to_app),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
//            defaultColumnWidth: FractionColumnWidth(0.32),
              children: [
                TableRow(
                  children: [
                    cardView("Customer Segments"),
                    cardView("Value Propositions"),
                    cardView("Channels"),
                  ]
                ),
                TableRow(
                    children: [
                      cardView("Customer Relationships"),
                      cardView("Revenue Streams"),
                      cardView("Key Resources"),
                    ]
                ),
                TableRow(
                    children: [
                      cardView("Key Activities"),
                      cardView("Key Partners"),
                      cardView("Cost Structure"),
                    ]
                ),
              ],
            ),
          ),
      ),
    );
  }

Widget cardView(String cardName){
  return Card(
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPost(cardName, widget.modelId)));
      },
      child: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.accessibility),
            ),
//              Image(
//                image: ,
//              ),
                Text("$cardName", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
            
          ],
        ),
      ),
    ),
  );
}

}







