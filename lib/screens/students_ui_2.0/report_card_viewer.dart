import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReportCardViewer extends StatelessWidget {
  final String fileUrl;
  ReportCardViewer({required  this.fileUrl});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('PDF Viewer')),
        body: PdfViewerPage(
          pdfUrl: fileUrl,
        ),
      );
  }
}

class PdfViewerPage extends StatelessWidget {
  final String pdfUrl;

  const PdfViewerPage({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.network(
        pdfUrl,
        initialScrollOffset: Offset(100, 10),
      ),
    );
  }
}
