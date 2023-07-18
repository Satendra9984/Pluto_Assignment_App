import 'package:flutter/cupertino.dart';
import 'package:pluto_app_assignment/app_models/lyrics_model.dart';
import 'package:pluto_app_assignment/app_models/music_track_model.dart';
import 'package:pluto_app_assignment/app_utils/global_functions.dart';

import '../app_models/event_model.dart';
import 'http_services.dart';

class DatabaseServices {
  static const String _API_KEY = '6b3cd5a4972dc0fd8ee2f4fc83390969';

  static const String _baseUrl = 'https://api.musixmatch.com/ws/1.1/';

  Future<List<MusicTrackModel>> getCharTracksList() async {
    List<MusicTrackModel> eventList = [];

    // https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=$6b3cd5a4972dc0fd8ee2f4fc83390969

    await HttpServices.sendGetReq('$_baseUrl/chart.tracks.get?apikey=$_API_KEY')
        .then((list) {
      if (list == null) {
        return;
      }
      List<dynamic> data = list['message']['body']['track_list'];
      for (dynamic eventData in data) {
        Map<String, dynamic> eventJson =
            Map<String, dynamic>.from(eventData['track']);
        try {
          MusicTrackModel model = MusicTrackModel.fromJson(eventJson);
          eventList.add(model);
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    });
    // debugPrint(eventList.length.toString());
    return eventList;
  }

  Future<MusicTrackModel?> getEventDetails(num id) async {
    MusicTrackModel? event;

    // https://api.musixmatch.com/ws/1.1/track.get?track_id=TRACK_ID&apikey=6b3cd5a4972dc0fd8ee2f4fc83390969

    await HttpServices.sendGetReq(
            '$_baseUrl/track.get?track_id=$id&apikey=$_API_KEY')
        .then((eventRest) {
      eventRest;
      if (eventRest == null) {
        return;
      }

      dynamic data = eventRest['message']['body']['track'];
      Map<String, dynamic> eventJson = Map<String, dynamic>.from(data);
      event = MusicTrackModel.fromJson(eventJson);
    });
    // event;
    return event;
  }

  Future<LyricsModel?> getTrackLyrics(num id) async {
    LyricsModel? lyrics;

    // https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=251642586&apikey=6b3cd5a4972dc0fd8ee2f4fc83390969
    await HttpServices.sendGetReq(
            '$_baseUrl/track.lyrics.get?track_id=$id&apikey=$_API_KEY')
        .then((eventRest) {
      eventRest;
      if (eventRest == null) {
        return;
      }

      // debugPrint(getPrettyJSONString(eventRest));

      dynamic data = eventRest['message']['body']['lyrics'];
      Map<String, dynamic> eventJson = Map<String, dynamic>.from(data);
      lyrics = LyricsModel.fromJson(eventJson);
    });
    // event;
    return lyrics;
  }
}
