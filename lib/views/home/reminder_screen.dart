import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/custom_widgets.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/Helpers/page_navigation.dart';
import 'package:smiletracker/views/home/mood_screen.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  String _selectedDate = 'Select date';
  String _selectedTime = 'Select time';

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
        _selectedDate = DateFormat.yMMMMd("en_US").format(d);
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
                                width: 170,
                              ),
                              Text('It is very good to seen you very happy!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                buttonText: 'Done',
                                onTap: () {
                                  Navigator.pop(context);
                                  PageTransition.pageNavigation(
                                      page: const MoodsScreen());
                                },
                                width: 190,
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
                                width: 170,
                              ),
                              Text('It is very sad to seen you unhappy!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                buttonText: 'Done',
                                onTap: () {
                                  Navigator.pop(context);
                                  PageTransition.pageNavigation(
                                      page: const MoodsScreen());
                                },
                                width: 190,
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: CustomAppBar(
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  "Date:",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 53,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade200),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: Text(_selectedDate,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black)),
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
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
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  "Time:",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 53,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade200),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: Text(_selectedTime,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black)),
                          onTap: () {
                            _selectTime(context);
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            "assest/images/calenderIcon.png",
                            height: 30,
                            width: 30,
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
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  "Explain your feeling of today:",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.transparent, width: 1.4)),
                child: Center(
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    maxLines: null,
                    cursorColor: AppColors.primaryColor,
                    style: const TextStyle(color: Colors.black, fontSize: 13),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      border: InputBorder.none,
                      hintText:
                          "Running Challenges\n\nRunning challenges are great for gym members\nbecause each member can go at his or her pace.\nSet realistic goals like\nhaving members run 30 miles within one\nmonth — how they choose to collect those\nmiles it up to them!",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                      prefixIconColor: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Skip",
              style: TextStyle(color: Colors.grey.shade700),
            ),
            SizedBox(
              width: 40.w,
            ),
            CustomButton(
              width: 40.w,
              buttonText: 'Submit',
              onTap: () {
                reminderSuccess(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
