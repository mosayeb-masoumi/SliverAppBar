class VideoModelItem2{
  final String videoTitle;
  final String videoUrl;
  final String cover;
  Duration? lastPosition;
  bool? wasPlaying = false;

  VideoModelItem2(this.videoTitle, this.videoUrl, this.cover);
}