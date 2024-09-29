import 'package:flutter/material.dart';
import 'package:pdax_work_trial/common/styles/styles.dart';

class NoMoreDataWidget extends StatelessWidget {
  const NoMoreDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'There is no more data to load.',
        style: AppTextStyles.getStyle(AppTextStyle.subtitle1).copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
