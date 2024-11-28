import 'package:flutter/material.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TodaysScheduleCard extends StatelessWidget {
  const TodaysScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: AppColors.cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 2,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.43,
          height: MediaQuery.of(context).size.height * 0.35,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.person_outline_rounded,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'In-person',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '11:00 AM',
                style: TextStyle(fontSize: 20.px),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                child: Text(
                  maxLines: 2,
                  'OBGYN',
                  style: TextStyle(fontSize: 14.px),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Thatiana Juntereal',
                style: TextStyle(fontSize: 14.px),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
