class MusicItemModel {
  final String id;
  final String photoUrl;
  final String musicTitle;
  final String musicFile;
  final String totalStreams;
  final String artistName;
  final String? releaseDate;

  MusicItemModel({
    this.artistName = "Frank Ocean",
    this.musicFile = "assets/music/fk.mp3",
    required this.id,
    required this.photoUrl,
    required this.musicTitle,
    required this.totalStreams,
    this.releaseDate,
  });
}
