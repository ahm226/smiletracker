import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/custom_widgets.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';

class ChoosePlan extends StatefulWidget {
  const ChoosePlan({super.key});

  @override
  State<ChoosePlan> createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {
  int selectedId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          pageTitle: "Change Password",
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
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            height: 86.h,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Upgrade To",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "PREMIUM",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 8.0,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10),
                  child: Text(
                    "When you subscribe, you’ll get instant unlimited acess",
                    style: bodyNormal.copyWith(
                        color: Colors.black54,
                        fontFamily: "MontserratSemiBold"),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedId = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              width: 1.2, color: AppColors.primaryColor)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Monthly",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: AppColors.primaryColor),
                                ),
                                Text(
                                  "Pay monthly, cancel any time",
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: AppColors.primaryColor),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "\$ 19.99/-",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.primaryColor),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Monthly Subscription",
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: AppColors.primaryColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedId = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              width: 1.2, color: AppColors.primaryColor)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Yearly",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: AppColors.primaryColor),
                                ),
                                Text(
                                  "Pay for a full year",
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: AppColors.primaryColor),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "\$ 129.99/-",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.primaryColor),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Yearly Subscription",
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: AppColors.primaryColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  "Free for 3 days",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
                  child: CustomButton(
                    width: 100.w,
                    buttonText: "Continue with free trail",
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Privacy Policy",
                        style: bodySmall.copyWith(
                            fontFamily: "MontserratSemiBold"),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.black,
                      ),
                      Text(
                        "Restore Purchase",
                        style: bodySmall.copyWith(
                            fontFamily: "MontserratSemiBold"),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.black,
                      ),
                      Text(
                        "Terms of use",
                        style: bodySmall.copyWith(
                            fontFamily: "MontserratSemiBold"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text(
                    "You can cancel your subscription or trial anytime by cancelling your subscription through your iTunes account settings, or it will automatically renew. This must be done 24 hours before the end of the trial or any subscription period to avoid being charged. Subscription",
                    style: bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
