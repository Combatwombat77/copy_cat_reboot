import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
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

class MyPdfHomePage1 extends StatelessWidget {

  Future<PdfImage> pdfImageFromImage(
    {@required PdfDocument pdf, @required ui.Image image}) async {
  final ByteData bytes =
      await image.toByteData(format: ui.ImageByteFormat.rawRgba);

  return PdfImage(pdf,
      image: bytes.buffer.asUint8List(),
      width: image.width,
      height: image.height);
}

  Future<PdfImage> pdfImageFromImageProvider(
    {@required PdfDocument pdf,
    @required ImageProvider image,
    ImageConfiguration configuration,
    ImageErrorListener onError}) async {
  final Completer<PdfImage> completer = Completer<PdfImage>();
  final ImageStream stream =
      image.resolve(configuration ?? ImageConfiguration.empty);

  ImageStreamListener listener;
  listener = ImageStreamListener((ImageInfo image, bool sync) async {
    final PdfImage result =
        await pdfImageFromImage(pdf: pdf, image: image.image);
    if (!completer.isCompleted) {
      completer.complete(result);
    }
    stream.removeListener(listener);
  }, onError: (dynamic exception, StackTrace stackTrace) {
    if (!completer.isCompleted) {
      completer.complete(null);
    }
    if (onError != null) {
      onError(exception, stackTrace);
      print('this is the error you are looking for.');
    } else {
      // https://groups.google.com/forum/#!topic/flutter-announce/hp1RNIgej38
      assert(false, 'image failed to load');
    }
  });

  stream.addListener(listener);
  return completer.future;
}

  final pdf = pw.Document();

  writeOnPdf() async {

    final PdfImage assetImage = await pdfImageFromImageProvider(
    pdf: pdf.document, 
    image: const AssetImage('assets/icon/icon.jpg'),
    );

    pdf.addPage(
      pw.Page(
        build: (pw.Context context){
          return pw.Center(
              child:pw.Image(assetImage),
          );
        }));
  }

  Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");

    file.writeAsBytesSync(pdf.save());
  }

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("PDF Test"),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("PDF TUTORIAL", style: TextStyle(fontSize: 34),)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          writeOnPdf();
          await savePdf();

          Directory documentDirectory = await getApplicationDocumentsDirectory();

          String documentPath = documentDirectory.path;

          String fullPath = "$documentPath/example.pdf";

          Navigator.push(context, MaterialPageRoute(
            builder: (context) => PdfPreviewScreen(path: fullPath,)
          ));

        },
        child: Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}