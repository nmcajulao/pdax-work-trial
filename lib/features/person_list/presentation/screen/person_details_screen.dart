import 'package:flutter/material.dart';
import 'package:pdax_work_trial/common/widgets/widgets.dart';
import 'package:pdax_work_trial/features/person_list/domain/entity/entity.dart';
import 'package:pdax_work_trial/features/person_list/presentation/widgets/widgets.dart';

class PersonDetailsScreen extends StatelessWidget {
  const PersonDetailsScreen({
    required this.person,
    super.key,
  });

  final PersonListDatumEntity person;

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const PersonDetailsGoBackButtonWidget(),
            const SizedBox(
              height: 10,
            ),
            PersonDetailsCircleAvatarWidget(
              person: person,
            ),
            const SizedBox(
              height: 20,
            ),
            PersonDetailsWidget(
              person: person,
            ),
          ],
        ),
      ),
    );
  }
}
