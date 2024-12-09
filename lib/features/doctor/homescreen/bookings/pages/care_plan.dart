import 'package:flutter/material.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/widgets/care_plan_card.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/widgets/care_plan_reminders_card.dart';

class CarePlan extends StatefulWidget {
  const CarePlan({super.key});

  @override
  State<CarePlan> createState() => _CarePlanState();
}

class _CarePlanState extends State<CarePlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  _buildBody(context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CarePlanCard(),
          CarePlanRemindersCard(),
        ],
      ),
    );
  }
}
