



import 'package:silver_app_bar1/video_silver2/model/video_model2.dart';
import 'package:silver_app_bar1/video_silver2/model/video_model_item2.dart';

class VideoRepository2{

  Future<VideoModel2> fetchVideoList(int pageKey, int pageSize) async{

    await Future.delayed(Duration(seconds: 3));

    List<VideoModelItem2> list = [];

    list.add(new VideoModelItem2("title1", "https://media.viders.ir:3030/hls/d1b65110-d885-dc94-63f3-3a00ac6afca7/2022/1/23/3ukea2nxqr5,-360.mp4,.urlset/master.m3u8" ,"https://webkit.org/demos/srcset/image-src.png"));
    list.add(new VideoModelItem2("title2", "https://media.viders.ir:3030/hls/d3b13956-ade4-6a4f-877b-3a0193e013b4/2022/1/23/deerc2ox2il,-360.mp4,-720.mp4,-1080.mp4,.urlset/master.m3u8" ,"https://webkit.org/demos/srcset/image-src.png"));
    list.add(new VideoModelItem2("title3", "https://media.viders.ir:3030/hls/d1b65110-d885-dc94-63f3-3a00ac6afca7/2022/1/23/3ukea2nxqr5,-360.mp4,.urlset/master.m3u8" ,"https://webkit.org/demos/srcset/image-src.png"));

    // list.add(new VideoModelItem2("title4", "https://media.viders.ir:3030/hls/d3b13956-ade4-6a4f-877b-3a0193e013b4/2022/1/23/deerc2ox2il,-360.mp4,-720.mp4,-1080.mp4,.urlset/master.m3u8" ,"https://webkit.org/demos/srcset/image-src.png"));
    // list.add(new VideoModelItem2("title5", "https://media.viders.ir:3030/hls/d1b65110-d885-dc94-63f3-3a00ac6afca7/2022/1/23/3ukea2nxqr5,-360.mp4,.urlset/master.m3u8" ,"https://webkit.org/demos/srcset/image-src.png"));
    // list.add(new VideoModelItem2("title6", "https://media.viders.ir:3030/hls/d3b13956-ade4-6a4f-877b-3a0193e013b4/2022/1/23/deerc2ox2il,-360.mp4,-720.mp4,-1080.mp4,.urlset/master.m3u8" ,"https://webkit.org/demos/srcset/image-src.png"));
    //
    //
    // list.add(new VideoModelItem2("title7", "https://media.viders.ir:3030/hls/d3b13956-ade4-6a4f-877b-3a0193e013b4/2022/1/23/deerc2ox2il,-360.mp4,-720.mp4,-1080.mp4,.urlset/master.m3u8" ,"https://webkit.org/demos/srcset/image-src.png"));
    // list.add(new VideoModelItem2("title8", "https://media.viders.ir:3030/hls/d1b65110-d885-dc94-63f3-3a00ac6afca7/2022/1/23/3ukea2nxqr5,-360.mp4,.urlset/master.m3u8" ,"https://webkit.org/demos/srcset/image-src.png"));
    // list.add(new VideoModelItem2("title9", "https://media.viders.ir:3030/hls/d3b13956-ade4-6a4f-877b-3a0193e013b4/2022/1/23/deerc2ox2il,-360.mp4,-720.mp4,-1080.mp4,.urlset/master.m3u8" ,"https://webkit.org/demos/srcset/image-src.png"));
    //



    // return videoModel2;


    if(pageKey < 12){
      VideoModel2 videoModel2 = VideoModel2(list);
      return videoModel2;
    }

    else{
      list = [];
      VideoModel2 videoModel2 = VideoModel2(list);
      return videoModel2;
    }

  }
}