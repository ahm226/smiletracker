import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/helpers/custom_widgets.dart';
import 'package:smiletracker/helpers/globalvariables.dart';
import 'package:smiletracker/helpers/theme_service.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          pageTitle: "",
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: SizedBox(
        height: 100.h,
        child: Padding(
          padding: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 15.0),
          child: Column(
            children: [
              const Text(
                "Upgrade To",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "PREMIUM",
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 6,
                  color: AppColors.primaryColor,
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 14),
                child: Text(
                  "When you subscribe, you’ll get instant unlimited acess",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
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
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          width: 1.2, color: AppColors.primaryColor)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              selectedId == 1
                                  ? ThemeService().isDarkMode
                                      ? "assest/images/unSelectedRadioL.png"
                                      : "assest/images/unSelectedRadio.png"
                                  : "assest/images/selectedRadio.png",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Monthly",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Pay monthly, cancel any time",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$ 19.99",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              "/m",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ],
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
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          width: 1.2, color: AppColors.primaryColor)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              selectedId == 0
                                  ? ThemeService().isDarkMode
                                      ? "assest/images/unSelectedRadioL.png"
                                      : "assest/images/unSelectedRadio.png"
                                  : "assest/images/selectedRadio.png",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Yearly",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Pay for a full year",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$ 129.99",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              "/y",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              const Text(
                "Free for 3 days",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CustomButton(
                width: 100.w,
                buttonText: "Continue with free trial",
                onTap: () {},
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 1.5,
                      color: Colors.black,
                    ),
                    const Text(
                      "Restore Purchase",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 1.5,
                      color: Colors.black,
                    ),
                    const Text(
                      "Terms of use",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "You can cancel your subscription or trial anytime by cancelling your subscription through your iTunes account settings, or it will automatically renew. This must be done 24 hours before the end of the trial or any subscription period to avoid being charged. Subscription",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
