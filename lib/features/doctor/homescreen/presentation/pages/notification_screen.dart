import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_app/features/doctor/homescreen/presentation/widgets/notification_list_tile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, String>> notificationsSample = [
    {
      'title': 'Your Appointment for OBGYN is booked for today.',
      'time': '2:00 PM',
    },
    {
      'title': 'Your password was changed.',
      'time': 'Yesterday, 2:00 PM',
    },
    {
      'title': 'Kristine replied on your chat.l',
      'description': '“Hello, Kristine! Yes,...”',
      'time': 'Last Week',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            context.go('/homeScreen');
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Notifications",
                      style: TextStyle(
                          fontSize: 24.px,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Louize"),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: notificationsSample.length,
                  itemBuilder: (context, index) {
                    final notification = notificationsSample[index];
                    return NotificationListTile(
                      title: notification['title']!,
                      description: notification['description'],
                      time: notification['time']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
