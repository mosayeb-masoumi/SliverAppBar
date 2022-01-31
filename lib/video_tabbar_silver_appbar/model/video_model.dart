class VideoModel {
  final String videoTitle;
  final String videoUrl;
  final String cover;
  Duration? lastPosition;
  bool? wasPlaying = false;

  VideoModel(this.videoTitle, this.videoUrl, this.cover);
}