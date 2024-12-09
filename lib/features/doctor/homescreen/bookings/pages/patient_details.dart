import 'package:flutter/material.dart';
import 'package:kindred_app/common/constants/assets.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:kindred_app/core/presentation/widgets/default_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({super.key});

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  _buildBody(context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(Assets.notifLogo),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "First Name",
                    style: TextStyle(color: AppColors.primaryColor, fontSize: 14.px),
                  ),
                  Text(
                    "Kristine",
                    style: TextStyle(fontSize: 18.px),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Last Name",
                    style: TextStyle(color: AppColors.primaryColor, fontSize: 14.px),
                  ),
                  Text(
                    "Jackson",
                    style: TextStyle(fontSize: 18.px),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sex",
                    style: TextStyle(color: AppColors.primaryColor, fontSize: 14.px),
                  ),
                  Text(
                    "Female",
                    style: TextStyle(fontSize: 18.px),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Age",
                    style: TextStyle(color: AppColors.primaryColor, fontSize: 14.px),
                  ),
                  Text(
                    "34",
                    style: TextStyle(fontSize: 18.px),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Align(alignment: Alignment.center, child: DefaultButton(label: "Join Call", onPressed: () {}))
        ],
      ),
    );
  }
}
