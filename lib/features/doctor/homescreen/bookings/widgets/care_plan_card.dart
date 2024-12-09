import 'package:flutter/material.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CarePlanCard extends StatelessWidget {
  const CarePlanCard({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kristine Jackson',
                style: TextStyle(fontSize: 20.px),
              ),
              Text(
                'Female, 31 years',
                style: TextStyle(fontSize: 20.px),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.pin_drop,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Address",
                            style: TextStyle(fontSize: 14.px, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 180,
                            child: Text(
                              "221 B, Baker Street, Manila, Phillipines - 1007",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12.px, fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.end,
                            'Dr.Angelynn Sianghio',
                            maxLines: 2,
                            style: TextStyle(fontSize: 12.px, fontWeight: FontWeight.w400, fontFamily: "Louize"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
