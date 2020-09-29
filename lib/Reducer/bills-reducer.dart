import 'package:personal_wallet/Model/AppState.dart';

import 'actions.dart';

AppState billsReducer(AppState appState, action) {
  if (action is AddFundsAction) {
    return new AppState(
        list: new List.from(appState.list),
        funds: appState.funds + action.bill);
  } else if (action is AddBillAction) {
    return new AppState(
        list: new List.from(appState.list)..add(action.bill),
        funds: appState.funds);
  }
  return appState;
}
