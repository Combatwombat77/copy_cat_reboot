import 'dart:async';
import 'dart:io';
import 'package:copy_cat/ui/utils/pick_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class PdfPreviewScreen extends StatelessWidget {
  final String path;

  PdfPreviewScreen({this.path});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: path,
    );
  }
}

class MyPdfHomePage extends StatefulWidget {
  @override
  _MyPdfHomePageState createState() => _MyPdfHomePageState();
}

class _MyPdfHomePageState extends State<MyPdfHomePage> {
  final _formkey = GlobalKey<FormState>();
   File _image;
   List images = [];
   Future<File> imgFile;
   Image image;

   Future getImage() async {
    var image = await ImagePickerSaver.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      images.add(image);
    });
    print(images.toString());
  }

    


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Generator"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Colors.black,
              Colors.blue
            ])
          ),
        ),
        actions: <Widget>[
          IconButton(icon:Icon( Icons.save),
          onPressed:  (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Image2PDF(images: images,)));
          }
      )
      ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.blue, Colors.black])),
          ),

          Container(
       
        child: _image == null
            ? new Text('No images selected.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),)
            : ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index){
                // Image.file(_image)
                return Image.file(images[index]);
              },
            )
      ),         
          ],
        ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo,
        color: Colors.black,),
      ),
    );
  }
}