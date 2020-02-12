import 'package:copy_cat/models/db_manager.dart';
import 'package:copy_cat/ui/pages/canvas_elements/canvas_model.dart';
import 'package:copy_cat/ui/pages/guiding.dart';
import 'package:copy_cat/ui/pages/impact_gap_canvas/igc_details/challenge_mapping_details.dart' as challengeDetail;
import 'package:copy_cat/ui/pages/impact_gap_canvas/igc_details/solutions_mapping.dart' as solutionsDetails;
import 'package:copy_cat/ui/pages/view_post.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
        title: Text("IGC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Guiding()));
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
              child: Text("solutions mapping"),
            ),
            Tab(
//              icon: Icon(Icons.business),
              child: Text("impact gaps"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: inAppTabController,
        children: <Widget>[
          Challenges(),
         Solutions() ,
         ImpactGap()
          
        ],
      ),
    );
  }
}



class ImpactGap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("What is missing that could close the gap between the challenge and the current solutions, where are opportunities for greater collective impact, and what are the key lesons learned?"),),
          ),
          Divider(
              color:  Colors.black,
            ),
            ListTile(
              leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){
             return Alert(
              context: context,
              title: 'guiding question',
              desc:'Who or what is not being served and what is missing to bridge that gap? What actions can be taken to fill those gaps?',
              buttons: [
                DialogButton(
                child: Text('Got it'),
                onPressed: (){
                                    Navigator.pop(context);

                },)
              ]).show();
          },
        ),
              title: Text('Where are the gaps between the challenge and solutions?'),
              subtitle: Text('guiding questions'),
            ),
            Divider(
              color:  Colors.black,
            ),
            ListTile(
              leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){
           return Alert(
              context: context,
              title: 'guiding question',
              desc:'What is missing(specific regulations, knowledge sharing, new efforts,partnership etc)that would further link up the solutions and achieve greater collective impact?',
              buttons: [
                DialogButton(
                child: Text('Got it'),
                onPressed: (){
                                    Navigator.pop(context);

                },)
              ]).show();
          },
        ),
              title: Text('What are the gaps within the solutions?'),
              subtitle: Text('guiding questions')
            ),Divider(
              color:  Colors.black,
            ),
            ListTile(
              leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){
            return Alert(
              context: context,
              title: 'guiding question',
              desc:'What is being overlooked and what are the unintended negative consequences of the existing efforts? What specific key opportunities could unlock future impact?',
              buttons: [
                DialogButton(
                child: Text('Got it'),
                onPressed: (){
                                    Navigator.pop(context);

                },)
              ]).show();
          },
        ),
              title: Text('Where are the unaddressed obstacles?'),
              subtitle: Text('guiding questions')
            ),
            Divider(
              color:  Colors.black,
            ),
            ListTile(
              leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){
            return Alert(
              context: context,
              title: 'guiding question',
              desc:'From yout research and interviews, what key lessons could you share with anyone who wants to impact change in this sector? What are the biggest opportunities for impact?',
              buttons: [
                DialogButton(
                child: Text('Got it'),
                onPressed: (){
                                    Navigator.pop(context);

                },)
              ]).show();
          },
        ),
              title: Text('What are the key lessons learned?'),
              subtitle: Text('guiding questions')
            ),
            Divider(
              color:  Colors.black,
            ),
            Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("Hints: Tap on the information icon for a guiding question. "),),
          ),
          Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("Hints: tap on the tile to add or edit your answer"),),
          ),
          ],
         ),
       ),
      );
  }
}

class Challenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("What is happening, what is the impact of the challenge, and what is holding the challenge in place"),),
          ),
            ListTile(
              leading:  IconButton(
          icon: Icon(Icons.info),
          onPressed: (){return Alert(
              context: context,
              title: 'guiding question',
              desc:'How do those impacted by the challenge describe the challenge? How do they describe the effects?How is this challenge related to other challenges?',
              buttons: [
                DialogButton(
                child: Text('Got it'),
                onPressed: (){
                                    Navigator.pop(context);

                },)
              ]).show();
              },
              ),
              title: Text('How do you describe the challenge?'),
              subtitle: Text('guiding questions'),
            ),
            Divider(
              color:  Colors.black,
            ),
            ListTile(
              leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){return Alert(
              context: context,
              title: 'guiding question',
              desc:'What are the numbers? Who or what is impacted(where, how many, in what way?)What does the research say?',
              buttons: [
                DialogButton(
                child: Text('Got it'),
                onPressed: (){
                                    Navigator.pop(context);

                },)
              ]).show();
              },
              ),
              title: Text('What is the impact of the challenge?'),
              subtitle: Text('guiding questions')
            ),Divider(
              color:  Colors.black,
            ),
            ListTile(
              leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){return Alert(
              context: context,
              title: 'guiding question',
              desc:'What is causing the challenge to persist? Who stands to benefit from the challenge continuing to persist?',
              buttons: [
                DialogButton(
                child: Text('Got it'),
                onPressed: (){
                                    Navigator.pop(context);

                },)
              ]).show();
              },
              ),
              title: Text('What is the cause of the cahllenge?'),
              subtitle: Text('guiding questions')
            ),
            Divider(
              color:  Colors.black,
            ),
            ListTile(
              leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){return Alert(
              context: context,
              title: 'guiding question',
              desc:'How has the challenge changed over time? What is the projected scope of the challenge in the future?',
              buttons: [
                DialogButton(
                child: Text('Got it'),
                onPressed: (){
                                    Navigator.pop(context);

                },)
              ]).show();
              },
              ),
              title: Text('What is the history and future of the challenge?'),
              subtitle: Text('guiding questions')
            ),
            Divider(
              color:  Colors.black,
            ),
            Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("Hints: Tap on the information icon for a guiding question. "),),
          ),
          Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("Hints: tap on the tile to add or edit your answer"),),
          ),
          ],
         ),
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("What models  are already being tried, what is working and what is not, and what resources are available?"),),
          ),
            ListTile(
              leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){return Alert(
              context: context,
              title: 'guiding question',
              desc:'What resources are available that can be drawn upon? What efforts are already being tried which could directly impact the callenge? what are the different models? How are they joined up, or not?',
              buttons: [
                DialogButton(
                child: Text('Got it'),
                onPressed: (){
                                    Navigator.pop(context);

                },)
              ]).show();
              },
              ),
              title: Text('What is happening locally?'),
              subtitle: Text('guiding questions'),
              onTap: (){
                
              },
            ),
            Divider(
              color:  Colors.black,
            ),
            ListTile(
              leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){return Alert(
              context: context,
              title: 'guiding question',
              desc:'What has been tried on similar or tangential challenges globally? What lessons can be learned from those efforts? How can those lessons be shared?',
              buttons: [
                DialogButton(
                child: Text('Got it'),
                onPressed: (){
                                    Navigator.pop(context);

                },)
              ]).show();
              },
              ),
              title: Text('What is happening globally?'),
              subtitle: Text('guiding questions')
            ),Divider(
              color:  Colors.black,
            ),
            ListTile(
              leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){return Alert(
              context: context,
              title: 'guiding question',
              desc:'What can be learned from the successes and failures of these efforts? What do those involved attribute to the cause of their results?',
              buttons: [
                DialogButton(
                child: Text('Got it'),
                onPressed: (){
                                    Navigator.pop(context);

                },)
              ]).show();
              },
              ),
              title: Text('What is working, what is not?'),
              subtitle: Text('guiding questions')
            ),
            Divider(
              color:  Colors.black,
            ),
            ListTile(
              leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){return Alert(
              context: context,
              title: 'guiding question',
              desc:'What parts of the challenge are focused on and what are ignored(specific populations, areas, etc)? What is on the horizon that might impact collective solutions? What fututre scenarios might play out?',
              buttons: [
                DialogButton(
                child: Text('Got it'),
                onPressed: (){
                  Navigator.pop(context);
                },)
              ]).show();
              },
              ),
              title: Text('Where is the focus and the future?'),
              subtitle: Text('guiding questions')
            ),
            Divider(
              color:  Colors.black,
            ),
            Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("Hints: Tap on the information icon for a guiding question. "),),
          ),
          Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("Hints: tap on the tile to add or edit your answer"),),
          ),
          ],
         ),
       ),
      );
  }
}



