import 'package:get/get.dart';

class controllerProduct extends GetxController {
  List<Map<dynamic, dynamic>> saveAllProduct = [];
  List<Map<dynamic, dynamic>> saveAllProductCategory = [];
  List<Map<dynamic, dynamic>> saveMyFavprite = [];
  List<Map<dynamic, dynamic>> saveMyMyCart = [];
  List<Map<dynamic, dynamic>> saveAllCateg = [];
  List<Map<dynamic, dynamic>> saveSearchCateg = [];
  List<Map<dynamic, dynamic>> saveSubCateg = [];
  List<Map<dynamic, dynamic>> saveSubSubCateg = [];
  List<Map<dynamic, dynamic>> saveSubSubSubCateg = [];
  List<Map<dynamic, dynamic>> savepopulerProduct = [];
  List<Map<dynamic, dynamic>> saveNewProduct = [];
  Map<String, dynamic> saveAllSetting = {};
  Map<String, dynamic> saveDetailsProduct = {};
  Map<String, dynamic> saveImageDetails = {};
  var savedeliveryFees;
  var savecartTotal;
  List<Map<dynamic, dynamic>> saveMyOrder = [];
  Map<String, dynamic> saveDetailsOrder = {};
  var listValue, listKey;
  var i;
  void SaveLanguage(string) {
    i = string;
    update();
  }

  SaveValueContact(v) {
    listValue = v;
    update();
  }

  SaveKeyContact(v) {
    listKey = v;
    update();
  }

  SaveAllSetting(v) {
    saveAllSetting = v;
    update();
  }

  SaveDetailsOrder(v) {
    saveDetailsOrder = v;
    update();
  }

  SaveMyOrder(v) {
    saveMyOrder = v;
    update();
  }

  SavecartTotal(v) {
    savecartTotal = v;
    update();
  }

  SavedeliveryFees(v) {
    savedeliveryFees = v;
    update();
  }

  SaveMyMyCart(v) {
    saveMyMyCart = v;
    update();
  }

  SaveAllProductCategory(v) {
    saveAllProductCategory = v;
    update();
  }

  SaveMyFavprite(v) {
    saveMyFavprite = v;
    update();
  }

  SaveSubSubSubCateg(v) {
    saveSubSubSubCateg = v;
    update();
  }

  SaveSearchCateg(v) {
    saveSearchCateg = v;
    update();
  }

  SaveSubSubCateg(v) {
    saveSubSubCateg = v;
    update();
  }

  SaveSubCateg(v) {
    saveSubCateg = v;
    update();
  }

  SaveAllCateg(v) {
    saveAllCateg = v;
    update();
  }

  SaveAllProduct(v) {
    saveAllProduct = v;
    update();
  }

  SaveImageDetails(v) {
    saveImageDetails = v;
    update();
  }

  SaveDetailsProduct(v) {
    saveDetailsProduct = v;
    update();
  }

  SavepopulerProduct(v) {
    savepopulerProduct = v;
    update();
  }

  SaveNewProduct(v) {
    saveNewProduct = v;
    update();
  }
}
