import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdax_work_trial/common/styles/styles.dart';
import 'package:pdax_work_trial/common/widgets/widgets.dart';
import 'package:pdax_work_trial/features/person_list/domain/entity/entity.dart';
import 'package:pdax_work_trial/features/person_list/presentation/bloc/bloc.dart';

class PersonListWidget extends StatelessWidget {
  const PersonListWidget({
    required this.persons,
    super.key,
  });

  final List<PersonListDatumEntity> persons;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),

        // * header text
        const _BuildHeaderText(),

        const SizedBox(
          height: 10,
        ),

        // * horizontal card country list with details
        Expanded(
          child: _BuildListWidget(persons: persons),
        ),
      ],
    );
  }
}

class _BuildHeaderText extends StatelessWidget {
  const _BuildHeaderText();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'FakeAPI People',
        style: AppTextStyles.getStyle(AppTextStyle.headline6).copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _BuildListWidget extends StatefulWidget {
  const _BuildListWidget({
    required this.persons,
  });

  final List<PersonListDatumEntity> persons;

  @override
  State<_BuildListWidget> createState() => _BuildListWidgetState();
}

class _BuildListWidgetState extends State<_BuildListWidget> {
  final ScrollController _scrollController = ScrollController();

  bool _isLoadingMore = false;

  void _loadMoreItems() {
    context.read<PersonListBloc>().add(PersonListMorePeopleLoaded());
  }

  void _setIsLoadingMoreStatus(bool newStatus) {
    setState(() {
      _isLoadingMore = newStatus;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoadingMore) {
        _loadMoreItems();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: BlocConsumer<PersonListBloc, PersonListState>(
        listener: (context, state) {
          if (state.status.isLoadingMore) {
            _setIsLoadingMoreStatus(true);
          } else {
            _setIsLoadingMoreStatus(false);
          }
        },
        builder: (context, state) {
          return ListView(
            controller: _scrollController,
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            children: [
              for (final person in widget.persons) ...[
                Card(
                  elevation: 4,
                  shadowColor: const Color.fromARGB(253, 241, 241, 241),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        /* CachedNetworkImage(
                          imageUrl: person.image ?? '',
                          imageBuilder: (context, imageProvider) => Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => const LoaderWidget(),
                          errorWidget: (context, url, error) =>
                              const Icon(EvaIcons.imageOutline),
                        ), */
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                person.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                person.email ?? '',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
              if (state.status.isLoadingMore) ...[
                const SizedBox(
                  height: 10,
                ),
                const LoaderWidget(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
