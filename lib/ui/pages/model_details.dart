import 'package:copy_cat/models/db_manager.dart';
import 'package:copy_cat/ui/pages/canvas_elements/canvas_model.dart';
import 'package:copy_cat/ui/pages/impact_gap_canvas/igc_details/challenge_mapping_details.dart' as challengeDetail;
import 'package:copy_cat/ui/pages/impact_gap_canvas/igc_details/solutions_mapping.dart' as solutionsDetails;
import 'package:copy_cat/ui/pages/view_post.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';



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
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Pages()));
            },
            icon: Icon(Icons.blur_on),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Uidata.btnColor,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasModelR(widget.modelId)));
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
                    cardView("Customer Segments", Icon(Icons.bluetooth_searching)),
                    cardView("Value Propositions", Icon(Icons.view_array)),
                    cardView("Channels", Icon(Icons.view_array)),
                  ]
                ),
                TableRow(
                    children: [
                      cardView("Customer Relationships", Icon(Icons.view_array)),
                      cardView("Revenue Streams", Icon(Icons.view_array)),
                      cardView("Key Resources", Icon(Icons.view_array)),
                    ]
                ),
                TableRow(
                    children: [
                      cardView("Key Activities", Icon(Icons.view_array)),
                      cardView("Key Partners", Icon(Icons.view_array)),
                      cardView("Cost Structure", Icon(Icons.view_array)),
                    ]
                ),
              ],
            ),
          ),
      ),
    );
  }

Widget cardView(String cardName, Icon icon){
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
              child: icon,
            ),

                Text("$cardName", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
            
          ],
        ),
      ),
    ),
  );
}

}



class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> with SingleTickerProviderStateMixin {

  TabController inAppTabController;


   @override
  void initState(){
    super.initState();
    inAppTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    inAppTabController.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
        SpeedDialChild(
          child: Icon(Icons.note_add),
          label: "Challenge Mapping",
          onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => challengeDetail.ChallengeDetails( challengeDetail.NoteMode.Adding, null)));
          }
        ),
        SpeedDialChild(
          child: Icon(Icons.note_add),
          label: "Impact gaps",
          onTap: (){
                    //    Navigator.push(context, MaterialPageRoute(builder: (context) => swotDetail.SwotDetails(swotDetail.NoteMode.Adding, null)));
          },
        ),
          SpeedDialChild(
          child: Icon(Icons.note_add),
          label: "Solutions mapping",
          onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => solutionsDetails.SolutionsDetails( solutionsDetails.NoteMode.Adding, null)));
          },
        ),
        ]
      ),
      appBar: AppBar(
        title: Text(""),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
              onPressed: () {

              }
          )],
        bottom: 
        TabBar(
          controller: inAppTabController,
          tabs: <Widget>[
            Tab(
//              icon: Icon(Icons.pages),
              child: Text("Challenge Mapping"),
            ),
            Tab(
//              icon: Icon(Icons.business),
              child: Text("Impact Gaps"),
            ),
            Tab(
//              icon: Icon(Icons.business),
              child: Text("Solutions Mapping"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: inAppTabController,
        children: <Widget>[
          Challenges(),
          ImpactGap(),
          Solutions()
        ],
      ),
    );
  }
}



class ImpactGap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
            child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("Q: What is missing that could close the gap between the challenge and the current solutions, where are opportunities for greater collective impact and what are the key lessons learned?"),),
          ),
          Divider(
            color: Colors.black,
          ),
          Text("Guiding Questions", style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontSize: 23.0),),

        ],),)
      );
  }
}

class Challenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
       future: DBManagerChallenge.getList(),
        builder: (context, snapshot) {
          final notes = snapshot.data;
          
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                String modelTitle = notes[index]['challengeTitle'];
                
                return Padding(
                      padding: const EdgeInsets.all(10),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                     ModelTitle(notes[index]['challengeTitle']),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      ModelDescription(notes[index]['challengeDescription']),
                                      // Text(description)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("Edit Challenge", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ModelDetails(modelTitle, notes[index]['id'])));
                                      },
                                    ),
                                    IconButton(
                                       icon: Icon(Icons.delete),
                                       onPressed: (){
                                         DBManagerModel.deleteModel(notes[index]['id']);
                                     },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    )
   
                );
              },
              itemCount: notes == null? 0 : notes.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );

   






  }

}



class ModelTitle extends StatelessWidget {
  final String _title;

  ModelTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class ModelDescription extends StatelessWidget {
  String description;

  ModelDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Text(description, style: TextStyle(color: Colors.grey.shade600), maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class Solutions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
       future: DBManagerChallenge.getList(),
        builder: (context, snapshot) {
          final notes = snapshot.data;
          
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                String modelTitle = notes[index]['solutionsTitle'];
                
                return Padding(
                      padding: const EdgeInsets.all(10),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                     ModelTitle(notes[index]['solutionsTitle']),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("Edit solution", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ModelDetails(modelTitle, notes[index]['id'])));
                                      },
                                    ),
                                    IconButton(
                                       icon: Icon(Icons.delete),
                                       onPressed: (){
                                         DBManagerSolutions.deleteSolutions(notes[index]['id']);
                                     },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    )
   
                );
              },
              itemCount: notes == null? 0 : notes.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}



