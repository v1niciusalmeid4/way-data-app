import 'package:core/app_way_data_core.dart';

import 'package:instance/features/home/components/components.dart';

import 'package:flutter/material.dart';

class HomeStableState extends StatefulWidget {
  final HomeBloc bloc;
  final Stable state;

  const HomeStableState({required this.bloc, required this.state, super.key});

  @override
  State<HomeStableState> createState() => _HomeStableStateState();
}

class _HomeStableStateState extends State<HomeStableState> {
  HomeStableData get data => widget.state.data;
  HomeBloc get bloc => widget.bloc;

  List<CharacterEntity> get characters => data.characters;
  bool get reachMax => data.reachMax;

  String query = '';
  CharacterGender? gender;
  CharacterStatus? status;

  void onSearch(String query) {
    this.query = query;

    bloc.dispatchEvent(HomeReadyEvent(query: query));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchCharacterComponent(onSearch: onSearch),
            RowCharacterGenderComponent(
              gender: gender,
              onGenderPressed: (gender) {},
            ),
            RowCharacterStatusComponent(
              status: status,
              onStatusPressed: (status) {},
            ),

            Expanded(
              child: ListCharacters(
                characters: characters,
                reachMax: reachMax,
                onFetch: () =>
                    bloc.dispatchEvent(HomeLoadMoreEvent(query: query)),
                onPullRefresh: () =>
                    bloc.dispatchEvent(HomeReadyEvent(query: query)),
                onCharacterPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
