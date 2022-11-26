import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MobileAds.instance.initialize().then((initializationStatus) {
    initializationStatus.adapterStatuses.forEach((key, value) {
      debugPrint('Adapter status for $key: ${value.description}');
    });
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tweet Supporter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState get createState => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _tweet() async {
    final Map<String, dynamic> tweetQuery = {
      "text":
          "⚽️『ブルーロック』クイズアプリ(非公式)✨\n\n①各章ごとのクイズが出来ます\n②成績がいいとBLランキング上がります\n③作品中の名言を自動再生で閲覧可能！\n\n📱iPhone\nhttps://apps.apple.com/jp/app/blue-lock-quiz/id1635039927\n\n📱Android\nhttps://play.google.com/store/apps/details?id=com.shun.bl_quiz2\n\n#ブルーロック",
      "url": "https://apps.apple.com/jp/app/blue-lock-quiz/id1635039927",
      "hashtags": const [],
      "via": "",
      "related": "",
    };
    final Uri tweetScheme =
        Uri(scheme: "twitter", host: "post", queryParameters: tweetQuery);

    final Uri tweetIntentUrl =
        Uri.https("twitter.com", "/intent/tweet", tweetQuery);

    await canLaunch(tweetScheme.toString())
        ? await launch(tweetScheme.toString())
        : await launch(tweetIntentUrl.toString());
  }

  void _tweet2() async {
    final Map<String, dynamic> tweetQuery = {
      "text":
          "『東京リベンジャーズ』　クイズアプリ（非公式）✨\n\nコミックス一巻〜最終章までのクイズ多数収録！🤗\n『パーちんの脳みそはミジ○コだぞ　オラァ』🙍‍️\n\n📱iPhone版↓\nhttps://apps.apple.com/jp/app/id1578497520\n\n#東京リベンジャーズ\n#東リベ\n#東卍試験\n#アプリ",
      "url": "https://apps.apple.com/jp/app/id1578497520",
      "hashtags": const ["#東卍試験", "#東京リベンジャーズ", "#クイズアプリ"],
      "via": "",
      "related": "",
    };
    final Uri tweetScheme =
        Uri(scheme: "twitter", host: "post", queryParameters: tweetQuery);

    final Uri tweetIntentUrl =
        Uri.https("twitter.com", "/intent/tweet", tweetQuery);

    await canLaunch(tweetScheme.toString())
        ? await launch(tweetScheme.toString())
        : await launch(tweetIntentUrl.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo, //ボタンの背景色
                onPrimary: Colors.black, //押したときの色！！
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                _tweet();
              },
              label: Text('青い監獄クイズ　Tweet',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  )),
              icon: Icon(LineIcons.twitter, size: 34, color: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, //ボタンの背景色
                onPrimary: Colors.black, //押したときの色！！
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                _tweet2();
              },
              label: Text('東卍試験　Tweet',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  )),
              icon: Icon(LineIcons.twitter, size: 34, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
