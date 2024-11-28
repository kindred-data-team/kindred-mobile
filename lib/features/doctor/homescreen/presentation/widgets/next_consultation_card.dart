import 'package:flutter/material.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NextConsultationCard extends StatelessWidget {
  const NextConsultationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: AppColors.cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 2,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              ///////////////
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
              ), /////
              const SizedBox(
                height: 20,
              ),
              ////////
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 20.px, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '2:00 PM Monday',
                        style: TextStyle(
                            fontSize: 14.px, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  /////////////
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OBGYN Consultation',
                        style: TextStyle(
                            fontSize: 14.px, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          'Thatiana Juntereal',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14.px, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
