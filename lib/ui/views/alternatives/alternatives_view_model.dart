import 'package:chineseappremover/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chineseappremover/app/router.gr.dart';

class AlternativesViewModel extends BaseViewModel {
  DialogService _dialogService = locator<DialogService>();
  NavigationService _navigationService = locator<NavigationService>();
  List<String> bannedApps = [
    'Video Sharing- TikTok, Kwai, Vigo Video, VFly Status Video, VMate, Likee, U Video, New Video Status',
    'Socia Media- Helo, We Meet',
    'File Transfer- ShareIt, Xender, ES File Explorer',
    'Browser- UC Browser, CM Browers, DU Browser, APUS Browser',
    'Maps- Baidu Map',
    'Online Shopping- Shein, Romwe, Club Factory',
    'Gaming- Clash of Kings, Mobile Legends',
    'Scanning- CamScanner',
    'Photo Editing- Beauty Plus, YouCam makeup, Wonder Camera, Photo Wonder, Sweet Selfie, Meitu, SelfieCity',
    'Community- Mi Community',
    'Anti Virus- Virus Cleaner',
    'Messaging- WeChat, QQ International',
    'Video Call- Mi Video Call – Xiaomi',
    'Mail- QQ Mail, Mail Master',
    'Micro-Blogging- Weibo',
    'News - Newsdog, QQ Newsfeed, UC News',
    'Interactive Gaming- Hago- Play with friends',
    'Music- QQ Music',
    'Password Manager- QQ Security Center',
    'Media Player- QQ Player',
    'Translator- Baidu Translate',
    'Launcher- QQ Launcher',
    'Live Tream- Bigo Live',
    'Syncing - WeSync',
    'Video Making- Viva Video – QU Video Inc',
    'App lock- Vault- Hide, DU Privacy',
    'Cache Cleaner- Cache Cleaner DU App studio, DU Cleaner, Clean Master – Cheetah Mobile',
    'Battery Saver- DU Battery Saver',
    'Clone- Parallel Space',
    'Call Recording - DU Recorder',
    'If you have any suggestions for this list or want to add your app to the list contact'
  ];
  List<List<List<String>>> alternativeApps = [
    [
      [
        'Chingari',
        'https://play.google.com/store/apps/details?id=io.chingari.app&hl=en',
      ],
      [
        'Roposo',
        'https://play.google.com/store/apps/details?id=com.roposo.android&hl=en',
      ],
      [
        'Bolo Indya',
        'https://play.google.com/store/apps/details?id=com.boloindya.boloindya&hl=en',
      ],
      [
        'Dubmash',
        'https://play.google.com/store/apps/details?id=com.mobilemotion.dubsmash&hl=en',
      ],
    ],
    [
      [
        'Facebook',
        'https://play.google.com/store/apps/details?id=com.facebook.katana&hl=en',
      ],
      [
        'Instagram',
        'https://play.google.com/store/apps/details?id=com.instagram.android&hl=en',
      ],
      [
        'Snapchat',
        'https://play.google.com/store/apps/details?id=com.snapchat.android&hl=en',
      ],
    ],
    [
      [
        'Files Go',
        'https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&hl=en',
      ],
      [
        'Google Drive',
        'https://play.google.com/store/apps/details?id=com.google.android.apps.docs&hl=en',
      ],
      [
        'Send Anywhere',
        'https://play.google.com/store/apps/details?id=com.estmob.android.sendanywhere&hl=en',
      ],
    ],
    [
      [
        'Google Chrome',
        'https://play.google.com/store/apps/details?id=com.android.chrome&hl=en',
      ],
      [
        'Mozilla Firefox',
        'https://play.google.com/store/apps/details?id=org.mozilla.firefox',
      ],
      [
        'Microsoft Edge',
        'https://play.google.com/store/apps/details?id=com.microsoft.emmx&hl=en',
      ],
    ],
    [
      [
        'Google Maps',
        'https://play.google.com/store/apps/details?id=com.google.android.apps.maps',
      ]
    ],
    [
      [
        'Myntra',
        'https://play.google.com/store/apps/details?id=com.myntra.android',
      ],
      [
        'Amazon India',
        'https://play.google.com/store/apps/details?id=in.amazon.mShop.android.shopping',
      ],
      [
        'Flipkart',
        'https://play.google.com/store/apps/details?id=com.flipkart.android',
      ],
      [
        'Limeroad',
        'https://play.google.com/store/apps/details?id=com.shopping.limeroad',
      ],
    ],
    [
      [
        'Clash of Clans',
        'https://play.google.com/store/apps/details?id=com.supercell.clashofclans',
      ],
      [
        'PUBG',
        'https://play.google.com/store/apps/details?id=com.tencent.ig',
      ],
    ],
    [
      [
        'Adobe Scan',
        'https://play.google.com/store/apps/details?id=com.adobe.scan.android ',
      ],
      [
        'Microsoft Office Lens',
        'https://play.google.com/store/apps/details?id=com.microsoft.office.officelens',
      ],
    ],
    [
      [
        'B612 Beauty & Filter Camerss',
        'https://play.google.com/store/apps/details?id=com.linecorp.b612.android&hl=en',
      ],
      [
        'PicsArt',
        'https://play.google.com/store/apps/details?id=com.picsart.studio',
      ],
      [
        'Snapseed',
        'https://play.google.com/store/apps/details?id=com.niksoftware.snapseed',
      ],
      [
        'Lightroom',
        'hhttps://play.google.com/store/apps/details?id=com.niksoftware.snapseed',
      ],
    ],
    [
      [
        'Twitter',
        'https://play.google.com/store/apps/details?id=com.twitter.android',
      ],
    ],
    [
      [
        'Avast Anti Virus',
        'https://play.google.com/store/apps/details?id=com.avast.android.mobilesecurity',
      ],
    ],
    [
      [
        'Whatsapp',
        'https://play.google.com/store/apps/details?id=com.whatsapp&hl=en',
      ],
      [
        'Facebook Messnger',
        'https://play.google.com/store/apps/details?id=com.facebook.orca',
      ],
      [
        'Hangouts',
        'https://play.google.com/store/apps/details?id=com.google.android.talk',
      ],
    ],
    [
      [
        'Google Duo',
        'https://play.google.com/store/apps/details?id=com.google.android.apps.tachyon',
      ],
      [
        'Whatsapp',
        'https://play.google.com/store/apps/details?id=com.whatsapp&hl=en',
      ],
      [
        'Facebook Messnger',
        'https://play.google.com/store/apps/details?id=com.facebook.orca',
      ],
    ],
    [
      [
        'Gmail',
        'https://play.google.com/store/apps/details?id=com.google.android.gm',
      ],
      [
        'Microsoft Outlook',
        'https://play.google.com/store/apps/details?id=com.microsoft.office.outlook',
      ],
    ],
    [
      [
        'Twitter',
        'https://play.google.com/store/apps/details?id=com.twitter.android',
      ],
    ],
    [
      [
        'Inshorts',
        'https://play.google.com/store/apps/details?id=com.nis.app',
      ],
      [
        'Google News',
        'https://play.google.com/store/apps/details?id=com.google.android.apps.magazines',
      ],
      [
        'Dailyhunt',
        'https://play.google.com/store/apps/details?id=com.eterno',
      ],
    ],
    [
      [
        'Houseparty',
        'https://play.google.com/store/apps/details?id=com.herzick.houseparty',
      ],
    ],
    [
      [
        'Youtube Music',
        'https://play.google.com/store/apps/details?id=com.google.android.apps.youtube.music',
      ],
      [
        'Wynk Music',
        'https://play.google.com/store/apps/details?id=com.bsbportal.music',
      ],
      [
        'Spotify',
        'https://play.google.com/store/apps/details?id=com.spotify.music',
      ],
      [
        'Jio Saavn',
        'https://play.google.com/store/apps/details?id=com.jio.media.jiobeats',
      ],
    ],
    [
      [
        '1Password',
        'https://play.google.com/store/apps/details?id=com.agilebits.onepassword',
      ],
    ],
    [
      [
        'VLC Media Player',
        'https://play.google.com/store/apps/details?id=org.videolan.vlc',
      ],
    ],
    [
      [
        'Google Translate',
        'https://play.google.com/store/apps/details?id=com.google.android.apps.translate',
      ],
    ],
    [
      [
        'Microsoft Launcher',
        'https://play.google.com/store/apps/details?id=com.microsoft.launcher&hl=en',
      ],
    ],
    [
      [
        'Youtube',
        'https://play.google.com/store/apps/details?id=com.google.android.youtube',
      ],
      [
        'Twitch',
        'https://play.google.com/store/apps/details?id=tv.twitch.android.app',
      ],
      [
        'Facebook',
        'https://play.google.com/store/apps/details?id=com.facebook.katana&hl=en',
      ],
    ],
    [
      [
        'Google Contacts',
        'https://play.google.com/store/apps/details?id=com.google.android.contacts',
      ],
    ],
    [
      [
        'Inshots',
        'https://play.google.com/store/apps/details?id=com.camerasideas.instashot',
      ],
    ],
    [
      [
        'Keep Safe',
        'https://play.google.com/store/apps/details?id=com.kii.safe',
      ],
      [
        'App Lock',
        'https://play.google.com/store/apps/details?id=com.sp.protector.free',
      ],
    ],
    [
      [
        'Norton Clean',
        'https://play.google.com/store/apps/details?id=com.symantec.cleansweep',
      ],
      [
        'Ccleaner',
        'https://play.google.com/store/apps/details?id=com.piriform.ccleaner',
      ],
    ],
    [
      [
        'Battery Saver',
        'https://play.google.com/store/apps/details?id=com.apps.batterysaver.batterysaver',
      ],
    ],
    [
      [
        'Multi Parallel - Multiple Accounts & App Clone',
        'https://play.google.com/store/apps/details?id=multi.parallel.dualspace.cloner',
      ],
    ],
    [
      [
        'Automatic Call Recorder',
        'https://play.google.com/store/apps/details?id=com.appstar.callrecorder',
      ],
    ],
    [
      ['nikunjdaskasat@gmail.com', 'mailto:nikunjdaskasat@gmail.com'],
    ]
  ];

  Future launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _dialogService.showDialog(
          title: 'Could not launch $url',
          description: 'Sorry, annot open $url. Please try again later');
    }
  }

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeViewRoute);
  }

  Future navigateToShowAllApps() async {
    await _navigationService.navigateTo(Routes.showAllAppsViewRoute);
  }
}
