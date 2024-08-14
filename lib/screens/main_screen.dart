// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:bloc_action_listener/bloc_action_listener.dart';
import 'package:photo_app/bloc/photo_bloc.dart';
import 'package:photo_app/components/widgets/custom_card.dart';
import 'package:photo_app/components/widgets/custom_driver.dart';
import 'package:photo_app/components/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_app/utils/group_photos.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: customColors!.onSurfaceVariant),
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
              context.read<PhotoBloc>().add(FetchPhoto());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.info,
              color: customColors.onSurfaceVariant,
            ),
            onPressed: () {
              context.read<PhotoBloc>().add(ShowDialogEvent());
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: BlocActionListener<PhotoBloc, PhotoAction>(
        listener: (context, action) {
          if (action is ShowDialogAction) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(action.title),
                content: Text(action.content),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<PhotoBloc>().onDialogButtonPressed('OK');
                      context.router.pop();
                    },
                    child: const Text('OK'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<PhotoBloc>().onDialogButtonPressed('No');
                      context.router.pop();
                    },
                    child: const Text('No'),
                  ),
                ],
              ),
            );
          } else if (action is ShowSnackbarAction) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(action.message)),
            );
          }
        },
        child: BlocBuilder<PhotoBloc, PhotoState>(
          builder: (context, state) {
            if (state is PhotoLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: Color(0xFF0061A6)));
            } else if (state is PhotoLoaded) {
              final photos = state.photos;
              if (photos.isEmpty) {
                return const Center(child: Text('No items found'));
              }
              final groupedPhotos = groupPhotosByAlphabet(photos);

              return ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView.builder(
                      itemCount: groupedPhotos.length,
                      itemBuilder: (context, index) {
                        final group = groupedPhotos[index];
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  // Adjust the width as necessary
                                  margin:
                                      const EdgeInsets.only(top: 5, right: 5),
                                  // Adjust the margin as necessary
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:
                                        group['photos'].map<Widget>((photo) {
                                      return CustomCard(photo: photo);
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
      ),
    );
  }
}
