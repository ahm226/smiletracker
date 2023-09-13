import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/helpers/globalvariables.dart';

class EmojiRatingApp extends StatefulWidget {
  const EmojiRatingApp({super.key});

  @override
  _EmojiRatingAppState createState() => _EmojiRatingAppState();
}

class _EmojiRatingAppState extends State<EmojiRatingApp> {
  double _rating = 2.5;
  String _selectedDate = '';

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
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 18.0, right: 18.0, top: 18.0, bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hey, " + userData.displayName,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      _selectedDate.isEmpty
                          ? DateFormat('EEEE, d MMM,y')
                              .format(DateTime.now())
                              .toString()
                          : _selectedDate,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: Colors.grey.shade700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  "How Are you Feeling today?",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: CustomPaint(
                    painter: EmojiPainter(_rating),
                    size: const Size(300, 300),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: Text(
                    _rating.toStringAsFixed(2) == "0.00"
                        ? "Sad"
                        : _rating.toStringAsFixed(2) == "5.00"
                            ? "Happy"
                            : "Normal",
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
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
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmojiPainter extends CustomPainter {
  final double rating;

  EmojiPainter(this.rating);

  getColorForRating(double rating, faceCenter, radius) {
    if (rating > 2.6) {
      return const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF2F00FF), // Start color (#2F00FF)
          Color(0xFF4895FF), // End color (#4895FF)
        ],
      ).createShader(Rect.fromCircle(center: faceCenter, radius: radius));
    } else if (rating == 0.0) {
      return const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFFFF0000), // Start color (#FF0000)
          Color(0xFFFF8A00),
        ],
      ).createShader(Rect.fromCircle(center: faceCenter, radius: radius));
    } else if (rating < 2.4) {
      return const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFFFF0000), // Start color (#FF0000)
          Color(0xFFFF8A00),
        ],
      ).createShader(Rect.fromCircle(center: faceCenter, radius: radius));
    } else if (rating < 2.6 && rating > 2.4) {
      return const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFFFDE030), // Start color (#FDE030)
          Color(0xFFEBFF00), // End color (#EBFF00)
        ],
      ).createShader(Rect.fromCircle(center: faceCenter, radius: radius));
    } else {
      return const Color(0x2F00FF);
    }
  }

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
      ..shader = getColorForRating(rating, faceCenter, radius)
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
      ..shader = getColorForRating(rating, faceCenter, radius)
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
      ..shader = getColorForRating(rating, faceCenter, radius)
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
