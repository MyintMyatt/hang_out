
import 'package:flutter/foundation.dart';
import 'package:hang_out/admin/models/menu_model.dart';
import 'package:firebase_database/firebase_database.dart';

class MenuProvider extends ChangeNotifier{
  List<Menu> _menus = [];
  List<Menu> get menus => _menus;

  final DatabaseReference  _menuRef = FirebaseDatabase.instance.ref('menus');

  MenuProvider(){
    _listenToMenus();
  }

  void _listenToMenus() async{
    _menuRef.onValue.listen((event){
      final data = event.snapshot.value;
      print('data => $data');
      if (data == null || data is! Map) {
        _menus = [];
        notifyListeners();
        return;
      }
      if(data != null){
        _menus = data.entries.map((entry){
          return Menu.fromMap(entry.key, Map<String,dynamic>.from(entry.value));
        }).toList();
      }else{
        _menus = [];
      }
      notifyListeners();
    });
  }

  Future<void> addNewMenu(Menu menu) async{
    await _menuRef.child(menu.menuName).set(menu.toMap());
  }


}