import 'package:flutter/material.dart';
import 'package:kindred_app/common/constants/assets.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String description;

  const ChatTile({
    super.key,
    required this.name,
    required this.description,
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
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14.px),
                    ),
                  ],
                ),
              ],
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.px),
          ),
          leading: SizedBox(
            width: 25,
            height: 25,
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
