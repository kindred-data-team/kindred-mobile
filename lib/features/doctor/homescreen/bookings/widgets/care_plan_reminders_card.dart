import 'package:flutter/material.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CarePlanRemindersCard extends StatefulWidget {
  const CarePlanRemindersCard({super.key});

  @override
  State<CarePlanRemindersCard> createState() => _CarePlanRemindersCardState();
}

class _CarePlanRemindersCardState extends State<CarePlanRemindersCard> {
  bool? isChecked1 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Reminders",
          style: TextStyle(
            fontSize: 22.px,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked1,
                checkColor: AppColors.primaryColor,
                activeColor: Colors.white,
                onChanged: (isChecked1NewValue) {
                  setState(() {
                    isChecked1 = isChecked1NewValue;
                  });
                }),
            const Flexible(
              child: Text(
                  "Any form of rashes from medications may be a sign of hypersensitivity ; discontinue medications and inform your coordinator or doctor. It is advisable to seek consult in the nearest Emergency Room for prompt medical management"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked1,
                onChanged: (isChecked1NewValue) {
                  setState(() {
                    isChecked1 = isChecked1NewValue;
                  });
                }),
            const Flexible(
              child: Text(
                  "We provide assistance in booking laboratory tests, both clinic visit or homeservice. Our nurses will reach out to you through your preferred mode ofcommunication."),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked1,
                onChanged: (isChecked1NewValue) {
                  setState(() {
                    isChecked1 = isChecked1NewValue;
                  });
                }),
            const Flexible(
              child: Text(
                  "We provide assistance in prescription fulfillment, with discreet packaging. Ournurses will reach out to you through your preferred mode of communication.\nAvoid transactions outside of Kindred, (e.g., clinic visits, medication fulfillment,laboratory referrals). Kindred will not be held liable for any untoward incident resulting from disregard on this precaution"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked1,
                onChanged: (isChecked1NewValue) {
                  setState(() {
                    isChecked1 = isChecked1NewValue;
                  });
                }),
            const Flexible(
              child: Text("You may reach us through SMS/ Viber/ Instagram/ NowServing app for any concern"),
            ),
          ],
        ),
      ],
    );
  }
}
