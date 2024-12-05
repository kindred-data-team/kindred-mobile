import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_app/common/constants/routes.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/pages/completed_bookings.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/pages/upcoming_bookings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  _buildBody() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              context.goNamed(Routes.homeScreen.name);
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
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Bookings",
                    style: TextStyle(
                      fontSize: 24.px,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Louize",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                        'Upcoming',
                        style: TextStyle(
                          fontSize: 16.px,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        fontSize: 16.px,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    UpcomingBookings(),
                    CompletedBookings(),
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
