import 'package:flutter/material.dart';
import 'package:music_app/app/configs/themes/app_colors.dart';

Widget get loading => const Center(
      child: CircularProgressIndicator(
        color: AppColors.accent,
        strokeWidth: 2,
      ),
    );
