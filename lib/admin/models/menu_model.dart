class Menu {
  String menuName;
  MenuDetails menuDetails;

  Menu({required this.menuName,required this.menuDetails});

  Map<String, dynamic> toMap(){
    return {
      'menuDetails':menuDetails.toMap()
    };
  }
  
  factory Menu.fromMap(String name, Map<String,dynamic>map){
   // return Menu(menuName: name, menuDetails: MenuDetails.fromMap(map));
    return Menu(
      menuName: name,
      menuDetails: MenuDetails.fromMap(Map<String, dynamic>.from(map['menuDetails'] ?? {})),
    );
  }

}

class MenuDetails {
  String category;
  String imageURL;
  int stock;
  double price;
  String desc;

  MenuDetails({
    required this.category,
    required this.imageURL,
    required this.stock,
    required this.price,
    required this.desc
  });

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'imageURL': imageURL,
      'stock': stock,
      'price': price,
      'desc':desc
    };
  }

  factory MenuDetails.fromMap(Map<String, dynamic> map) {
    return MenuDetails(
      category: map['category']?? '',
      imageURL: map['imageURL'] ?? '',
      stock: map['stock'] ?? 0 as int,
      price:( map['price'] ?? 0 as num).toDouble(),
      desc: map['desc'] ?? ''
    );
  }
}
