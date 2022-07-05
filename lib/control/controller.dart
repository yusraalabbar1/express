import 'package:express/model/api/general/banner.dart';
import 'package:express/utilits/dataBaseHelper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homecontroller extends GetxController {
  final dbHelper = DatabaseHelper.instance;
  int counter = 1;
  var passwordControl;
  var areaControl;
  var cityControl;
  var mobilControl;
  var userNameControl;
  var profImg;
  List<String> bannerImg = [];
  var saveProfileName,
      saveProfilemobile,
      savePassWord,
      saveProfilephotoProfile,
      saveProfiledefaultAddress,
      saveProfiledefaultAddressarea,
      saveProfileaccessToken,
      savePassWordForget,
      saveNumberMobileForget;

  var i;

  List<Map<dynamic, dynamic>> saveContrilerBannerMap = [];
  // void SaveLanguage(string) {
  //   i = string;
  //   update();
  // }
  SaveContrilerBannerMap(v) {
    saveContrilerBannerMap = v;
    update();
  }

  SaveNumberMobileForget(v) {
    saveNumberMobileForget = v;
    update();
  }

  SavePassWordForget(v) {
    savePassWordForget = v;
    update();
  }

  SaveContrilerBannerImage(v) {
    bannerImg = v;
    update();
  }

  SaveProfileName(v) {
    saveProfileName = v;
    update();
  }

  SaveProfilemobile(v) {
    saveProfilemobile = v;
    update();
  }

  SaveProfilephotoProfile(v) {
    if (v == "" ||
        v == " " ||
        v == null ||
        v == "https://myexpress.aqdeveloper.tech/core/public/storage") {
      saveProfilephotoProfile =
          "https://thumbs.dreamstime.com/b/closeup-photo-funny-excited-lady-raise-fists-screaming-loudly-celebrating-money-lottery-winning-wealthy-rich-person-wear-casual-172563278.jpg";
    } else {
      print("image===============================");
      print(v);
      saveProfilephotoProfile = v;
    }
    update();
  }

  SaveProfiledefaultAddress(v) {
    saveProfiledefaultAddress = v;
    update();
  }

  SaveProfiledefaultAddressarea(v) {
    saveProfiledefaultAddressarea = v;
    update();
  }

  SaveProfileaccessToken(v) {
    saveProfileaccessToken = v;
    update();
  }

  void incremental(int c) {
    counter = c;
    counter++;
    print(counter);
    update();
  }

  void decremental(int c) {
    counter = c;
    if (counter > 1) {
      counter--;
      update();
    }
  }

  SavePassWord(v) {
    passwordControl = v;
    update();
  }

  SaveArea(v) {
    areaControl = v;
    update();
  }

  SaveCity(v) {
    cityControl = v;
    update();
  }

  SaveMobil(v) {
    mobilControl = v;
    update();
  }

  SaveUserName(v) {
    userNameControl = v;
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    print("ready home controller");
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print("close home controller");
    super.onClose();
  }
}
