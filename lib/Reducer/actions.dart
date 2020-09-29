import 'package:personal_wallet/Entities/Bill.dart';

class AddBillAction {
  final Bill bill;

  AddBillAction(this.bill);
}

class AddFundsAction {
  final double bill;

  AddFundsAction(this.bill);
}
