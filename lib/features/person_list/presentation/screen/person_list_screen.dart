import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdax_work_trial/common/widgets/widgets.dart';
import 'package:pdax_work_trial/features/person_list/presentation/widgets/widgets.dart';

class PersonListScreen extends StatelessWidget {
  const PersonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Screen(
      floatingActionButton: kIsWeb ? WebFloatingActionButton() : null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: PersonListWidget(),
      ),
    );
  }
}
