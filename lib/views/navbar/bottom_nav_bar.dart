// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smiletracker/helpers/data_helper.dart';
// import 'package:smiletracker/helpers/globalvariables.dart';
// import 'package:smiletracker/views/home/diary_screen.dart';
// import 'package:smiletracker/views/home/mood_screen.dart';
// import 'package:smiletracker/views/home/reminder_screen.dart';
// import 'package:smiletracker/views/home/smily_face.dart';
// import 'package:smiletracker/views/profile/profile_screen.dart';
//
// class BottomNavBar extends StatefulWidget {
//   int? pageNumber;
//
//   BottomNavBar({
//     Key? key,
//     this.pageNumber = 0,
//   }) : super(key: key);
//
//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   final DataHelper _dataController = Get.find<DataHelper>();
//   int pageIndex = 0;
//   PageController controller = PageController(initialPage: 0);
//
//   getData() {
//     setState(() {
//       pageIndex = widget.pageNumber!;
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final pages = [
//       EmojiRatingApp(),
//       MoodsScreen(
//         date: DateTime.now(),
//       ),
//       ReminderScreen(),
//       DiaryScreen(),
//       ProfileScreen()
//     ];
//     return Scaffold(
//       body: SafeArea(
//         child: PageView(
//           controller: controller,
//           children: pages,
//           onPageChanged: (index) {
//             setState(() {
//               pageIndex = index;
//             });
//           },
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (value) {
//           controller.animateToPage(value,
//               duration: Duration(microseconds: 100), curve: Curves.bounceInOut);
//           setState(() {
//             pageIndex = value;
//             print(pageIndex);
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Color(0xff033d94),
//         unselectedItemColor: Colors.black.withOpacity(.60),
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         selectedFontSize: 12,
//         unselectedFontSize: 12,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Padding(
//                 padding: const EdgeInsets.only(top: 4.0, bottom: 6),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 24,
//                       child: Image.asset(
//                         "assest/images/homeIcon.png",
//                         fit: BoxFit.fill,
//                         color: pageIndex == 0
//                             ? AppColors.primaryColor
//                             : Colors.grey,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               label: ""),
//           BottomNavigationBarItem(
//               icon: Padding(
//                 padding: const EdgeInsets.only(top: 4.0, bottom: 6),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 24,
//                       child: Image.asset(
//                         "assest/images/calenderIcon.png",
//                         fit: BoxFit.fill,
//                         color: pageIndex == 1
//                             ? AppColors.primaryColor
//                             : Colors.grey,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               label: ""),
//           BottomNavigationBarItem(
//             icon: Container(
//               padding: EdgeInsets.all(13),
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topRight,
//                     end: Alignment.bottomLeft,
//                     colors: [
//                       Color(0xFF13CBF8), // #13CBF8
//                       Color(0xFF2899B4), // #2899B4
//                     ],
//                     stops: [0.066, 0.8819],
//                     // 6.6%, 88.19%
//                     transform: GradientRotation(149.04 *
//                         3.14159265 /
//                         180), // Convert degrees to radians
//                   ),
//                   shape: BoxShape.circle),
//               child: Icon(
//                 Icons.add,
//                 color: Colors.white,
//               ),
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//               icon: Padding(
//                 padding: const EdgeInsets.only(top: 4.0, bottom: 6),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 24,
//                       alignment: Alignment.topCenter,
//                       child: Image.asset(
//                         "assest/images/diaryIcon.png",
//                         fit: BoxFit.fill,
//                         color: pageIndex == 3
//                             ? AppColors.primaryColor
//                             : Colors.grey,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               label: pageIndex == 2 ? "Notifications" : "Notifications"),
//           BottomNavigationBarItem(
//               icon: Padding(
//                 padding: const EdgeInsets.only(top: 4.0, bottom: 6),
//                 child: CircleAvatar(
//                   radius: 15,
//                   backgroundColor: AppColors.primaryColor,
//                   child: CircleAvatar(
//                     radius: pageIndex == 4 ? 13 : 15,
//                     child: Image.asset(
//                       "assest/images/profileImage.png",
//                       fit: BoxFit.fitHeight,
//                     ),
//                   ),
//                 ),
//                 // child: SizedBox(
//                 //   height: 24,
//                 //   child: Image.asset(
//                 //     "assest/images/profileImage.png",
//                 //     fit: BoxFit.fitHeight,
//                 //   ),
//                 // ),
//               ),
//               label:
//                   (pageIndex == 2 || pageIndex == -3) ? "Profile" : "Profile"),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:smiletracker/helpers/globalvariables.dart';
import 'package:smiletracker/views/home/diary_screen.dart';
import 'package:smiletracker/views/home/mood_screen.dart';
import 'package:smiletracker/views/home/reminder_screen.dart';
import 'package:smiletracker/views/home/smily_face.dart';
import 'package:smiletracker/views/profile/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  final List pages = [
    EmojiRatingApp(),
    MoodsScreen(
      date: DateTime.now(),
    ),
    ReminderScreen(),
    DiaryScreen(),
    ProfileScreen()
  ];
  void _onItemTapped(value) {
    pageIndex = value;
    setState(() {});
  }

  @override
  void initState() {
    pageIndex = widget.index;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          // currentIndex: index,
          onTap: (value) => _onItemTapped(value),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff033d94),
          unselectedItemColor: Colors.black.withOpacity(.60),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showSelectedLabels: false,
          showUnselectedLabels: false,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 6),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24,
                        child: Image.asset(
                          "assest/images/homeIcon.png",
                          fit: BoxFit.fill,
                          color: pageIndex == 0
                              ? AppColors.primaryColor
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 6),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24,
                        child: Image.asset(
                          "assest/images/calenderIcon.png",
                          fit: BoxFit.fill,
                          color: pageIndex == 1
                              ? AppColors.primaryColor
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(13),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF13CBF8), // #13CBF8
                        Color(0xFF2899B4), // #2899B4
                      ],
                      stops: [0.066, 0.8819],
                      // 6.6%, 88.19%
                      transform: GradientRotation(149.04 *
                          3.14159265 /
                          180), // Convert degrees to radians
                    ),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 6),
                  child: Column(
                    children: [
                      Container(
                        height: 24,
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          "assest/images/diaryIcon.png",
                          fit: BoxFit.fill,
                          color: pageIndex == 3
                              ? AppColors.primaryColor
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                label: pageIndex == 2 ? "Notifications" : "Notifications"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 6),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.primaryColor,
                    child: CircleAvatar(
                      radius: pageIndex == 4 ? 13 : 15,
                      child: Image.asset(
                        "assest/images/profileImage.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  // child: SizedBox(
                  //   height: 24,
                  //   child: Image.asset(
                  //     "assest/images/profileImage.png",
                  //     fit: BoxFit.fitHeight,
                  //   ),
                  // ),
                ),
                label: (pageIndex == 2 || pageIndex == -3)
                    ? "Profile"
                    : "Profile"),
          ],
        ),
      ),
    );
  }
}
