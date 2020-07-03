import 'dart:async';
import 'dart:io';

import 'package:chineseappremover/app/locator.dart';
import 'package:chineseappremover/app/router.gr.dart';
import 'package:device_apps/device_apps.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uninstall_apps/uninstall_apps.dart';

class HomeViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();
  List<Application> chineseApps;
  ScreenshotController screenshotController = ScreenshotController();

  Future shareNow() async {
    try {
      File image = await screenshotController.capture();
      await SocialShare.shareOptions(
          "Hey there, I have removed all my chinese apps with this cool Chinese App Remover! You can download it too from playstore: https://play.google.com/store/apps/details?id=com.nikunj.chineseappremover!",
          imagePath: image.path);
    } catch (e) {
      _dialogService.showDialog(
        title: 'Share Failed',
        description:
            'Sorry we could not share right now. Please try again later',
      );
    }
  }

  Future<void> getChineseApps() async {
    setBusy(true);
    List<Application> installedApps =
        await DeviceApps.getInstalledApplications(includeAppIcons: true);
    List<Application> chineseApps = [];
    installedApps.forEach((element) {
      if (chineseAppsPackageNames.indexOf(element.packageName) != -1) {
        chineseApps.add(element);
      }
    });
    this.chineseApps = chineseApps;
    notifyListeners();
    setBusy(false);
  }

  Future uninstallApp(Application app) async {
    var test = await UninstallApps.uninstall(app.packageName);
    if (test != null) {
      chineseApps.remove(app);
      notifyListeners();
    }
  }

  Future navigateToShowAllApps() async {
    await _navigationService.navigateTo(Routes.showAllAppsViewRoute);
  }

  Future navigateToAlternatives() async {
    await _navigationService.navigateTo(Routes.alternativesViewRoute);
  }

  List<String> chineseAppsPackageNames = [
    'com.zhiliaoapp.musically', //TikTok
    'com.lenovo.anyshare.gps', //Shareit
    'com.kwai.video', //Kwai
    'com.UCMobile.intl', //UC Browser- Free & Fast Video Downloader, News App
    'com.uc.browser.en', //UC Mini- Download Video Status & Movies
    'com.ucturbo', //UC Browser Turbo- Fast Download, Secure, Ad Block
    'com.baidu.BaiduMap', //Baidu Map
    'com.zzkko', //Shein
    'com.hcg.cok.gp', //Clash of Kings : The Ramadan event is on going!
    'com.hcg.ctw.gp', //Clash of Kings:The West
    'com.limsky.ramcleaner', //DU battery saver
    'com.DUsavebattery.faster.charge', //DU battery saver
    'app.buzz.share', //Helo
    'video.like', //Likee
    'com.cyberlink.youcammakeup', //YouCam Makeup-Magic Selfie Cam & Virtual Makeovers
    'com.cyberlink.youperfect', //YouCam Perfect - Best Selfie Camera & Photo Editor
    'com.mi.global.bbs', //Mi Community
    'com.ksmobile.cb', //CM Browers
    'phone.antivirus.virus.cleaner.junk.clean.speed.booster.master', //
    'com.apusapps.browser', //APUS Browser
    'com.romwe', //ROMWE
    'club.fromfactory', //Club Factory
    'com.newsdog', //Newsdog
    'com.commsource.beautyplus', //Beutey Plus
    'com.meitu.makeup', //MakeupPlus - Makeup Camera
    'com.tencent.mm', //WeChat
    'com.tencent.wework', //WeChat Work
    'com.uc.iflow', //UC News
    'com.tencent.androidqqmail', //QQ Mail
    'com.weico.international', //Weibo
    'cn.xender', //Xender
    'com.tencent.qqmusic', //QQ Music
    'com.tencent.mobileqq', //QQ
    'com.tencent.mtt.intl', //QQ Newsfeed
    'sg.bigo.live', //BIGO LIVE - Live Stream, Live Video & Live Chat
    'sg.bigo.live.lite', //BIGO LIVE Lite – Live Stream
    'com.meitu.wheecam', //SelfieCity
    'com.mt.mtxx.mtxx', //Meitu - Status Maker, Pic Filter & BeautyCam
    'com.meitu.meiyancamera', //BeautyCam
    'com.meitu.meipaimv', //Meipai
    'com.netease.mail', //Mail Master
    'com.netease.mobimail', //NetEase Mail
    'com.lbe.parallel.intl', //Parallel Space // has more of its kind
    'com.miui.videoplayer', //Mi Video Call – Xiaomi
    'com.jpro.wesync', //WeSync
    'com.File.Manager.Filemanager', //ES File Explorer
    'com.quvideo.xiaoying', //Video Editor & Video Maker - VivaVideo
    'com.quvideo.vivavideo.lite', //VivaVideo Lite: Video Editor & Slideshow Maker
    'com.quvideo.xiaoying.pro', //VivaVideo PRO Video Editor HD
    'com.mt.mtxx.mtxx', //Meitu - Status Maker, Pic Filter & BeautyCam
    'com.ss.android.ugc.boom', //Vigo Video
    'com.DUrecorder.screenrecorder.videorecorde', //DU Recorder
    'com.netqin.ps', //Vault- Hide
    'com.limsky.speedbooster', //DU Speed Booster, Cache Cleaner, Battery saver
    'com.DU.Cleaner.antivirus.cleanbooster', //DU Cleaner – Antivirus, Cache Cleaner & Booster
    'com.DU.antivirus.cleaner.boosterpro', //DU Antivirus Security - Cleaner & Booster
    'com.DUrecorder.screenrecorder.videorecorde', //DU Recorder - Screen Recorder, Video Recorder
    'com.DUcalleradress.trackerlocation.callerid', //DU call
    'com.yy.hiyo', //Hago Play With New Friends
    'com.intsig.camscanner', //CamScanner
    'com.cleanmaster.mguard', //Clean Master – Cheetah Mobile
    'com.yubitu.android.YubiCollage', //Photo Wonder - Collage Maker
    'com.videochat.livechat.wemeet', //WeMeet – Video Chat with Strangers
    'com.baidu.searchbox', //Baidu Translat
    'com.uc.vmate', //Vmate
    'com.uc.vmlite', //VMate Status 2020-Video Status & Status Downloader
    'com.qqeng.online', //QQ English
    'com.selfip.indigotv', //QQ 515
    'sweet.facecamera.selfie', //Sweet Snap Face Camera - filter effect&selfie edit
    'photo.editor.filter.camera', //Beauty Camera - Selfie Camera Plus & Photo Editor
    'sweet.selfie.lite', //Sweet Selfie Lite -Sweet Selfie Camera App
    'com.cam001.selfie', //Sweet Selfie - Beauty Camera & Best Photo Editor
    'com.yubitu.android.YubiCollage', //Photo Wonder - Collage Maker
    'com.kwai.global.video.social.kwaigo', //UVideo - Make Your Life Story into Video Status
    'com.ai.bfly', //VFly-Status Videos, Status Maker, New Video Status
    'com.mobile.legends', //Mobile Legends: Bang Bang
    'com.moonton.mobilehero', //Mobile Legends: Adventure
  ];
}
