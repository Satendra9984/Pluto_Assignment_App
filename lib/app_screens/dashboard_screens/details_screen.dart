import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pluto_app_assignment/app_models/lyrics_model.dart';
import 'package:pluto_app_assignment/app_services/db_services.dart';
import '../../app_models/app_enums.dart';
import '../../app_models/music_track_model.dart';
import '../../app_utils/colors.dart';
import '../cubit/dashboard_cubit.dart';

class EventDetailsScreen extends StatelessWidget {
  final num eventId;
  const EventDetailsScreen({
    Key? key,
    required this.eventId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: BlocConsumer<DashboardCubit, DashboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          // debugPrint(state.eventDetailsLoadingStatus.toString());
          if (state.eventDetailsLoadingStatus == LoadState.initial ||
              state.eventDetailsLoadingStatus == LoadState.loading) {
            return Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.28,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: CupertinoColors.systemGrey2),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 36,
                            width: (size.width - 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.systemGrey2,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 42,
                              width: 42,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: CupertinoColors.systemGrey5,
                              ),
                            ),
                            title: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 24,
                              width: (size.width - 140),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CupertinoColors.systemGrey3,
                              ),
                            ),
                            subtitle: Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              height: 20,
                              width: (size.width - 140) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CupertinoColors.systemGrey5,
                              ),
                            ),
                          ),
                          // Date time
                          const SizedBox(height: 15),
                          // Location
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 42,
                              width: 42,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: CupertinoColors.systemGrey5,
                              ),
                            ),
                            title: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 24,
                              width: (size.width - 140),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CupertinoColors.systemGrey3,
                              ),
                            ),
                            subtitle: Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              height: 20,
                              width: (size.width - 140) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CupertinoColors.systemGrey5,
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 42,
                              width: 42,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: CupertinoColors.systemGrey5,
                              ),
                            ),
                            title: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 24,
                              width: (size.width - 140),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CupertinoColors.systemGrey3,
                              ),
                            ),
                            subtitle: Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              height: 20,
                              width: (size.width - 140) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CupertinoColors.systemGrey5,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 38,
                            width: (size.width - 140),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.systemGrey3,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 28,
                            width: (size.width),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.systemGrey3,
                            ),
                          ),
                          const SizedBox(height: 5),

                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 28,
                            width: (size.width),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.systemGrey3,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 28,
                            width: (size.width),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.systemGrey3,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 28,
                            width: (size.width) * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.systemGrey3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state.eventDetailsLoadingStatus ==
              LoadState.errorLoading) {
            return Scaffold(
              body: RefreshIndicator(
                onRefresh: () {
                  return context
                      .read<DashboardCubit>()
                      .refreshEventDetails(eventId);
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

          num index = context.read<DashboardCubit>().getEventDetails(eventId);
          MusicTrackModel eventModel = state.listOfCachedEvents![index.toInt()];

          bool isBookmarked =
              context.read<DashboardCubit>().isBookmarked(eventModel);

          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<DashboardCubit>()
                        .addTrackLocalStorage(eventModel);
                  },
                  icon: Icon(
                    isBookmarked
                        ? FontAwesomeIcons.solidBookmark
                        : FontAwesomeIcons.bookmark,
                    // color: CupertinoColors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () {
                return context
                    .read<DashboardCubit>()
                    .refreshEventDetails(eventId);
              },
              color: defaultPurpleBlueshColor,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * 0.28,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/disc2.png',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Text(
                            '${eventModel.trackName}',
                            softWrap: true,
                            maxLines: 5,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${eventModel.albumName}',
                            softWrap: true,
                            maxLines: 5,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              text: 'By : ',
                              style: const TextStyle(
                                fontSize: 16,
                                color: CupertinoColors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: '${eventModel.artistName}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: defaultPurpleBlueshColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),

                    /// Lyrics

                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder(
                          future: DatabaseServices().getTrackLyrics(eventId),
                          builder:
                              (context, AsyncSnapshot<LyricsModel?> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              /// data is available to display
                              // getPrettyJSONString(_applicantsDetails);
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Lyrics',
                                      softWrap: true,
                                      maxLines: 5,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      '${snapshot.data?.lyricsBody}',
                                      softWrap: true,
                                      maxLines: 5,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // bottomNavigationBar: Container(
            //   margin: const EdgeInsets.only(
            //       left: 30, right: 30, bottom: 20, top: 10),
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15)),
            //       backgroundColor: defaultPurpleBlueshColor,
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         CircleAvatar(backgroundColor: defaultPurpleBlueshColor),
            //         const Text(
            //           'BOOK NOW',
            //           style: TextStyle(
            //             fontWeight: FontWeight.w500,
            //             fontSize: 18,
            //             color: CupertinoColors.white,
            //           ),
            //         ),
            //         CircleAvatar(
            //           backgroundColor: defaultPurpleBlueshColor,
            //           child: const Icon(
            //             Icons.arrow_forward,
            //             color: CupertinoColors.white,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
