import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/Helpers/page_navigation.dart';
import 'package:smiletracker/views/home/reminder_screen.dart';
import 'package:smiletracker/views/profile/profile_screen.dart';

class EmojiRatingApp extends StatefulWidget {
  const EmojiRatingApp({super.key});

  @override
  _EmojiRatingAppState createState() => _EmojiRatingAppState();
}

class _EmojiRatingAppState extends State<EmojiRatingApp> {
  double _rating = 2.5;
  String _selectedDate = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: AppColors.primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(5090),
    );
    if (d != null) {
      setState(() {
        _selectedDate = DateFormat('EEEE , d MMMM,y').format(d);
      });
    }
  }

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
        body: Container(
          height: 100.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assest/images/Background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate.isEmpty
                            ? DateFormat('EEEE , d MMMM,y')
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: Image.asset(
                                  "assest/images/calenderIcon.png",
                                  height: 16,
                                  width: 17,
                                )),
                            InkWell(
                              onTap: () {
                                PageTransition.pageNavigation(
                                    page: const ProfileScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Image.asset(
                                  "assest/images/profileImage.png",
                                  height: 27,
                                  width: 27,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "How Are you Feeling today?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomPaint(
                  painter: EmojiPainter(_rating),
                  size: Size(300, 300),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  _rating.toStringAsFixed(2) == "0.00"
                      ? "Sad"
                      : _rating.toStringAsFixed(2) == "5.00"
                          ? "Happy"
                          : "Normal",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
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
                InkWell(
                    onTap: () {
                      PageTransition.pageNavigation(
                          page: const ReminderScreen());
                    },
                    child: Container(
                        height: 10.h,
                        width: 20.w,
                        child: Image.asset("assest/images/moveAhead.png"))),
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

  Color getColorForRating(double rating) {
    if (rating > 2.6) {
      return Color(0xff2F00FF);
    } else if (rating == 0.0) {
      return AppColors.primaryColor;
    } else if (rating < 2.4) {
      return Colors.orange;
    } else if (rating < 2.6 && rating > 2.4) {
      return Colors.yellow;
    } else {
      return Color(0x2F00FF);
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
      ..color = getColorForRating(rating)
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
      ..color = getColorForRating(rating)
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
      ..color = getColorForRating(rating)
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
