import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../app_models/app_enums.dart';
import '../../app_models/music_track_model.dart';
import '../../app_utils/colors.dart';
import '../cubit/dashboard_cubit.dart';
import 'details_screen.dart';

class BookmarkedTracksListPage extends StatefulWidget {
  const BookmarkedTracksListPage({Key? key}) : super(key: key);

  @override
  State<BookmarkedTracksListPage> createState() =>
      _BookmarkedTracksListPageState();
}

class _BookmarkedTracksListPageState extends State<BookmarkedTracksListPage> {
  @override
  void initState() {
    context.read<DashboardCubit>().initializeEventsDataFromLocalStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.bookmarkListLoadingStatus == LoadState.initial ||
            state.bookmarkListLoadingStatus == LoadState.loading) {
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent),
              title: const Text(
                'Saved Tracks',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (ctx, index) {
                double blurRadius = 2.5;
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CupertinoColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.white,
                        blurRadius: blurRadius,
                        spreadRadius: 0.5,
                        offset: Offset(blurRadius, blurRadius),
                      ),
                      BoxShadow(
                        color: CupertinoColors.systemGrey6,
                        blurRadius: blurRadius,
                        spreadRadius: 2.5,
                        offset: Offset(blurRadius, blurRadius),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 100,
                        width: 88,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CupertinoColors.systemGrey4,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 16,
                                width: (size.width - 140),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: CupertinoColors.systemGrey3,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 18,
                                width: (size.width - 140) * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: CupertinoColors.systemGrey2,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: CupertinoColors.systemGrey4,
                                ),
                                height: 18,
                                width: (size.width - 140),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: CupertinoColors.systemGrey4,
                                ),
                                height: 18,
                                width: (size.width - 140) * 0.4,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state.bookmarkListLoadingStatus == LoadState.errorLoading) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () {
                return context
                    .read<DashboardCubit>()
                    .initializeEventsDataFromLocalStorage();
              },
              color: defaultPurpleBlueshColor,
              child: Center(
                child: ListView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: false,
                  children: [
                    SizedBox(height: size.height * 0.3),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: CupertinoColors.systemRed,
                          size: 48,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Error Loading Events, ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: CupertinoColors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Check Your Internet Connection and Try Again.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        double blurRadius = 2.5;
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            title: const Text(
              'Saved Tracks',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () {
              return context
                  .read<DashboardCubit>()
                  .initializeEventsDataFromLocalStorage();
            },
            color: defaultPurpleBlueshColor,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.listOfBookmarkedTracks!.length,
              itemBuilder: (ctx, index) {
                MusicTrackModel event = state.listOfBookmarkedTracks![index];
                return GestureDetector(
                  onTap: () {
                    context
                        .read<DashboardCubit>()
                        .loadEventDetails(event.trackId!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) =>
                              EventDetailsScreen(eventId: event.trackId!)),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CupertinoColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: CupertinoColors.white,
                          blurRadius: blurRadius,
                          spreadRadius: 0.5,
                          offset: Offset(blurRadius, blurRadius),
                        ),
                        BoxShadow(
                          color: CupertinoColors.systemGrey6,
                          blurRadius: blurRadius,
                          spreadRadius: 2.5,
                          offset: Offset(blurRadius, blurRadius),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const Icon(
                              Icons.music_note,
                              size: 48,
                              color: CupertinoColors.systemPurple,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width - 140,
                                child: Text(
                                  '${event.trackName}',
                                  softWrap: true,
                                  maxLines: 5,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'By: ',
                                    softWrap: true,
                                    maxLines: 5,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: CupertinoColors.systemPurple,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${event.artistName}',
                                      softWrap: true,
                                      maxLines: 5,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // const SizedBox(height: 2.5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Album: ',
                                    softWrap: true,
                                    maxLines: 5,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: CupertinoColors.systemPurple,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${event.albumName}',
                                      softWrap: true,
                                      maxLines: 5,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // const SizedBox(height: 8),
                              // RichText(
                              //   text: TextSpan(
                              //     text:
                              //         '${DateFormat('EEEE').format(DateTime.parse(event.updatedTime!))}, ${DateFormat('MMMM').format(DateTime.parse(event.updatedTime!))} ${DateTime.parse(event.updatedTime!).day}',
                              //     style: TextStyle(
                              //       fontSize: 15,
                              //       color: defaultPurpleBlueshColor,
                              //       fontWeight: FontWeight.w400,
                              //     ),
                              //     children: [],
                              //   ),
                              // ),

                              const SizedBox(height: 8),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 140,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Icon(
                                      FontAwesomeIcons.starHalfStroke,
                                      color: CupertinoColors.systemYellow,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 10),
                                    Flexible(
                                      child: Text(
                                        '${event.trackRating}',
                                        softWrap: true,
                                        // overflow: TextOverflow.visible,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: CupertinoColors.systemGreen,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
