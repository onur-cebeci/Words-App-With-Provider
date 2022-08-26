import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper {
  InterstitialAd? _interstitialAd;

  int num_of_attemplt_load = 0;

  static initializeation() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
    MobileAds.instance.initialize();
  }

  void createIntertitialAd() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-3940256099942544~3347511713",
        request: AdRequest(),
        adLoadCallback:
            InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          num_of_attemplt_load = 0;
        }, onAdFailedToLoad: (LoadAdError error) {
          num_of_attemplt_load + 1;
          _interstitialAd = null;

          if (num_of_attemplt_load <= 2) {
            createIntertitialAd();
          }
        }));
  }

  void showIntertitialAd() {
    if (_interstitialAd == null) {
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {
      print("ad onAdshowedFullscreen");
    }, onAdDismissedFullScreenContent: (InterstitialAd ad) {
      print("ad Disposed");
      ad.dispose();
    }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
      print("$ad OnAdFailed $error");
      ad.dispose();
      createIntertitialAd();
    });

    _interstitialAd!.show();
    _interstitialAd = null;
  }
}
