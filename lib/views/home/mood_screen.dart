// import 'package:avatar_stack/avatar_stack.dart';
// import 'package:delayed_display/delayed_display.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_event_calendar/flutter_event_calendar.dart';
// import 'package:get/get.dart';
// import 'package:smiletracker/Helpers/custom_widgets.dart';
// import 'package:smiletracker/Helpers/globalvariables.dart';
//
// class MoodsScreen extends StatefulWidget {
//   const MoodsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MoodsScreen> createState() => _MoodsScreenState();
// }
//
// class _MoodsScreenState extends State<MoodsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         automaticallyImplyLeading: false,
//         title: CustomAppBar(
//           pageTitle: "My moods",
//           onTap: () {
//             Get.back();
//           },
//           leadingButton: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//             size: 20,
//           ),
//         ),
//       ),
//       body: EventCalendar(
//         calendarType: CalendarType.GREGORIAN,
//         calendarLanguage: 'en',
//         showEvents: true,
//         dayOptions: DayOptions(selectedBackgroundColor: AppColors.primaryColor),
//         calendarOptions: CalendarOptions(
//             viewType: ViewType.DAILY, font: "MontserratSemiBold"),
//         headerOptions: HeaderOptions(
//             monthStringType: MonthStringTypes.FULL,
//             weekDayStringType: WeekDayStringTypes.SHORT),
//         eventOptions: EventOptions(
//             emptyIconColor: Colors.black,
//             emptyTextColor: Colors.black,
//             emptyText: ""),
//         events: [
//           Event(
//             child: DelayedDisplay(
//               delay: const Duration(milliseconds: 150),
//               slidingBeginOffset: const Offset(0, 1),
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
//                 width: double.infinity,
//                 height: 90,
//                 decoration: BoxDecoration(
//                     color: AppColors.primaryColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(16)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           'Need a chef at home',
//                           style: headingMedium,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Icon(Icons.access_time_outlined),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Expanded(
//                           child: Text(
//                             '11:00 AM - 01:00 PM',
//                             style: bodyNormal,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 90,
//                           child: AvatarStack(
//                             height: 36,
//                             avatars: [
//                               for (var n = 0; n < 3; n++) AssetImage("j"),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             dateTime: CalendarDateTime(
//               year: 2023,
//               month: 8,
//               day: 17,
//               calendarType: CalendarType.GREGORIAN,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
/////////////
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smiletracker/Helpers/custom_widgets.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';

class MoodsScreen extends StatefulWidget {
  const MoodsScreen({Key? key}) : super(key: key);

  @override
  _ScheduledJobsState createState() => _ScheduledJobsState();
}

class _ScheduledJobsState extends State<MoodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: CustomAppBar(
            pageTitle: "Scheduled Jobs",
            onTap: () {
              Get.back();
            },
            leadingButton: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: EventCalendar(
                  calendarType: CalendarType.GREGORIAN,
                  calendarLanguage: 'en',
                  showEvents: true,
                  dayOptions: DayOptions(
                      selectedBackgroundColor: AppColors.primaryColor),
                  calendarOptions: CalendarOptions(
                      viewType: ViewType.DAILY, font: "MontserratSemiBold"),
                  headerOptions: HeaderOptions(
                      monthStringType: MonthStringTypes.FULL,
                      weekDayStringType: WeekDayStringTypes.SHORT),
                  eventOptions: EventOptions(
                      emptyIconColor: Colors.black,
                      emptyTextColor: Colors.black,
                      emptyText: "Empty"),
                  events: [
                    Event(
                      child: DelayedDisplay(
                        delay: const Duration(milliseconds: 150),
                        slidingBeginOffset: const Offset(0, 1),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xffff9F7FD),
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Feeling Happy',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                    "I am a body builder and i realized that overdoing high-intensity exercise such as high-intensity interval training--HIIT--by cramming too many workouts into a week.These kinds of workouts take more time to recover from and you may end up feeling worn down, depressed, or anxious."),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      DateFormat('EEEE , d MMMM, HH:mm a')
                                          .format(DateTime.now())
                                          .toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 10,
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
                        year: DateTime.now().year,
                        month: DateTime.now().month,
                        day: DateTime.now().day,
                        calendarType: CalendarType.GREGORIAN,
                      ),
                    ),
                    Event(
                      child: DelayedDisplay(
                        delay: const Duration(milliseconds: 150),
                        slidingBeginOffset: const Offset(0, 1),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xffff9F7FD),
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Feeling Happy',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                    "I am a body builder and i realized that overdoing high-intensity exercise such as high-intensity interval training--HIIT--by cramming too many workouts into a week.These kinds of workouts take more time to recover from and you may end up feeling worn down, depressed, or anxious."),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      DateFormat('EEEE , d MMMM, HH:mm a')
                                          .format(DateTime.now())
                                          .toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 10,
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
                        year: DateTime.now().year,
                        month: DateTime.now().month,
                        day: DateTime.now().day,
                        calendarType: CalendarType.GREGORIAN,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
