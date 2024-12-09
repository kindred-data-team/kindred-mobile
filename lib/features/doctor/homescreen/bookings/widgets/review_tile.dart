import 'package:flutter/material.dart';
import 'package:kindred_app/common/constants/assets.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReviewTile extends StatelessWidget {
  final String name;
  final String reviewDesc;

  const ReviewTile({
    super.key,
    required this.name,
    required this.reviewDesc,
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
                const Row(
                  children: [
                    Icon(Icons.star, color: AppColors.primaryColor),
                    Icon(Icons.star, color: AppColors.primaryColor),
                    Icon(Icons.star, color: AppColors.primaryColor),
                    Icon(Icons.star, color: AppColors.primaryColor),
                    Icon(Icons.star, color: AppColors.greyColor),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  reviewDesc,
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.px),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          leading: Column(
            children: [
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 18,
                height: 18,
                child: Image.asset(Assets.notifLogo),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.px),
              )
            ],
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
