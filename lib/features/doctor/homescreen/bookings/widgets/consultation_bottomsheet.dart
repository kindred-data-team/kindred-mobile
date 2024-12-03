import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void consultationBottomSheet({
  required BuildContext context,
  VoidCallback? onClose,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: false,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reschedule Consultation",
                  style:
                      TextStyle(fontSize: 20.px, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Cancel Consultation",
                  style:
                      TextStyle(fontSize: 20.px, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
