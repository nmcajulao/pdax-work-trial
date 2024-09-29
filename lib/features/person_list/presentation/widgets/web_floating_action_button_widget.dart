import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdax_work_trial/features/person_list/presentation/bloc/bloc.dart';

class WebFloatingActionButton extends StatelessWidget {
  const WebFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    void onRefresh() {
      context.read<PersonListBloc>().add(PersonListRefreshed());
    }

    return FloatingActionButton(
      tooltip: 'Refresh',
      onPressed: onRefresh,
      child: const Icon(
        EvaIcons.refreshOutline,
        size: 28,
      ),
    );
  }
}
