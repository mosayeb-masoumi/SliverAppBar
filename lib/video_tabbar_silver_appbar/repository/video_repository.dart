import 'package:silver_app_bar1/video_tabbar_silver_appbar/model/video_List_model.dart';
import 'package:silver_app_bar1/video_tabbar_silver_appbar/model/video_model.dart';

class VideoRepository{

  Future<VideoListData> fetchVideoList(int pageKey, int pageSize) async{

    await Future.delayed(Duration(seconds: 1));

    List<VideoModel> list = [];
    list.add(new VideoModel("title1", "https://media.viders.ir:3030/hls/d1b65110-d885-dc94-63f3-3a00ac6afca7/2022/1/23/3ukea2nxqr5,-360.mp4,.urlset/master.m3u8" ,"https://webkit.org/demos/srcset/image-src.png"));
    list.add(new VideoModel("title2", "https://media.viders.ir:3030/hls/d3b13956-ade4-6a4f-877b-3a0193e013b4/2022/1/23/deerc2ox2il,-360.mp4,-720.mp4,-1080.mp4,.urlset/master.m3u8" ,"https://webkit.org/demos/srcset/image-src.png"));
    list.add(new VideoModel("title3", "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4" ,"https://webkit.org/demos/srcset/image-src.png"));

    list.add(new VideoModel("title1", "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4" ,"https://webkit.org/demos/srcset/image-src.png"));
    list.add(new VideoModel("title2", "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4" ,"https://webkit.org/demos/srcset/image-src.png"));
    list.add(new VideoModel("title3", "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" ,"https://webkit.org/demos/srcset/image-src.png"));

    list.add(new VideoModel("title1", "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4" ,"https://webkit.org/demos/srcset/image-src.png"));
    list.add(new VideoModel("title2", "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4" ,"https://webkit.org/demos/srcset/image-src.png"));
    list.add(new VideoModel("title3", "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" ,"https://webkit.org/demos/srcset/image-src.png"));


    VideoListData videoListModel = VideoListData(list);
    return videoListModel;

  }
}