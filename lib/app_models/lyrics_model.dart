class LyricsModel {
  int? _lyricsId;
  int? _explicit;
  String? _lyricsBody;
  String? _scriptTrackingUrl;
  String? _pixelTrackingUrl;
  String? _lyricsCopyright;
  String? _updatedTime;

  LyricsModel(
      {int? lyricsId,
      int? explicit,
      String? lyricsBody,
      String? scriptTrackingUrl,
      String? pixelTrackingUrl,
      String? lyricsCopyright,
      String? updatedTime}) {
    if (lyricsId != null) {
      this._lyricsId = lyricsId;
    }
    if (explicit != null) {
      this._explicit = explicit;
    }
    if (lyricsBody != null) {
      this._lyricsBody = lyricsBody;
    }
    if (scriptTrackingUrl != null) {
      this._scriptTrackingUrl = scriptTrackingUrl;
    }
    if (pixelTrackingUrl != null) {
      this._pixelTrackingUrl = pixelTrackingUrl;
    }
    if (lyricsCopyright != null) {
      this._lyricsCopyright = lyricsCopyright;
    }
    if (updatedTime != null) {
      this._updatedTime = updatedTime;
    }
  }

  int? get lyricsId => _lyricsId;
  set lyricsId(int? lyricsId) => _lyricsId = lyricsId;
  int? get explicit => _explicit;
  set explicit(int? explicit) => _explicit = explicit;
  String? get lyricsBody => _lyricsBody;
  set lyricsBody(String? lyricsBody) => _lyricsBody = lyricsBody;
  String? get scriptTrackingUrl => _scriptTrackingUrl;
  set scriptTrackingUrl(String? scriptTrackingUrl) =>
      _scriptTrackingUrl = scriptTrackingUrl;
  String? get pixelTrackingUrl => _pixelTrackingUrl;
  set pixelTrackingUrl(String? pixelTrackingUrl) =>
      _pixelTrackingUrl = pixelTrackingUrl;
  String? get lyricsCopyright => _lyricsCopyright;
  set lyricsCopyright(String? lyricsCopyright) =>
      _lyricsCopyright = lyricsCopyright;
  String? get updatedTime => _updatedTime;
  set updatedTime(String? updatedTime) => _updatedTime = updatedTime;

  LyricsModel.fromJson(Map<String, dynamic> json) {
    _lyricsId = json['lyrics_id'];
    _explicit = json['explicit'];
    _lyricsBody = json['lyrics_body'];
    _scriptTrackingUrl = json['script_tracking_url'];
    _pixelTrackingUrl = json['pixel_tracking_url'];
    _lyricsCopyright = json['lyrics_copyright'];
    _updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lyrics_id'] = this._lyricsId;
    data['explicit'] = this._explicit;
    data['lyrics_body'] = this._lyricsBody;
    data['script_tracking_url'] = this._scriptTrackingUrl;
    data['pixel_tracking_url'] = this._pixelTrackingUrl;
    data['lyrics_copyright'] = this._lyricsCopyright;
    data['updated_time'] = this._updatedTime;
    return data;
  }
}
