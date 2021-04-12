class Item {
  final String uid;
  final String name;
  final int price;
  final int category;
  final String traderName;
  final String icon;

  Item(
      {this.uid,
      this.name,
      this.price,
      this.category,
      this.traderName,
      this.icon});

  factory Item.fromJson(Map<String, dynamic> json) {
    return new Item(
      uid: json['uid'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      category: json['category'] as int,
      traderName: json['traderName'] as String,
      icon: json['icon'] as String,
    );
  }
}
