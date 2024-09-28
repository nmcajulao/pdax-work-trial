import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdax_work_trial/common/widgets/widgets.dart';
import 'package:pdax_work_trial/features/person_list/presentation/bloc/bloc.dart';
import 'package:pdax_work_trial/features/person_list/presentation/widgets/widgets.dart';

class PersonListScreen extends StatelessWidget {
  const PersonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<PersonListBloc, PersonListState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return const LoaderWidget();
            } else if (state.status.isLoaded ||
                state.status.isLoadingMore ||
                state.status.isInitial) {
              return PersonListWidget(persons: state.persons);
            } else {
              return const FailureWidget();
            }
          },
        ),
      ),
    );
  }
}
