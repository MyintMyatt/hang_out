
import 'package:flutter/foundation.dart';

class MenuDetailsValueModel extends ChangeNotifier{

  bool isLoading = false;

  void setLoading(bool loading){
    isLoading = loading;
    notifyListeners();
  }

  String? _menuTitle;
  String? _selectedCategoryValue;
  double? _price;
  int? _stock;
  String? _desc;
  String? _imageURL;


  String? get menuTitle => _menuTitle;
  String? get categoryValue => _selectedCategoryValue;
  double? get price => _price;
  int? get stock => _stock;
  String? get desc => _desc;
  String? get imageURL => _imageURL??'';


  void setMenuTitle({required String value}){
    _menuTitle = value;
    notifyListeners();
  }

  void clearMenuTitle(){
    _menuTitle = null;
    notifyListeners();
  }

  void setPriceValue({required double price}){
    _price = price;
    notifyListeners();
  }

  void clearPriceValue(){
    _price = null;
    notifyListeners();
  }

  void setStockValue({required int? stock}){
    _stock = stock;
    notifyListeners();
  }

  void clearStockValue(){
    _stock = null;
    notifyListeners();
  }

  void setCategoryValue({required String selectedValue}){
    _selectedCategoryValue = selectedValue;
    notifyListeners();
  }

  void clearCategoryValue(){
    _selectedCategoryValue = null;
    notifyListeners();
  }

  void setDescValue({required String desc}){
    _desc = desc;
    notifyListeners();
  }

  void clearDescValue(){
    _desc = null;
    notifyListeners();
  }

  void setImageURLValue({required String url}){
    _imageURL = url;
    notifyListeners();
  }

  void clearImageURLValue(){
    _imageURL = null;
    notifyListeners();
  }

  void cancelAll() {
    _menuTitle = null;
    _selectedCategoryValue = null;
    _price = null;
    _stock = null;
    _desc = null;
    _imageURL = null;
    notifyListeners();
  }


}