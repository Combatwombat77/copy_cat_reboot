import 'package:flutter/material.dart';


class CanvasModelR extends StatefulWidget {
  @override
  _CanvasModelRState createState() => _CanvasModelRState();
}

class _CanvasModelRState extends State<CanvasModelR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
      ),
      body: Container(
        child: Center(
          child:Card(
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[

                  ],), 
                  Card(
                    child: Table(
                      border: TableBorder.all(),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}