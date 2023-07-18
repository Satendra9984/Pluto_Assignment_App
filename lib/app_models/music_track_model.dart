class MusicTrackModel {
  int? _trackId;
  String? _trackName;
  List<Map<dynamic, dynamic>>? _trackNameTranslationList;
  int? _trackRating;
  int? _commontrackId;
  int? _instrumental;
  int? _explicit;
  int? _hasLyrics;
  int? _hasSubtitles;
  int? _hasRichsync;
  int? _numFavourite;
  int? _albumId;
  String? _albumName;
  int? _artistId;
  String? _artistName;
  String? _trackShareUrl;
  String? _trackEditUrl;
  int? _restricted;
  String? _updatedTime;
  PrimaryGenres? _primaryGenres;

  MusicTrackModel(
      {int? trackId,
      String? trackName,
      List<Map<String, dynamic>>? trackNameTranslationList,
      int? trackRating,
      int? commontrackId,
      int? instrumental,
      int? explicit,
      int? hasLyrics,
      int? hasSubtitles,
      int? hasRichsync,
      int? numFavourite,
      int? albumId,
      String? albumName,
      int? artistId,
      String? artistName,
      String? trackShareUrl,
      String? trackEditUrl,
      int? restricted,
      String? updatedTime,
      PrimaryGenres? primaryGenres}) {
    if (trackId != null) {
      this._trackId = trackId;
    }
    if (trackName != null) {
      this._trackName = trackName;
    }
    if (trackNameTranslationList != null) {
      this._trackNameTranslationList = trackNameTranslationList;
    }
    if (trackRating != null) {
      this._trackRating = trackRating;
    }
    if (commontrackId != null) {
      this._commontrackId = commontrackId;
    }
    if (instrumental != null) {
      this._instrumental = instrumental;
    }
    if (explicit != null) {
      this._explicit = explicit;
    }
    if (hasLyrics != null) {
      this._hasLyrics = hasLyrics;
    }
    if (hasSubtitles != null) {
      this._hasSubtitles = hasSubtitles;
    }
    if (hasRichsync != null) {
      this._hasRichsync = hasRichsync;
    }
    if (numFavourite != null) {
      this._numFavourite = numFavourite;
    }
    if (albumId != null) {
      this._albumId = albumId;
    }
    if (albumName != null) {
      this._albumName = albumName;
    }
    if (artistId != null) {
      this._artistId = artistId;
    }
    if (artistName != null) {
      this._artistName = artistName;
    }
    if (trackShareUrl != null) {
      this._trackShareUrl = trackShareUrl;
    }
    if (trackEditUrl != null) {
      this._trackEditUrl = trackEditUrl;
    }
    if (restricted != null) {
      this._restricted = restricted;
    }
    if (updatedTime != null) {
      this._updatedTime = updatedTime;
    }
    if (primaryGenres != null) {
      this._primaryGenres = primaryGenres;
    }
  }

  int? get trackId => _trackId;
  set trackId(int? trackId) => _trackId = trackId;
  String? get trackName => _trackName;
  set trackName(String? trackName) => _trackName = trackName;
  List<Map<dynamic, dynamic>>? get trackNameTranslationList =>
      _trackNameTranslationList;
  set trackNameTranslationList(
          List<Map<dynamic, dynamic>>? trackNameTranslationList) =>
      _trackNameTranslationList = trackNameTranslationList;
  int? get trackRating => _trackRating;
  set trackRating(int? trackRating) => _trackRating = trackRating;
  int? get commontrackId => _commontrackId;
  set commontrackId(int? commontrackId) => _commontrackId = commontrackId;
  int? get instrumental => _instrumental;
  set instrumental(int? instrumental) => _instrumental = instrumental;
  int? get explicit => _explicit;
  set explicit(int? explicit) => _explicit = explicit;
  int? get hasLyrics => _hasLyrics;
  set hasLyrics(int? hasLyrics) => _hasLyrics = hasLyrics;
  int? get hasSubtitles => _hasSubtitles;
  set hasSubtitles(int? hasSubtitles) => _hasSubtitles = hasSubtitles;
  int? get hasRichsync => _hasRichsync;
  set hasRichsync(int? hasRichsync) => _hasRichsync = hasRichsync;
  int? get numFavourite => _numFavourite;
  set numFavourite(int? numFavourite) => _numFavourite = numFavourite;
  int? get albumId => _albumId;
  set albumId(int? albumId) => _albumId = albumId;
  String? get albumName => _albumName;
  set albumName(String? albumName) => _albumName = albumName;
  int? get artistId => _artistId;
  set artistId(int? artistId) => _artistId = artistId;
  String? get artistName => _artistName;
  set artistName(String? artistName) => _artistName = artistName;
  String? get trackShareUrl => _trackShareUrl;
  set trackShareUrl(String? trackShareUrl) => _trackShareUrl = trackShareUrl;
  String? get trackEditUrl => _trackEditUrl;
  set trackEditUrl(String? trackEditUrl) => _trackEditUrl = trackEditUrl;
  int? get restricted => _restricted;
  set restricted(int? restricted) => _restricted = restricted;
  String? get updatedTime => _updatedTime;
  set updatedTime(String? updatedTime) => _updatedTime = updatedTime;
  PrimaryGenres? get primaryGenres => _primaryGenres;
  set primaryGenres(PrimaryGenres? primaryGenres) =>
      _primaryGenres = primaryGenres;

  MusicTrackModel.fromJson(Map<dynamic, dynamic> json) {
    _trackId = json['track_id'];
    _trackName = json['track_name'];
    if (json['track_name_translation_list'] != null) {
      _trackNameTranslationList = <Map<dynamic, dynamic>>[];
      json['track_name_translation_list'].forEach((v) {
        _trackNameTranslationList!.add((v));
      });
    }
    _trackRating = json['track_rating'];
    _commontrackId = json['commontrack_id'];
    _instrumental = json['instrumental'];
    _explicit = json['explicit'];
    _hasLyrics = json['has_lyrics'];
    _hasSubtitles = json['has_subtitles'];
    _hasRichsync = json['has_richsync'];
    _numFavourite = json['num_favourite'];
    _albumId = json['album_id'];
    _albumName = json['album_name'];
    _artistId = json['artist_id'];
    _artistName = json['artist_name'];
    _trackShareUrl = json['track_share_url'];
    _trackEditUrl = json['track_edit_url'];
    _restricted = json['restricted'];
    _updatedTime = json['updated_time'];
    _primaryGenres = json['primary_genres'] != null
        ? new PrimaryGenres.fromJson(json['primary_genres'])
        : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_id'] = this._trackId;
    data['track_name'] = this._trackName;
    if (this._trackNameTranslationList != null) {
      data['track_name_translation_list'] =
          this._trackNameTranslationList!.map((v) => v).toList();
    }
    data['track_rating'] = this._trackRating;
    data['commontrack_id'] = this._commontrackId;
    data['instrumental'] = this._instrumental;
    data['explicit'] = this._explicit;
    data['has_lyrics'] = this._hasLyrics;
    data['has_subtitles'] = this._hasSubtitles;
    data['has_richsync'] = this._hasRichsync;
    data['num_favourite'] = this._numFavourite;
    data['album_id'] = this._albumId;
    data['album_name'] = this._albumName;
    data['artist_id'] = this._artistId;
    data['artist_name'] = this._artistName;
    data['track_share_url'] = this._trackShareUrl;
    data['track_edit_url'] = this._trackEditUrl;
    data['restricted'] = this._restricted;
    data['updated_time'] = this._updatedTime;
    if (this._primaryGenres != null) {
      data['primary_genres'] = this._primaryGenres!.toJson();
    }
    return data;
  }
}

