import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

class EmojiRatingApp extends StatefulWidget {
  const EmojiRatingApp({super.key});

  @override
  _EmojiRatingAppState createState() => _EmojiRatingAppState();
}

class _EmojiRatingAppState extends State<EmojiRatingApp> {
  double _rating = 2.5;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          double delta = details.delta.dy;
          _rating = (_rating + delta / 20.0).clamp(0.0, 5.0);
          // _rating = double.parse(_rating.toStringAsFixed(3));
          // Adjust rating based on delta
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Emoji Rating App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomPaint(
                painter: EmojiPainter(_rating),
                size: const Size(300, 300),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Center(
                    child: RatingBar.builder(
                      initialRating: _rating,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        if (kDebugMode) {
                          print(rating);
                        }
                      },
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 40,
                    color: Colors.transparent,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              // Text(_rating.toStringAsFixed(2))
            ],
          ),
        ),
      ),
    );
  }
}

class EmojiPainter extends CustomPainter {
  final double rating;

  EmojiPainter(this.rating);

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    final double mouthStartX = centerX - radius * 0.7;
    final double mouthEndX = centerX + radius * 0.7;

    final double mouthY = centerY + radius * 0.4;

    //eye related variables

    final Offset faceCenter = Offset(centerX, centerY);

    final Paint facePaint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    canvas.drawCircle(faceCenter, radius, facePaint);

    final double eyeRadius = radius * 0.15;
    final Offset leftEyeCenter =
        faceCenter.translate(-radius * 0.3, -radius * 0.3);
    final Offset rightEyeCenter =
        faceCenter.translate(radius * 0.3, -radius * 0.3);

    const double eyeBorderWidth = 5.0;
    final Paint eyeBorderPaint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = eyeBorderWidth;

    final double eyeOffsetX = eyeRadius * 0.6;
    final double leftEyeX = leftEyeCenter.dx - eyeOffsetX;
    final double rightEyeX = rightEyeCenter.dx + eyeOffsetX;

    // Calculate the specific angle for mouth control point based on rating
    double eyeY = 105.0;
    double mouthControlY;
    if (rating > 2.6) {
      final double maxMouthControlY = centerY + radius * 0.4;
      final double minMouthControlY = centerY + radius * 0.9;
      mouthControlY = maxMouthControlY -
          (maxMouthControlY - minMouthControlY) * (rating / 5.0);
      print("mouthControlY");
      print(mouthControlY);
      // Calculate the vertical position of the eyes based on the rating
      final double maxEyeY = leftEyeCenter.dy + eyeRadius * 0.5;
      final double minEyeY = centerY - radius * 0.6;
      eyeY = maxEyeY - (maxEyeY - minEyeY) * (rating / 5.0);
    } else if (rating == 0.0) {
      final double maxMouthControlY = centerY + radius * 0.4;
      final double minMouthControlY = centerY + radius * 0.8;
      mouthControlY = 148;
      // Calculate the vertical position of the eyes based on the rating
      final double maxEyeY = leftEyeCenter.dy + eyeRadius * 0.5;
      final double minEyeY = centerY + radius * 0.8;
      eyeY = 135.0;
    } else if (rating < 2.4) {
      final double maxMouthControlY = centerY + radius * 0.4;
      final double minMouthControlY = centerY - radius * 0.01;
      mouthControlY = maxMouthControlY -
          (maxMouthControlY - minMouthControlY) * (1 - rating / 5.0);
      // Calculate the vertical position of the eyes based on the rating
      final double maxEyeY = leftEyeCenter.dy + eyeRadius * 0.5;
      final double minEyeY = centerY - radius * 0.1;
      eyeY = maxEyeY - (maxEyeY - minEyeY) * (1 - rating / 5.0);
    } else if (rating < 2.6 && rating > 2.4) {
      final double maxMouthControlY = centerY + radius * 0.4;
      final double minMouthControlY = centerY - radius * 0.3;
      mouthControlY = 210.0;
      // Calculate the vertical position of the eyes based on the rating
      final double maxEyeY = leftEyeCenter.dy + eyeRadius * 0.5;
      final double minEyeY = centerY + radius * 0.8;
      eyeY = 105.0;
    } else {
      final double maxMouthControlY = centerY + radius * 0.4;
      final double minMouthControlY = centerY - radius * 0.3;
      mouthControlY = 210.0;

      // Calculate the vertical position of the eyes based on the rating
      final double maxEyeY = leftEyeCenter.dy + eyeRadius * 0.5;
      final double minEyeY = centerY + radius * 0.8;
      eyeY = 105.0;
    }

// Draw the eyes with a moveTo and quadraticBezierTo for the movement effect
    final Path leftEyePath = Path()
      ..moveTo(leftEyeX, leftEyeCenter.dy)
      ..quadraticBezierTo(leftEyeCenter.dx, eyeY, leftEyeCenter.dx + eyeOffsetX,
          leftEyeCenter.dy);
    final Path rightEyePath = Path()
      ..moveTo(rightEyeX, rightEyeCenter.dy)
      ..quadraticBezierTo(rightEyeCenter.dx, eyeY,
          rightEyeCenter.dx - eyeOffsetX, rightEyeCenter.dy);

    canvas.drawPath(leftEyePath, eyeBorderPaint);
    canvas.drawPath(rightEyePath, eyeBorderPaint);

    final Paint mouthPaint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    final Path mouthPath = Path();
    mouthPath.moveTo(mouthStartX, mouthY);
    mouthPath.quadraticBezierTo(centerX, mouthControlY, mouthEndX, mouthY);

    canvas.drawPath(mouthPath, mouthPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
