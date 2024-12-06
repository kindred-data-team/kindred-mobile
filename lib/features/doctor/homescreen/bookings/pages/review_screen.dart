import 'package:flutter/material.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/widgets/review_tile.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final List<Map<String, String>> reviewSample = [
    {
      'name': 'Kristine Jackson',
      'reviewDesc': '“Best Consultants in Phillippines”',
    },
    {
      'name': 'Anna Holmes',
      'reviewDesc': '“Best Fertility Clinic”',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  _buildBody(context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: reviewSample.length,
            itemBuilder: (context, index) {
              final review = reviewSample[index];
              return ReviewTile(
                name: review['name']!,
                reviewDesc: review['reviewDesc']!,
              );
            },
          ),
        ),
      ],
    );
  }
}
