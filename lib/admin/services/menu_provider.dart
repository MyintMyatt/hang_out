
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
    print('🟡 Listening to Firebase...');
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

  // Future<void> addNewMenu(Menu menu) async{
  //   await _menuRef.child(menu.menuName).set(menu.toMap());
  // }

  Future<void> addNewMenu(Menu menu) async {
    try {
      final stopwatch = Stopwatch()..start();
      print('🟡 Start writing to Firebase...');

      await _menuRef.child(menu.menuName).set(menu.toMap());

      stopwatch.stop();
      print('✅ Firebase write complete in ${stopwatch.elapsedMilliseconds}ms');
    } catch (e) {
      print('❌ Error writing to Firebase: $e');
    }
  }


  Future<void> test() async{
    print('start');
    await _menuRef.child('test_menu').set({'foo': 'bar'});
    print('Test write complete');

  }

}