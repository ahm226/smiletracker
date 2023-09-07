import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/custom_widgets.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/Helpers/page_navigation.dart';
import 'package:smiletracker/views/home/mood_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ReminderScreen extends StatefulWidget {
  final rating;

  const ReminderScreen({Key? key, required this.rating}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final TextEditingController noteController = TextEditingController();
  final GlobalKey<FormState> noteForm = GlobalKey();
  DateTime date = DateTime.now();
  String _selectedDate = DateFormat.yMMMMd("en_US").format(DateTime.now());
  String _selectedTime = DateFormat('h:mma').format(DateTime.now());

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
      firstDate: DateTime(1880),
      lastDate: DateTime.now(),
    );
    if (d != null) {
      setState(() {
        _selectedDate = DateFormat.yMMMMd("en_US").format(d);
        date = d;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            // Use ThemeData.dark() for a black theme
            primaryColor: Colors.black,
            hintColor: Colors.white,
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.primaryColor,
              surface: Colors.white,
              onSurface: AppColors.primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: AppColors.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        _selectedTime =
            selectedTime.format(context); // Format the selected time
      });
    }
  }

  reminderSuccess(BuildContext context) {
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
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
                                "assest/images/happyface.png",
                                height: 170,
                                width: 150,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(left: 15.0, right: 15.0),
                                child: Text(
                                  'It is very good to see you very happy!',
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
                                  PageTransition.pageBackNavigation(
                                      page: MoodsScreen(
                                    note: noteController.text,
                                    rating: widget.rating,
                                    date: date,
                                  ));
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

  reminderFail(BuildContext context) {
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

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
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
                                "assest/images/sadface.png",
                                height: 170,
                                width: 150,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(left: 15.0, right: 15.0),
                                child: Text(
                                  'It is very sad to see you unhappy!',
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
                                  PageTransition.pageBackNavigation(
                                      page: MoodsScreen(
                                    note: noteController.text,
                                    rating: widget.rating,
                                    date: date,
                                  ));
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Form(
        key: noteForm,
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
            child: Padding(
              padding: EdgeInsets.only(
                  top: 5.h, left: 15.0, right: 15.0, bottom: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      pageTitle: "Want to add note?",
                      onTap: () {
                        Get.back();
                      },
                      leadingButton: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "Date:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        height: 53,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.primaryColor.withOpacity(0.1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      "assest/images/calenderIcon.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                    tooltip: 'Select date',
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                  ),
                                  InkWell(
                                    child: Text(
                                      _selectedDate,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Image.asset(
                                  "assest/images/dropDown.png",
                                  height: 10,
                                  width: 10,
                                ),
                                tooltip: 'Select date',
                                onPressed: () {
                                  _selectDate(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "Time:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    InkWell(
                      onTap: () {
                        _selectTime(context);
                      },
                      child: Container(
                        height: 53,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.primaryColor.withOpacity(0.1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      "assest/images/clock.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                    tooltip: 'Select Time',
                                    onPressed: () {
                                      _selectTime(context);
                                    },
                                  ),
                                  InkWell(
                                    child: Text(
                                      _selectedTime,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    onTap: () {
                                      _selectTime(context);
                                    },
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Image.asset(
                                  "assest/images/dropDown.png",
                                  height: 10,
                                  width: 10,
                                ),
                                tooltip: 'Select Time',
                                onPressed: () {
                                  _selectTime(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "Explain your feeling of today:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 20.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Colors.transparent, width: 1.4)),
                      child: SingleChildScrollView(
                        child: TextFormField(
                          controller: noteController,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.none,
                          maxLines: null,
                          cursorColor: AppColors.primaryColor,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 17),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            border: InputBorder.none,
                            hintText: "How are you feeling today...",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade700, fontSize: 17),
                            prefixIconColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            await postMood();
                            if (widget.rating > 2.4) {
                              reminderSuccess(context);
                            } else {
                              reminderFail(context);
                            }
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Colors.grey.shade800,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        ZoomTapAnimation(
                          onTap: () async {
                            // if (noteForm.currentState!.validate()) {
                            //
                            // }
                            await postMood();
                            if (widget.rating > 2.4) {
                              reminderSuccess(context);
                            } else {
                              reminderFail(context);
                            }
                          },
                          onLongTap: () {},
                          enableLongTapRepeatEvent: false,
                          longTapRepeatDuration:
                              const Duration(milliseconds: 100),
                          begin: 1.0,
                          end: 0.93,
                          beginDuration: const Duration(milliseconds: 20),
                          endDuration: const Duration(milliseconds: 120),
                          beginCurve: Curves.decelerate,
                          endCurve: Curves.fastOutSlowIn,
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              width: 45.w,
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assest/images/btnRectangle.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Submit",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  postMood() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userData.userID)
        .collection("myMoods")
        .doc()
        .set({
      "note": noteController.text,
      "rating": widget.rating,
      "date": date.microsecondsSinceEpoch,
    });
  }
}
