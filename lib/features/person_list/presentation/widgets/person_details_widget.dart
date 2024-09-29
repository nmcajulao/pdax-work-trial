import 'package:flutter/material.dart';
import 'package:pdax_work_trial/common/styles/styles.dart';
import 'package:pdax_work_trial/features/person_list/domain/entity/entity.dart';

class PersonDetailsWidget extends StatelessWidget {
  const PersonDetailsWidget({
    required this.person,
    super.key,
  });

  final PersonListDatumEntity person;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: const Color.fromARGB(253, 241, 241, 241),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _BuildDataEntry(
              title: 'ID',
              value: (person.id ?? 'N/A').toString(),
            ),
            _BuildDataEntry(
              title: 'Name',
              value: person.name,
            ),
            _BuildDataEntry(
              title: 'Email',
              value: person.email ?? 'N/A',
            ),
            _BuildDataEntry(
              title: 'Phone',
              value: person.phone ?? 'N/A',
            ),
            _BuildDataEntry(
              title: 'Birthday',
              value: person.birthday ?? 'N/A',
            ),
            _BuildDataEntry(
              title: 'Gender',
              value: person.gender ?? 'N/A',
            ),
            _BuildDataEntry(
              title: 'Website',
              value: person.website ?? 'N/A',
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            _BuildDataEntry(
              title: 'Address ID',
              value: (person.address?.id ?? 'N/A').toString(),
            ),
            _BuildDataEntry(
              title: 'Address',
              value: person.address?.address ?? 'N/A',
            ),
            _BuildDataEntry(
              title: 'Latitude',
              value: (person.address?.latitude ?? 'N/A').toString(),
            ),
            _BuildDataEntry(
              title: 'Longitude',
              value: (person.address?.longitude ?? 'N/A').toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildDataEntry extends StatelessWidget {
  const _BuildDataEntry({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.getStyle(AppTextStyle.subtitle1).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: AppTextStyles.getStyle(AppTextStyle.subtitle2),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
