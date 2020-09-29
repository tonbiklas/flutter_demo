import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'insert-bill-form.dart';

// class InsertNewBillModal extends StatefulWidget {
//   InsertNewBillModal(this.addMoney, this.removeMoney);
//
//   final Function removeMoney;
//   final Function addMoney;
//
//   @override
//   State<StatefulWidget> createState() {
//     return InsertNewBillModalState();
//   }
//
// }
//
// class InsertNewBillModalState extends State<InsertNewBillModal> {
//   num bill = 0;
//
//   onChange(bill) {
//     setState(() {
//       this.bill = bill;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 40,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: <Widget>[
//             Row(
//                 children: <Widget>[
//                   Text("Insert new expense or earnings", style: Theme.of(context).textTheme.headline6),
//                   Spacer(),
//                   IconButton(
//                     icon: Icon(Icons.cancel, color: Colors.blue, size: 25),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   )
//                 ]
//             ),
//             Row(
//               children: <Widget>[
//                 Spacer(),
//                 MyInsertBillForm(),
//                 Spacer(),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//


class InsertBillModal extends StatelessWidget {
  InsertBillModal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Text("Insert new expense or earnings",
                  style: Theme.of(context).textTheme.headline6),
              Spacer(),
              IconButton(
                icon: Icon(Icons.cancel, color: Colors.blue, size: 25),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ]),
            Row(
              children: <Widget>[
                Spacer(),
                MyInsertBillForm(),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
