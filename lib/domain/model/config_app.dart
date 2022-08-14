class ConfigApp {
  bool? isShowAds;
  bool? isShowBanner;
  bool? isShowInter;
  bool? isShowNative;
  bool? isShowRewards;
  bool? isReviewMode;
  bool? isMustUpdate;
  List<PromoHomePage>? promoHomePage;
  String? adsBanner;
  String? adsInter;
  String? adsNative;
  String? adsRewards;
  String? statusApp;
  String? sId;
  String? packageName;
  bool? isShowImage;
  bool? newVersionHasRelease;
  int? submitVersion;
  bool? isTestAds;
  int? modeAds;
  bool? isCanWatch;
  bool? isOnRedirect;
  String? urlRedirect;
  String? startAppId;
  String? sdkKeyAppLovin;
  String? appLovinInter;
  String? appLovinBanner;
  int? intervalInt;
  String? appLovinReward;
  String? admobBannerId;
  String? admobInterId;
  String? applovinNative;
  String? admobRewardId;
  String? createdAt;
  String? updatedAt;
  String? admobNativeId;
  String? admobOpenAppId;
  int? infoAppID;
  String? urlPostPlayer;

  ConfigApp(
      {this.isShowAds,
      this.isShowBanner,
      this.isShowInter,
      this.isShowNative,
      this.isShowRewards,
      this.isReviewMode,
      this.isMustUpdate,
      this.promoHomePage,
      this.adsBanner,
      this.adsInter,
      this.adsNative,
      this.adsRewards,
      this.statusApp,
      this.sId,
      this.packageName,
      this.isShowImage,
      this.newVersionHasRelease,
      this.submitVersion,
      this.isTestAds,
      this.modeAds,
      this.isCanWatch,
      this.isOnRedirect,
      this.urlRedirect,
      this.startAppId,
      this.sdkKeyAppLovin,
      this.appLovinInter,
      this.appLovinBanner,
      this.intervalInt,
      this.appLovinReward,
      this.applovinNative,
      this.admobBannerId,
      this.admobInterId,
      this.admobRewardId,
      this.createdAt,
      this.updatedAt,
      this.admobNativeId,
      this.admobOpenAppId,
      this.infoAppID,
      this.urlPostPlayer});

  ConfigApp.fromJson(Map<String, dynamic> json) {
    isShowAds = json['isShowAds'];
    isShowBanner = json['isShowBanner'];
    isShowInter = json['isShowInter'];
    isShowNative = json['isShowNative'];
    isShowRewards = json['isShowRewards'];
    isReviewMode = json['isReviewMode'];
    isMustUpdate = json['isMustUpdate'];
    if (json['promoHomePage'] != null) {
      promoHomePage = <PromoHomePage>[];
      json['promoHomePage'].forEach((v) {
        promoHomePage!.add(PromoHomePage.fromJson(v));
      });
    }
    adsBanner = json['adsBanner'];
    adsInter = json['adsInter'];
    adsNative = json['adsNative'];
    adsRewards = json['adsRewards'];
    statusApp = json['statusApp'];
    sId = json['_id'];
    packageName = json['packageName'];
    isShowImage = json['isShowImage'];
    newVersionHasRelease = json['newVersionHasRelease'];
    submitVersion = json['submitVersion'];
    isTestAds = json['isTestAds'];
    modeAds = json['modeAds'];
    isCanWatch = json['isCanWatch'];
    isOnRedirect = json['isOnRedirect'];
    urlRedirect = json['urlRedirect'];
    startAppId = json['startAppId'];
    sdkKeyAppLovin = json['sdkKeyAppLovin'];
    appLovinInter = json['appLovinInter'];
    appLovinBanner = json['appLovinBanner'];
    intervalInt = json['intervalInt'];
    applovinNative = json['applovinNative'];
    appLovinReward = json['appLovinReward'];
    admobBannerId = json['admobBannerId'];
    admobInterId = json['admobInterId'];
    admobRewardId = json['admobRewardId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    admobNativeId = json['admobNativeId'];
    admobOpenAppId = json['admobOpenAppId'];
    infoAppID = json['infoAppID'];
    urlPostPlayer = json['urlPostPlayer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isShowAds'] = isShowAds;
    data['isShowBanner'] = isShowBanner;
    data['isShowInter'] = isShowInter;
    data['isShowNative'] = isShowNative;
    data['isShowRewards'] = isShowRewards;
    data['isReviewMode'] = isReviewMode;
    data['isMustUpdate'] = isMustUpdate;
    if (promoHomePage != null) {
      data['promoHomePage'] = promoHomePage!.map((v) => v.toJson()).toList();
    }
    data['adsBanner'] = adsBanner;
    data['adsInter'] = adsInter;
    data['adsNative'] = adsNative;
    data['adsRewards'] = adsRewards;
    data['statusApp'] = statusApp;
    data['_id'] = sId;
    data['packageName'] = packageName;
    data['isShowImage'] = isShowImage;
    data['newVersionHasRelease'] = newVersionHasRelease;
    data['submitVersion'] = submitVersion;
    data['isTestAds'] = isTestAds;
    data['modeAds'] = modeAds;
    data['isCanWatch'] = isCanWatch;
    data['isOnRedirect'] = isOnRedirect;
    data['urlRedirect'] = urlRedirect;
    data['startAppId'] = startAppId;
    data['sdkKeyAppLovin'] = sdkKeyAppLovin;
    data['appLovinInter'] = appLovinInter;
    data['appLovinBanner'] = appLovinBanner;
    data['intervalInt'] = intervalInt;
    data['appLovinReward'] = appLovinReward;
    data['applovinNative'] = applovinNative;
    data['admobBannerId'] = admobBannerId;
    data['admobInterId'] = admobInterId;
    data['admobRewardId'] = admobRewardId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['admobNativeId'] = admobNativeId;
    data['admobOpenAppId'] = admobOpenAppId;
    data['infoAppID'] = infoAppID;
    data['urlPostPlayer'] = urlPostPlayer;
    return data;
  }
}

class PromoHomePage {
  String? imageUrl;
  String? urlLauncher;

  PromoHomePage({imageUrl, urlLauncher});

  PromoHomePage.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    urlLauncher = json['urlLauncher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['urlLauncher'] = urlLauncher;
    return data;
  }
}
