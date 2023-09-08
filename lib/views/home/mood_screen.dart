import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/custom_widgets.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/Helpers/page_navigation.dart';
import 'package:smiletracker/Helpers/time_date_functions.dart';
import 'package:smiletracker/views/home/smily_face.dart';

class MoodsScreen extends StatefulWidget {
  final note;
  final rating;
  final DateTime date;

  MoodsScreen({Key? key, this.rating = 0.0, this.note = '', required this.date})
      : super(key: key);

  @override
  _MoodsScreenState createState() => _MoodsScreenState();
}

class _MoodsScreenState extends State<MoodsScreen> {
  List<Event> moods = [];
  bool isLoading = false;

  addMoods() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(userData.userID)
        .collection("myMoods")
        .get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i].data() as Map;
      print(TimeDateFunctions.dateInDigits(a['date']));
      DateTime date = TimeDateFunctions.dateInDigits(a['date']);
      setState(() {
        moods.add(
          Event(
            child: DelayedDisplay(
              delay: const Duration(milliseconds: 150),
              slidingBeginOffset: const Offset(0, 1),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            a['rating'] > 2.4 ? "Feeling Happy" : "Feeling Sad",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Image.asset(a['rating'] > 2.4
                              ? "assest/images/happyIcon.png"
                              : "assest/images/happyIcon.png"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(a["note"]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            DateFormat('EEEE , d MMMM').format(date).toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            dateTime: CalendarDateTime(
              year: date.year,
              month: date.month,
              day: date.day,
              calendarType: CalendarType.GREGORIAN,
            ),
          ),
        );
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addMoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: 100.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assest/images/Background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                    left: 18.0,
                    right: 18.0,
                  ),
                  child: Column(
                    children: [
                      CustomAppBar(
                        pageTitle: "My moods",
                        onTap: () {
                          Get.back();
                        },
                        leadingButton: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "My Moods",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              PageTransition.pageNavigation(
                                  page: const EmojiRatingApp());
                            },
                            child: Image.asset(
                              "assest/images/addEvent.png",
                              height: 20,
                              width: 20,
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 85.h,
                        child: SingleChildScrollView(
                          child: Theme(
                            data: ThemeData(
                              cardTheme: const CardTheme(
                                color: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                              ),
                            ),
                            child: EventCalendar(
                                calendarType: CalendarType.GREGORIAN,
                                calendarLanguage: 'en',
                                showEvents: true,
                                dayOptions: DayOptions(
                                    selectedBackgroundColor:
                                        AppColors.primaryColor),
                                calendarOptions: CalendarOptions(
                                    viewType: ViewType.DAILY, font: 'Poppins'),
                                headerOptions: HeaderOptions(
                                    monthStringType: MonthStringTypes.FULL,
                                    weekDayStringType:
                                        WeekDayStringTypes.SHORT),
                                eventOptions: EventOptions(
                                    emptyIconColor: AppColors.primaryColor,
                                    emptyIcon: Icons.hourglass_empty_sharp,
                                    emptyTextColor: AppColors.primaryColor,
                                    emptyText: "No Data"),
                                events: moods),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }
}
