import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdax_work_trial/common/styles/styles.dart';
import 'package:pdax_work_trial/common/widgets/widgets.dart';
import 'package:pdax_work_trial/features/person_list/domain/entity/entity.dart';
import 'package:pdax_work_trial/features/person_list/presentation/bloc/bloc.dart';
import 'package:pdax_work_trial/features/person_list/presentation/screen/screen.dart';
import 'package:pdax_work_trial/features/person_list/presentation/widgets/widgets.dart';

class PersonListWidget extends StatelessWidget {
  const PersonListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),

        // * header text
        _BuildHeaderText(),

        SizedBox(
          height: 10,
        ),

        // * horizontal card country list with details
        Expanded(
          child: _BuildListWidget(),
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
  const _BuildListWidget();

  @override
  State<_BuildListWidget> createState() => _BuildListWidgetState();
}

class _BuildListWidgetState extends State<_BuildListWidget> {
  final ScrollController _scrollController = ScrollController();

  bool _isLoadingMore = false;

  void _loadMoreItems() {
    context.read<PersonListBloc>().add(PersonListMorePeopleLoaded());
  }

  void _onRefresh() {
    context.read<PersonListBloc>().add(PersonListRefreshed());
  }

  void _setIsLoadingMoreStatus(bool newStatus) {
    setState(() {
      _isLoadingMore = newStatus;
    });
  }

  void _navigateToPersonDetails(PersonListDatumEntity person) {
    Navigator.of(context).push(
      MaterialPageRoute<PersonDetailsScreen>(
        builder: (context) => PersonDetailsScreen(
          person: person,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoadingMore &&
          !kIsWeb) {
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
      onRefresh: () async => _onRefresh(),
      child: BlocConsumer<PersonListBloc, PersonListState>(
        listener: (context, state) {
          if (state.status.isLoadingMore) {
            _setIsLoadingMoreStatus(true);
          } else {
            _setIsLoadingMoreStatus(false);
          }
        },
        builder: (context, state) {
          if (state.status.isLoading) {
            return const LoaderWidget();
          } else if (state.status.isLoaded ||
              state.status.isLoadingMore ||
              state.status.isInitial ||
              state.status.isNoMoreData) {
            return ListView(
              controller: _scrollController,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              children: [
                for (final person in state.persons) ...[
                  GestureDetector(
                    onTap: () => _navigateToPersonDetails(person),
                    child: Card(
                      elevation: 4,
                      shadowColor: const Color.fromARGB(253, 241, 241, 241),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: kIsWeb
                          ? const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 200,
                            )
                          : const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: person.image ?? '',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                              placeholder: (context, url) =>
                                  const LoaderWidget(),
                              errorWidget: (context, url, error) =>
                                  const Icon(EvaIcons.imageOutline),
                            ),
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
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(EvaIcons.chevronRightOutline),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
                if (kIsWeb &&
                    state.page < 4 &&
                    (!state.status.isNoMoreData &&
                        !state.status.isLoadingMore)) ...[
                  const SizedBox(
                    height: 10,
                  ),
                  const WebLoadMoreDataTextButtonWidget(),
                  const SizedBox(
                    height: 20,
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
                if ((kIsWeb && state.page == 4) ||
                    state.status.isNoMoreData) ...[
                  const SizedBox(
                    height: 10,
                  ),
                  const NoMoreDataWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ],
            );
          } else {
            return const FailureWidget();
          }
        },
      ),
    );
  }
}
