import 'package:personal_wallet/Entities/Bill.dart';

class AppState {
  List<Bill> list;
  double funds;

  AppState({this.list = const [], this.funds = 0});
}
