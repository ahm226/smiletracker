import 'package:flutter/material.dart';
import 'package:smiletracker/Helpers/page_navigation.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomButton extends StatefulWidget {
  final String buttonText;
  final Function onTap;
  final double? height;
  final double? width;

  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.onTap,
      this.height = 58.0,
      this.width = 100.0})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ZoomTapAnimation(
        onTap: () {
          widget.onTap();
        },
        onLongTap: () {},
        enableLongTapRepeatEvent: false,
        longTapRepeatDuration: const Duration(milliseconds: 100),
        begin: 1.0,
        end: 0.93,
        beginDuration: const Duration(milliseconds: 20),
        endDuration: const Duration(milliseconds: 120),
        beginCurve: Curves.decelerate,
        endCurve: Curves.fastOutSlowIn,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(
                  "assest/images/btnRectangle.png",
                ),
                fit: BoxFit.cover,
              ),
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     Color(0xFFFF0000), // Start color
              //     Color(0xFFFF8700), // End color
              //   ],
              //   stops: [0.0, 1.0], // Color stops
              //   transform: GradientRotation(
              //       268.5 * 3.1415926535 / 180), // Angle in radians
              // ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  widget.buttonText.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  final String pageTitle;
  final Function onTap;
  final Widget? leadingButton;

  const CustomAppBar(
      {Key? key,
      required this.pageTitle,
      required this.onTap,
      this.leadingButton})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ZoomTapAnimation(
            onTap: () {
              widget.onTap();
            },
            onLongTap: () {},
            enableLongTapRepeatEvent: false,
            longTapRepeatDuration: const Duration(milliseconds: 100),
            begin: 1.0,
            end: 0.93,
            beginDuration: const Duration(milliseconds: 20),
            endDuration: const Duration(milliseconds: 120),
            beginCurve: Curves.decelerate,
            endCurve: Curves.fastOutSlowIn,
            child: Container(
                height: 31,
                width: 31,
                // decoration: BoxDecoration(
                //     color: AppColors.primaryColor,
                //     borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  "assest/images/backSquare.png",
                  height: 31,
                  width: 31,
                )),
          ),
          Text(
            widget.pageTitle,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
              color: Colors.black,
              fontSize: 22,
            ),
          ),
          SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }
}

successPopUp(BuildContext context, page, message) {
  // set up the AlertDialog
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 0,
            contentPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            // title: Text("Notice"),
            // content: Text("Launching this missile will destroy the entire universe. Is this what you intended to do?"),
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assest/images/success.png",
                              height: 170,
                              width: 150,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Text(
                                message.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 1.4,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              buttonText: 'Done',
                              onTap: () {
                                Navigator.pop(context);
                                PageTransition.pageProperNavigation(page: page);
                              },
                              width: 170,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ],
          );
        });
      });
}

errorPopUp(BuildContext context, String message) {
  // set up the AlertDialog
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 0,
            contentPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            // title: Text("Notice"),
            // content: Text("Launching this missile will destroy the entire universe. Is this what you intended to do?"),
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assest/images/error.png",
                              height: 170,
                              width: 150,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Text(
                                message.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 1.4,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              buttonText: 'Done',
                              onTap: () {
                                Navigator.pop(context);
                                // PageTransition.pageNavigation(page: page);
                              },
                              width: 170,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ],
          );
        });
      });
}
