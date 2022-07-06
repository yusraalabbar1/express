import 'package:get/get.dart';

class controllerDriver extends GetxController {
  var saveProfileaccessToken;
  List<Map<dynamic, dynamic>> allOrder = [];
  List<Map<dynamic, dynamic>> allOrderVendor = [];
  Map<dynamic, dynamic> detailsOrder = {};
  Map<dynamic, dynamic> detailsOrdervendor = {};
  var saveDriverLogin, saveVendorLogin;
  SaveVendorLogin(v) {
    saveVendorLogin = v;
    update();
  }

  SaveDriverLogin(v) {
    saveDriverLogin = v;
    update();
  }

  SaveProfileaccessToken(v) {
    saveProfileaccessToken = v;
    update();
  }

  SaveAllOrder(v) {
    allOrder = v;
    update();
  }

  SavedetailsOrder(v) {
    detailsOrder = v;
    update();
  }

  SavedVendoretailsOrder(v) {
    detailsOrdervendor = v;
    update();
  }

  SaveAllOrderVendor(v) {
    allOrderVendor = v;
    update();
  }
}
