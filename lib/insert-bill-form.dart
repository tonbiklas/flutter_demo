import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:personal_wallet/Entities/Bill.dart';
import 'package:personal_wallet/Model/AppState.dart';

import 'Reducer/actions.dart';

class MyInsertBillForm extends StatefulWidget {
  @override
  _MyInsertBillFormState createState() => _MyInsertBillFormState();
}

class _MyInsertBillFormState extends State<MyInsertBillForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Form(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.minimize, color: Colors.blue, size: 25),
                  onPressed: () {
                    StoreProvider.of<AppState>(context).dispatch(AddBillAction(
                        new Bill(-double.parse(myController.text))));
                    StoreProvider.of<AppState>(context).dispatch(
                        AddFundsAction(-double.parse(myController.text)));
                  },
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: myController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                        hintText: 'Insert the ammount spent/earned'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.blue, size: 25),
                  onPressed: () {
                    print(myController.text);
                    StoreProvider.of<AppState>(context).dispatch(AddBillAction(
                        new Bill(double.parse(myController.text))));
                    StoreProvider.of<AppState>(context).dispatch(
                        AddFundsAction(double.parse(myController.text)));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
