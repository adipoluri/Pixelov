import 'package:hive/hive.dart';

part 'wallet.g.dart';

@HiveType(typeId: 8, adapterName: "WalletAdapter")
class Wallet extends HiveObject {
  @HiveField(0)
  int roubles;
  @HiveField(1)
  int bitcoin;

  Wallet({
    this.roubles,
    this.bitcoin,
  });

  void addShootMoney() {
    this.roubles = this.roubles + 1;
  }
}
