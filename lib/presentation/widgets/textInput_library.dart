import 'dart:ffi';

import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTextInput extends StatelessWidget {
  AppTextInput(
      {required this.hintText,
      required this.iconData,
      this.width = double.infinity,
      this.keyboardType = TextInputType.text,
      required this.onChanged,
      this.enabled = true,
      super.key});

  final String hintText;
  final IconData iconData;
  final double width;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Text(hintText, style: AppTextStyles.H3),
          ),
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return TextField(
                enabled: enabled,
                keyboardType: keyboardType,
                onChanged: (value) => onChanged(value),
                decoration: InputDecoration(
                  hintText: hintText,
                  label: Icon(iconData),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.tealAccent)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.kCol2, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
