import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_app/common/constants/routes.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:kindred_app/features/doctor/homescreen/presentation/widgets/next_consultation_card.dart';
import 'package:kindred_app/features/doctor/homescreen/presentation/widgets/todays_schedule_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                context.pushNamed(Routes.notificationScreen.name);
              },
              icon: const Icon(
                Icons.notifications,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.login_rounded,
                )),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Hi, Dr. Angelynn",
                      style: TextStyle(
                        fontFamily: "Louize",
                        fontSize: 24.px,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Your Next Consultation",
                    style: TextStyle(fontSize: 15.px),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const NextConsultationCard(),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Today's Schedule"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: GridView.count(
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.85,
                  shrinkWrap: true,
                  crossAxisSpacing: 10.px,
                  mainAxisSpacing: 10.px,
                  primary: false,
                  children: const <Widget>[
                    TodaysScheduleCard(),
                    TodaysScheduleCard(),
                    TodaysScheduleCard(),
                    TodaysScheduleCard(),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Your Available Slots Today",
                    style: TextStyle(fontSize: 15.px),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "2nd October",
                    style: TextStyle(fontSize: 24.px),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.alarm, color: AppColors.primaryColor),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Morning",
                                      style: TextStyle(fontSize: 16.px),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text("9:00 - 10:00", style: TextStyle(fontSize: 14.px)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("11:00 - 12:00", style: TextStyle(fontSize: 14.px)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.alarm, color: AppColors.primaryColor),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Text("Afternoon", style: TextStyle(fontSize: 16.px)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text("13:00 - 14:00", style: TextStyle(fontSize: 14.px)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("13:00 - 14:00", style: TextStyle(fontSize: 14.px)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
