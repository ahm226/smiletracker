import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/datetime.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/provider/instance_provider.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/helpers/data_helper.dart';
import 'package:smiletracker/helpers/globalvariables.dart';
import 'package:smiletracker/helpers/time_date_functions.dart';

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
  final DataHelper _dataController = Get.find<DataHelper>();
  bool isLoading = false;

  // DateTime selectedDate = DateTime.now();
  late CalendarDateTime selectedDateTime;
  List<bool> show = [false];
  List<Map> moodGraph = [];

  getData() async {
    setState(() {
      isLoading = true;
    });
    TimelineCalendar.calendarProvider = createInstance();
    selectedDateTime = TimelineCalendar.calendarProvider.getDateTime();
    await _dataController.addMoods();
    for (int i = 0; i < _dataController.moodData.length; i++) {
      if ((TimeDateFunctions.dateInDigits(_dataController.moodData[i]['date'])
                  .day ==
              selectedDateTime.day &&
          TimeDateFunctions.dateInDigits(_dataController.moodData[i]['date'])
                  .month ==
              selectedDateTime.month &&
          TimeDateFunctions.dateInDigits(_dataController.moodData[i]['date'])
                  .year ==
              selectedDateTime.year)) {
        show[i] = true;
        show.add(false);
      } else {
        show[i] = false;
        show.add(false);
      }
      setState(() {});
    }
    moodGraph = await fetchWeeklyAnalyticsData(DateTime.now());
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    show.clear();
    show = [false];
    for (int i = 0; i < _dataController.moodData.length; i++) {
      if ((TimeDateFunctions.dateInDigits(_dataController.moodData[i]['date'])
                  .day ==
              selectedDateTime.day &&
          TimeDateFunctions.dateInDigits(_dataController.moodData[i]['date'])
                  .month ==
              selectedDateTime.month &&
          TimeDateFunctions.dateInDigits(_dataController.moodData[i]['date'])
                  .year ==
              selectedDateTime.year)) {
        show[i] = true;
        show.add(false);
      } else {
        show[i] = false;
        show.add(false);
      }
      setState(() {});
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                  top: 18.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(
                  children: [
                    Theme(
                      data: ThemeData(
                        cardTheme: const CardTheme(
                          color: Colors.transparent,
                          shadowColor: Colors.transparent,
                          elevation: 0,
                        ),
                      ),
                      child: TimelineCalendar(
                        calendarType: CalendarType.GREGORIAN,
                        calendarLanguage: "en",
                        calendarOptions: CalendarOptions(
                          viewType: ViewType.DAILY,
                          toggleViewType: true,
                          headerMonthElevation: 10,
                          headerMonthBackColor: Colors.transparent,
                        ),
                        dayOptions: DayOptions(
                            compactMode: true,
                            weekDaySelectedColor: const Color(0xff3AC3E2),
                            disableDaysBeforeNow: false),
                        headerOptions: HeaderOptions(
                            weekDayStringType: WeekDayStringTypes.SHORT,
                            monthStringType: MonthStringTypes.FULL,
                            headerTextColor: Colors.black),
                        dateTime: selectedDateTime,
                        onChangeDateTime: (datetime) async {
                          // print(datetime.getDate());
                          setState(() {
                            selectedDateTime = datetime;
                            isLoading = true;
                          });
                          moodGraph = await fetchWeeklyAnalyticsData(
                              datetime.toDateTime());
                          setState(() {
                            isLoading = false;
                          });
                        },
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 30.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF2F2F2),
                          ),
                        ),
                        for (int i = 6; i >= 0; i--)
                          Positioned(
                            left: (1 * i * 12).w,
                            bottom: 2.h,
                            child: Padding(
                              padding: EdgeInsets.only(left: 4.0.w),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            10.w, // Adjust the width as needed
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          child: moodGraph[i]['rating'] < 2.4 &&
                                                  moodGraph[i]['rating'] > 0.0
                                              ? Image.asset(
                                                  "assest/images/sadMiddle.png",
                                                  width: 10.w,
                                                )
                                              : moodGraph[i]['rating'] < 2.6 &&
                                                      moodGraph[i]['rating'] >
                                                          2.4
                                                  ? Image.asset(
                                                      "assest/images/middleBar.png",
                                                      width: 10.w,
                                                    )
                                                  : moodGraph[i]['rating'] <
                                                              5.0 &&
                                                          moodGraph[i]
                                                                  ['rating'] >
                                                              2.6
                                                      ? Image.asset(
                                                          "assest/images/happyMiddle.png",
                                                          width: 10.w,
                                                        )
                                                      : moodGraph[i]
                                                                  ['rating'] ==
                                                              5.0
                                                          ? Image.asset(
                                                              "assest/images/happyBar.png",
                                                              width: 10.w,
                                                            )
                                                          : moodGraph[i][
                                                                      'rating'] ==
                                                                  0.0
                                                              ? Image.asset(
                                                                  "assest/images/angryBar.png",
                                                                  width: 10.w,
                                                                )
                                                              : SizedBox
                                                                  .shrink())
                                    ],
                                  ),
                                  Text((DateFormat('EE')
                                      .format(TimeDateFunctions.dateInDigits(
                                          moodGraph[i]['date']))
                                      .toString())),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18.0, top: 18.0),
                      child: new Divider(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    show.isEmpty
                        ? SizedBox.shrink()
                        : Container(
                            height: 30.h,
                            child: ListView.builder(
                              itemCount: _dataController.moodData.length,
                              itemBuilder: (context, i) {
                                return show[i]
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DelayedDisplay(
                                          delay:
                                              const Duration(milliseconds: 150),
                                          slidingBeginOffset:
                                              const Offset(0, 1),
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 22, vertical: 10),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: AppColors.primaryColor
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        _dataController.moodData[
                                                                        i]
                                                                    ['rating'] >
                                                                2.4
                                                            ? "Feeling Happy"
                                                            : "Feeling Sad",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      Image.asset(
                                                        _dataController.moodData[
                                                                        i]
                                                                    ['rating'] >
                                                                2.4
                                                            ? "assest/images/happyIcon.png"
                                                            : "assest/images/sadface.png",
                                                        height: 30,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(_dataController
                                                      .moodData[i]['note']),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        DateFormat(
                                                                'EEEE , d MMMM')
                                                            .format(TimeDateFunctions
                                                                .dateInDigits(
                                                                    _dataController
                                                                            .moodData[i]
                                                                        [
                                                                        'date']))
                                                            .toString(),
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                      )
                                    : SizedBox.shrink();
                              },
                            ))
                  ],
                ),
              ));
  }

  static Future<List<Map>> fetchWeeklyAnalyticsData(dateTime) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference moodsCollection = firestore
        .collection("users")
        .doc(userData.userID)
        .collection("myMoods");

    // Calculate the start and end dates for the last week

    final DateTime now = dateTime;
    final DateTime lastWeekStart =
        now.subtract(const Duration(days: 6)); // 6 days ago
    final DateTime lastWeekEnd = now;

    // Convert DateTime to Timestamp
    final Timestamp startTimestamp = Timestamp.fromDate(lastWeekStart);
    final Timestamp endTimestamp = Timestamp.fromDate(lastWeekEnd);
    print("xwsxs");
    print(startTimestamp);
    print(endTimestamp);

    // Query the analytics data within the last week's date range for the specific product
    final QuerySnapshot snapshot = await moodsCollection
        .where('timestamp', isGreaterThanOrEqualTo: startTimestamp)
        .where('timestamp', isLessThanOrEqualTo: endTimestamp)
        .get();
    Map<String, Map<dynamic, dynamic>> moodsMap = {};

    // Iterate over the documents in the snapshot and add them to the map
    for (var doc in snapshot.docs) {
      Timestamp timestamp = doc['timestamp'];
      DateTime date = timestamp.toDate();

      String formattedDateTime = DateFormat('yyyy-MM-dd - EE').format(date);

      // Ensure that doc.data() is a Map<String, dynamic> and not null before assigning it
      if (doc.data() != null && doc.data() is Map<String, dynamic>) {
        moodsMap[formattedDateTime] = doc.data() as Map;
      }
    }

    print("moodsMap");
    print(moodsMap);
    // Create a list to store the final result
    List<Map<dynamic, dynamic>> moods = [];

    // Iterate over the last 7 days and add data to the list, or add a rating of -1 if no data exists
    for (int i = 0; i < 7; i++) {
      String currentDate = DateFormat('yyyy-MM-dd - EE')
          .format(lastWeekStart.add(Duration(days: i)));
      if (moodsMap.containsKey(currentDate)) {
        // Data exists for this day, add it to the list
        moods.add(moodsMap[currentDate]!);
      } else {
        // No data exists for this day, add a rating of -1.0
        moods.add({
          "date": lastWeekStart.add(Duration(days: i)).microsecondsSinceEpoch,
          "rating": -1.0,
        });
      }
    }

    print('WEEKLYDATA: $moods');
    return moods;
  }
}
