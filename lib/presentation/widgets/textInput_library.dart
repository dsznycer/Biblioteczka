import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextInput extends StatelessWidget {
  AppTextInput(
      {required this.hintText,
      required this.iconData,
      required this.labelValue,
      super.key});

  final String hintText;
  final IconData iconData;
  String labelValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Text(hintText, style: AppTextStyles.H3),
          ),
          TextField(
            onChanged: (value) => labelValue = value,
            decoration: InputDecoration(
              hintText: hintText,
              label: Icon(iconData),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.tealAccent)),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.kCol2, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
