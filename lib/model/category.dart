import 'item.dart';

class Category {
  final int category;
  final Map<String, Item> items;

  Category({this.category, this.items});

  factory Category.fromJson(Map<String, dynamic> json) {
    Iterable list = json['items'];
    Map<String, Item> output = {};
    for (Map<String, dynamic> item in list) {
      output[item['uid'] as String] = Item.fromJson(item);
    }
    return new Category(
      category: json['id'] as int,
      items: output,
    );
  }
}
