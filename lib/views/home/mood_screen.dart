import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/helpers/custom_widgets.dart';
import 'package:smiletracker/helpers/data_helper.dart';
import 'package:smiletracker/helpers/globalvariables.dart';
import 'package:smiletracker/helpers/page_navigation.dart';
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
  final DataHelper _dataController = Get.find<DataHelper>();
  bool isLoading = false;
  getData() async {
    setState(() {
      isLoading = true;
    });
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
                                events: _dataController.moods),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }
}
