import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pdax_work_trial/common/widgets/widgets.dart';
import 'package:pdax_work_trial/features/person_list/domain/entity/entity.dart';

class PersonDetailsCircleAvatarWidget extends StatelessWidget {
  const PersonDetailsCircleAvatarWidget({
    required this.person,
    super.key,
  });

  final PersonListDatumEntity person;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      child: CachedNetworkImage(
        imageUrl: person.image ?? '',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const LoaderWidget(),
        errorWidget: (context, url, error) => const Icon(EvaIcons.imageOutline),
      ),
    );
  }
}
