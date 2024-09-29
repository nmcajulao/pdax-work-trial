import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdax_work_trial/common/colors.dart/app_colors.dart';
import 'package:pdax_work_trial/common/styles/styles.dart';
import 'package:pdax_work_trial/features/person_list/presentation/bloc/bloc.dart';

class WebLoadMoreDataTextButtonWidget extends StatelessWidget {
  const WebLoadMoreDataTextButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void loadMoreItems() {
      context.read<PersonListBloc>().add(PersonListMorePeopleLoaded());
    }

    return TextButton(
      onPressed: loadMoreItems,
      child: Text(
        'Press to load more data',
        style: AppTextStyles.getStyle(AppTextStyle.buttonText).copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
