import 'package:photo_app/bloc/photo_bloc.dart';
import 'package:photo_app/components/custom_card.dart';
import 'package:photo_app/components/custom_driver.dart';
import 'package:photo_app/components/theme.dart';
import 'package:photo_app/models/photo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: customColors!
                .onSurfaceVariant // Set the color of the hamburger menu icon to red
            ),
        title: Text(
          'List page',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: customColors.onSurface),
        ),
        backgroundColor: customColors.background,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: customColors.onSurfaceVariant,
            ),
            onPressed: () {
              context.read<PhotoBloc>().add(FetchBeers());
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotoLoading) {
            return const Center(
                child: CircularProgressIndicator(color: Color(0xFF0061A6)));
          } else if (state is PhotoLoaded) {
            final beers = state.beers;
            if (beers.isEmpty) {
              return const Center(child: Text('No items found'));
            }

            // Group beers by the first letter of their name
            final groupedBeers = _groupBeersByFirstLetter(beers);

            return ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: Scrollbar(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: groupedBeers.length,
                    itemBuilder: (context, index) {
                      final group = groupedBeers[index];
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20, // Adjust the width as necessary
                                margin: const EdgeInsets.only(
                                    top: 5,
                                    right: 5), // Adjust the margin as necessary
                                child: Text(
                                  group['letter'],
                                  style: TextStyle(
                                      // fontFamily: "Roboto",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: customColors.primary),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: group['beers'].map<Widget>((beer) {
                                    return CustomCard(beer: beer);
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          } else if (state is PhotoError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }

  List<Map<String, dynamic>> _groupBeersByFirstLetter(List<PhotoModel> beers) {
    beers.sort(
        (a, b) => a.photographer.compareTo(b.photographer)); // Sorting by name
    final Map<String, List<PhotoModel>> groupedMap = {};

    for (var beer in beers) {
      final letter = beer.photographer.isNotEmpty
          ? beer.photographer[0].toUpperCase()
          : '#';
      if (!groupedMap.containsKey(letter)) {
        groupedMap[letter] = [];
      }
      groupedMap[letter]!.add(beer);
    }

    final groupedBeers = groupedMap.entries
        .map((entry) => {'letter': entry.key, 'beers': entry.value})
        .toList();

    groupedBeers.sort(
        (a, b) => (a['letter'] as String).compareTo(b['letter'] as String));

    return groupedBeers;
  }
}
