import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pluto_app_assignment/app_models/lyrics_model.dart';
import 'package:pluto_app_assignment/app_utils/global_functions.dart';
import '../../app_models/app_enums.dart';
import '../../app_models/music_track_model.dart';
import '../../app_services/db_services.dart';
import '../../app_services/hive_services.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  late final LocalStorageServices _localStorageServices;

  DashboardCubit()
      : super(const DashboardState(
          listLoadingStatus: LoadState.initial,
          listOfSearchedEvents: [],
        ));

  Future<void> initializeEventsData() async {
    emit(state.copyWith(listLoadingStatus: LoadState.loading));

    try {
      await LocalStorageServices.instance.init().then((value) {
        _localStorageServices = LocalStorageServices.instance;
      });

      await DatabaseServices().getCharTracksList().then((events) {
        emit(state.copyWith(
          listLoadingStatus: LoadState.loaded,
          listOfEvents: events,
        ));
      });
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(listLoadingStatus: LoadState.errorLoading));
    }
  }

  Future<void> loadEventDetails(num eventId) async {
    emit(state.copyWith(eventDetailsLoadingStatus: LoadState.loading));

    try {
      // Check if already exists in cached events list
      if (state.listOfCachedEvents != null &&
          state.listOfCachedEvents!.isNotEmpty) {
        num index = state.listOfCachedEvents!
            .indexWhere((element) => element.trackId == eventId);
        if (index != -1) {
          emit(state.copyWith(eventDetailsLoadingStatus: LoadState.loaded));
          return;
        }
      }

      await DatabaseServices().getEventDetails(eventId).then((event) async {
        event;
        if (event == null) {
          emit(state.copyWith(
              eventDetailsLoadingStatus: LoadState.errorLoading));
          return;
        }

        emit(state.copyWith(
          eventDetailsLoadingStatus: LoadState.loaded,
          listOfCachedEvents: [...?state.listOfCachedEvents, event],
        ));
      });
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(listLoadingStatus: LoadState.errorLoading));
    }
  }

  Future<void> refreshEventDetails(num eventId) async {
    emit(state.copyWith(eventDetailsLoadingStatus: LoadState.loading));

    try {
      // Check if already exists in cached events list
      await DatabaseServices().getEventDetails(eventId).then((event) {
        if (event == null) {
          emit(state.copyWith(
              eventDetailsLoadingStatus: LoadState.errorLoading));
          return;
        }
        emit(state.copyWith(
          eventDetailsLoadingStatus: LoadState.loaded,
          listOfCachedEvents: [...?state.listOfCachedEvents, event],
        ));
      });
    } catch (e) {
      emit(state.copyWith(eventDetailsLoadingStatus: LoadState.errorLoading));
    }
  }

  /// Tracks From Local Storage
  Future<void> initializeEventsDataFromLocalStorage() async {
    emit(state.copyWith(bookmarkListLoadingStatus: LoadState.loading));

    // try {
    if (state.listOfBookmarkedTracks != null &&
        state.listOfBookmarkedTracks!.isNotEmpty) {
      emit(state.copyWith(bookmarkListLoadingStatus: LoadState.loaded));
      return;
    }
    List<MusicTrackModel> tracks = [];
    dynamic storedTrackId = _localStorageServices.getAllItems();

    for (dynamic track in storedTrackId) {
      Map<dynamic, dynamic> eventJson = Map<dynamic, dynamic>.from(track);
      MusicTrackModel model = MusicTrackModel.fromJson(eventJson);
      tracks.add(model);
    }
    emit(state.copyWith(
      listOfBookmarkedTracks: tracks,
      bookmarkListLoadingStatus: LoadState.loaded,
    ));
    // } catch (e) {
    //   debugPrint(e.toString());
    //   emit(state.copyWith(bookmarkListLoadingStatus: LoadState.errorLoading));
    // }
  }

  Future<void> addTrackLocalStorage(MusicTrackModel trackModel) async {
    try {
      // Check if already exists in cached events list
      if (state.listOfBookmarkedTracks == null ||
          state.listOfBookmarkedTracks!.isEmpty) {
        emit(state.copyWith(listOfBookmarkedTracks: [
          ...?state.listOfBookmarkedTracks,
          trackModel
        ]));
        await _localStorageServices.addItem(trackModel.toJson());
        // await _localStorageServices.getAllItems();
      } else {
        bool contains = state.listOfBookmarkedTracks!.contains(trackModel);
        if (contains) {
          return;
        }
        emit(state.copyWith(listOfBookmarkedTracks: [
          ...?state.listOfBookmarkedTracks,
          trackModel
        ]));
        await _localStorageServices.addItem(trackModel.toJson());
        // await _localStorageServices.getAllItems();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool isBookmarked(MusicTrackModel trackModel) {
    if (state.listOfBookmarkedTracks == null ||
        state.listOfBookmarkedTracks!.isEmpty) {
      return false;
    } else {
      int index = state.listOfBookmarkedTracks!
          .indexWhere((element) => element.trackId == trackModel.trackId);
      if (index == -1) {
        return false;
      }
      return true;
    }
  }

  num getEventDetails(num eventId) {
    num index = -1;
    try {
      // Check if already exists in cached events list
      index = state.listOfCachedEvents!
          .indexWhere((element) => element.trackId == eventId);
    } catch (e) {
      emit(state.copyWith(listLoadingStatus: LoadState.errorLoading));
    }
    return index;
  }

  @override
  Future<void> close() async {
    await LocalStorageServices.instance.closeBox();
    return super.close();
  }
}