class PrimaryGenres {
  List<MusicGenreList>? _musicGenreList;

  PrimaryGenres({List<MusicGenreList>? musicGenreList}) {
    if (musicGenreList != null) {
      this._musicGenreList = musicGenreList;
    }
  }

  List<MusicGenreList>? get musicGenreList => _musicGenreList;
  set musicGenreList(List<MusicGenreList>? musicGenreList) =>
      _musicGenreList = musicGenreList;

  PrimaryGenres.fromJson(Map<dynamic, dynamic> json) {
    if (json['music_genre_list'] != null) {
      _musicGenreList = <MusicGenreList>[];
      json['music_genre_list'].forEach((v) {
        _musicGenreList!.add(new MusicGenreList.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._musicGenreList != null) {
      data['music_genre_list'] =
          this._musicGenreList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusicGenreList {
  MusicGenre? _musicGenre;

  MusicGenreList({MusicGenre? musicGenre}) {
    if (musicGenre != null) {
      this._musicGenre = musicGenre;
    }
  }

  MusicGenre? get musicGenre => _musicGenre;
  set musicGenre(MusicGenre? musicGenre) => _musicGenre = musicGenre;

  MusicGenreList.fromJson(Map<dynamic, dynamic> json) {
    _musicGenre = json['music_genre'] != null
        ? new MusicGenre.fromJson(json['music_genre'])
        : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._musicGenre != null) {
      data['music_genre'] = this._musicGenre!.toJson();
    }
    return data;
  }
}

class MusicGenre {
  int? _musicGenreId;
  int? _musicGenreParentId;
  String? _musicGenreName;
  String? _musicGenreNameExtended;
  String? _musicGenreVanity;

  MusicGenre(
      {int? musicGenreId,
      int? musicGenreParentId,
      String? musicGenreName,
      String? musicGenreNameExtended,
      String? musicGenreVanity}) {
    if (musicGenreId != null) {
      this._musicGenreId = musicGenreId;
    }
    if (musicGenreParentId != null) {
      this._musicGenreParentId = musicGenreParentId;
    }
    if (musicGenreName != null) {
      this._musicGenreName = musicGenreName;
    }
    if (musicGenreNameExtended != null) {
      this._musicGenreNameExtended = musicGenreNameExtended;
    }
    if (musicGenreVanity != null) {
      this._musicGenreVanity = musicGenreVanity;
    }
  }

  int? get musicGenreId => _musicGenreId;
  set musicGenreId(int? musicGenreId) => _musicGenreId = musicGenreId;
  int? get musicGenreParentId => _musicGenreParentId;
  set musicGenreParentId(int? musicGenreParentId) =>
      _musicGenreParentId = musicGenreParentId;
  String? get musicGenreName => _musicGenreName;
  set musicGenreName(String? musicGenreName) =>
      _musicGenreName = musicGenreName;
  String? get musicGenreNameExtended => _musicGenreNameExtended;
  set musicGenreNameExtended(String? musicGenreNameExtended) =>
      _musicGenreNameExtended = musicGenreNameExtended;
  String? get musicGenreVanity => _musicGenreVanity;
  set musicGenreVanity(String? musicGenreVanity) =>
      _musicGenreVanity = musicGenreVanity;

  MusicGenre.fromJson(Map<dynamic, dynamic> json) {
    _musicGenreId = json['music_genre_id'];
    _musicGenreParentId = json['music_genre_parent_id'];
    _musicGenreName = json['music_genre_name'];
    _musicGenreNameExtended = json['music_genre_name_extended'];
    _musicGenreVanity = json['music_genre_vanity'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['music_genre_id'] = this._musicGenreId;
    data['music_genre_parent_id'] = this._musicGenreParentId;
    data['music_genre_name'] = this._musicGenreName;
    data['music_genre_name_extended'] = this._musicGenreNameExtended;
    data['music_genre_vanity'] = this._musicGenreVanity;
    return data;
  }
}
