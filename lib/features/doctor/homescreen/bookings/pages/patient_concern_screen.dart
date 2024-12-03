import 'package:flutter/material.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:kindred_app/core/presentation/widgets/default_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PatientConcernScreen extends StatefulWidget {
  const PatientConcernScreen({super.key});

  @override
  State<PatientConcernScreen> createState() => _PatientConcernScreenState();
}

class _PatientConcernScreenState extends State<PatientConcernScreen> {
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
          Text(
            "What are your symptoms/concerns?",
            style: TextStyle(fontSize: 18.px),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("Abdominal Pain, Pregnancy, Mental Health",
              style: TextStyle(color: AppColors.primaryColor, fontSize: 16.px)),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Will you need a prescription?",
            style: TextStyle(fontSize: 18.px),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Yes",
            style: TextStyle(color: AppColors.primaryColor, fontSize: 16.px),
          ),
          const Spacer(),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.center,
              child: GlobalButton(label: "Join Call", onPressed: () {}))
        ],
      ),
    );
  }
}
