import 'package:flutter/material.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/pages/care_plan.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/pages/review_screen.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/widgets/booking_type_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorPlan extends StatefulWidget {
  final String name;
  final String consultationType;
  final String time;

  const DoctorPlan({
    super.key,
    required this.name,
    required this.consultationType,
    required this.time,
  });

  @override
  State<DoctorPlan> createState() => _DoctorPlanState();
}

class _DoctorPlanState extends State<DoctorPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  _buildBody(context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              context.go('/bookingsScreen');
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "OBGYN",
                        style: TextStyle(
                          fontSize: 24.px,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Louize",
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      BookingTypeWidget(
                        child: Text(
                          "In-person",
                          style: TextStyle(color: AppColors.primaryColor, fontSize: 12.px),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "Aug 23",
                            style: TextStyle(
                              fontSize: 30.px,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "2:00 PM",
                            style: TextStyle(
                              fontSize: 14.px,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TabBar(
                    tabAlignment: TabAlignment.start,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    labelPadding: const EdgeInsets.only(left: 15, right: 20),
                    dividerColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    isScrollable: true,
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Care Plan",
                            style: TextStyle(
                              fontSize: 16.px,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Review",
                          style: TextStyle(
                            fontSize: 16.px,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    CarePlan(),
                    ReviewScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
