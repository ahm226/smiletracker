import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_flip/page_flip.dart';
import 'package:smiletracker/helpers/data_helper.dart';
import 'package:smiletracker/views/home/page_info.dart';

class BookPageFlip extends StatefulWidget {
  @override
  _BookPageFlipState createState() => _BookPageFlipState();
}

class _BookPageFlipState extends State<BookPageFlip> {
  final _controller = GlobalKey<PageFlipWidgetState>();
  final DataHelper _dataController = Get.find<DataHelper>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageFlipWidget(
        key: _controller,
        backgroundColor: Colors.white,
        // lastPage: Container(
        //     color: Colors.white, child: const Center(child: Text('The End!'))),
        children: <Widget>[
          for (var i = 0; i < _dataController.moodData.length; i++)
            PageData(page: i),
        ],
      ),
    );
  }
}

class NotebookLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0;

    // Define the gap between lines and the number of lines you want on the page
    final lineGap = 20.0;
    final numberOfLines = (size.height / lineGap).ceil();

    // Draw the lines
    for (var i = 0; i < numberOfLines; i++) {
      final y = i * lineGap;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
