import 'package:flutter/material.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/widgets/search_widget.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/widgets/upcoming_list_tile.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  String searchQuery = "";
  final List<Map<String, String>> upcomingSample = [
    {
      'name': 'Kristine Jackson',
      'consultationType': '“OBGYN”',
      'time': '2:00 PM',
    },
    {
      'name': 'Anna Holmes',
      'consultationType': '“Fertility”',
      'time': '3:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  _buildBody() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SearchWidget(
              labelText: "Search",
              hintText: "Search",
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: upcomingSample.length,
                itemBuilder: (context, index) {
                  final upcoming = upcomingSample[index];
                  return UpcomingListTile(
                    name: upcoming['name'] ?? "",
                    consultationType: upcoming['consultationType'] ?? "",
                    time: upcoming['time']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
