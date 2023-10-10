import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/helpers/data_helper.dart';
import 'package:smiletracker/helpers/globalvariables.dart';
import 'package:smiletracker/helpers/page_navigation.dart';
import 'package:smiletracker/views/home/diary_pages.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 18.0, bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Diary",
                    style: headingMedium,
                  ),
                  Text(
                    DateFormat('EEEE, d MMM,y')
                        .format(DateTime.now())
                        .toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: Colors.grey.shade700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  _dataController.moodData.isNotEmpty
                      ? PageTransition.pageNavigation(page: BookPageFlip())
                      : ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                          content: Text("No mood added yet"),
                        ));
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assest/images/diaryCover.png"),
                    Text(
                      userData.displayName + "\nMood\nTracker",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 60,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
