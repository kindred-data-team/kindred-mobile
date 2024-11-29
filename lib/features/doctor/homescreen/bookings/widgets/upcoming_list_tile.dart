import 'package:flutter/material.dart';
import 'package:kindred_app/common/constants/assets.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UpcomingListTile extends StatelessWidget {
  final String name;
  final String consultationType;
  final String time;

  const UpcomingListTile({
    super.key,
    required this.name,
    required this.consultationType,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          title: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 16.px),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  consultationType,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.px,
                      color: AppColors.dividerColor),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          subtitle: Text(
            time,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 11.px,
                color: AppColors.dividerColor),
          ),
          leading: SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(Assets.notifLogo),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Divider(
            thickness: 1,
            color: AppColors.dividerColor,
          ),
        ),
      ],
    );
  }
}
