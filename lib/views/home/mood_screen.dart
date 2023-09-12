import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/helpers/data_helper.dart';
import 'package:smiletracker/helpers/globalvariables.dart';

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
        body: isLoading
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
                    Container(
                      height: 75.h,
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
                                  headerMonthBackColor: Colors.white,
                                  viewType: ViewType.DAILY,
                                  font: 'Poppins'),
                              headerOptions: HeaderOptions(
                                  monthStringType: MonthStringTypes.FULL,
                                  weekDayStringType: WeekDayStringTypes.SHORT),
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
              ));
  }
}
