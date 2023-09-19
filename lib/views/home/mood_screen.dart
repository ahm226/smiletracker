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
  getData() async {
    setState(() {
      isLoading = true;
    });
    TimelineCalendar.calendarProvider = createInstance();
    selectedDateTime = TimelineCalendar.calendarProvider.getDateTime();
    await _dataController.addMoods();
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
                        onChangeDateTime: (datetime) {
                          // print(datetime.getDate());
                          setState(() {
                            selectedDateTime = datetime;
                          });
                        },
                      ),
                      // EventCalendar(
                      //     calendarType: CalendarType.GREGORIAN,
                      //     calendarLanguage: 'en',
                      //     showEvents: true,
                      //     dayOptions: DayOptions(
                      //         selectedBackgroundColor:
                      //             AppColors.primaryColor),
                      //     calendarOptions: CalendarOptions(
                      //         headerMonthBackColor: Colors.white,
                      //         viewType: ViewType.DAILY,
                      //         font: 'Poppins'),
                      //     headerOptions: HeaderOptions(
                      //         monthStringType: MonthStringTypes.FULL,
                      //         weekDayStringType: WeekDayStringTypes.SHORT),
                      //     eventOptions: EventOptions(
                      //         emptyIconColor: AppColors.primaryColor,
                      //         emptyIcon: Icons.hourglass_empty_sharp,
                      //         emptyTextColor: AppColors.primaryColor,
                      //         emptyText: "No Data"),
                      //     events: _dataController.moods),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18.0, top: 18.0),
                      child: new Divider(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Image.asset(
                      "assest/images/moodChart.png",
                    ),
                    Container(
                        height: 30.h,
                        child: ListView.builder(
                          itemCount: _dataController.moodData.length,
                          // scrollDirection: ,
                          itemBuilder: (context, i) {
                            List<bool> show = [];
                            for (int j = 0;
                                j < _dataController.moodData.length;
                                j++) {
                              if ((TimeDateFunctions.dateInDigits(
                                              _dataController.moodData[j]
                                                  ['date'])
                                          .day ==
                                      selectedDateTime.day &&
                                  TimeDateFunctions.dateInDigits(_dataController
                                              .moodData[j]['date'])
                                          .month ==
                                      selectedDateTime.month &&
                                  TimeDateFunctions.dateInDigits(_dataController
                                              .moodData[j]['date'])
                                          .year ==
                                      selectedDateTime.year)) {
                                print(i);
                                show[i] = true;
                              }
                            }
                            return show[i]
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DelayedDisplay(
                                      delay: const Duration(milliseconds: 150),
                                      slidingBeginOffset: const Offset(0, 1),
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    _dataController.moodData[i]
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
                                                  Image.asset(_dataController
                                                                  .moodData[i]
                                                              ['rating'] >
                                                          2.4
                                                      ? "assest/images/happyIcon.png"
                                                      : "assest/images/happyIcon.png"),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(_dataController.moodData[i]
                                                  ['note']),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    DateFormat('EEEE , d MMMM')
                                                        .format(TimeDateFunctions
                                                            .dateInDigits(
                                                                _dataController
                                                                        .moodData[
                                                                    i]['date']))
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
                                : null;
                          },
                        ))
                  ],
                ),
              ));
  }
}
