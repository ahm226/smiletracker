import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/helpers/custom_widgets.dart';
import 'package:smiletracker/helpers/data_helper.dart';
import 'package:smiletracker/helpers/time_date_functions.dart';

class PageData extends StatefulWidget {
  final int page;

  const PageData({Key? key, required this.page}) : super(key: key);

  @override
  State<PageData> createState() => _PageDataState();
}

class _PageDataState extends State<PageData> {
  final DataHelper _dataController = Get.find<DataHelper>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/images/diaryBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 5.h, left: 18.0, right: 18.0, bottom: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                pageTitle: "",
                onTap: () {
                  Get.back();
                },
                leadingButton: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('d/MM/y')
                        .format(TimeDateFunctions.dateInDigits(
                            _dataController.moodData[widget.page]['date']))
                        .toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'GloriaHallelujah',
                      color: Colors.grey.shade700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.3.h,
              ),
              const Text(
                "My Diary",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GloriaHallelujah',
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 0.7.h,
              ),
              Text(
                _dataController.moodData[widget.page]['note'].toString(),
                //   "If you're tired or haven't slept well, it can be extremely difficult to summon the motivation to do anything. If you're tired or haven't slept well, it can be extremely difficult to summon the motivation to do anything. If you're tired or haven't slept well, it can be extremely difficult to summon the motivation to do anything. If you're tired or haven't slept well, it can be extremely difficult to summon the motivation to do anything.",
                style: TextStyle(
                  height: 2,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GloriaHallelujah',
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
