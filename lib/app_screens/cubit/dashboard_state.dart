part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final LoadState listLoadingStatus;
  final LoadState bookmarkListLoadingStatus;

  final List<MusicTrackModel>? listOfEvents;
  final LoadState eventDetailsLoadingStatus;
  final List<MusicTrackModel>? listOfCachedEvents;
  final List<MusicTrackModel>? listOfSearchedEvents;
  final List<MusicTrackModel>? listOfBookmarkedTracks;

  const DashboardState({
    this.listLoadingStatus = LoadState.initial,
    this.bookmarkListLoadingStatus = LoadState.initial,
    this.listOfEvents,
    this.listOfCachedEvents,
    this.eventDetailsLoadingStatus = LoadState.initial,
    this.listOfSearchedEvents,
    this.listOfBookmarkedTracks,
  });

  DashboardState copyWith({
    LoadState? listLoadingStatus,
    LoadState? bookmarkListLoadingStatus,
    List<MusicTrackModel>? listOfEvents,
    LoadState? eventDetailsLoadingStatus,
    List<MusicTrackModel>? listOfCachedEvents,
    List<MusicTrackModel>? listOfSearchedEvents,
    List<MusicTrackModel>? listOfBookmarkedTracks,
  }) {
    return DashboardState(
      listLoadingStatus: listLoadingStatus ?? this.listLoadingStatus,
      bookmarkListLoadingStatus:
          bookmarkListLoadingStatus ?? this.bookmarkListLoadingStatus,
      listOfEvents: listOfEvents ?? this.listOfEvents,
      listOfCachedEvents: listOfCachedEvents ?? this.listOfCachedEvents,
      eventDetailsLoadingStatus:
          eventDetailsLoadingStatus ?? this.eventDetailsLoadingStatus,
      listOfSearchedEvents: listOfSearchedEvents ?? this.listOfSearchedEvents,
      listOfBookmarkedTracks:
          listOfBookmarkedTracks ?? this.listOfBookmarkedTracks,
    );
  }

  @override
  List<Object?> get props => [
        listLoadingStatus,
        bookmarkListLoadingStatus,
        listOfEvents,
        eventDetailsLoadingStatus,
        listOfCachedEvents,
        listOfSearchedEvents,
        listOfBookmarkedTracks,
      ];
}
