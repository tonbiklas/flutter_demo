import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_wallet/Reducer/bills-reducer.dart';
import 'package:personal_wallet/Model/AppState.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'insert-new-bill-modal.dart';

loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');

  next(action);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final store = new Store<AppState>(
      billsReducer,
      initialState: new AppState(),
      middleware: [loggingMiddleware],
    );

    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _insertNewBillModal(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return InsertBillModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(children: [
            Container(
                padding: EdgeInsets.only(top: 24.0),
                height: MediaQuery.of(context).size.height * .15,
                child: Column(
                  children: [
                    Center(child: Text('Your funds')),
                    Center(
                        child: Text(state.funds.toString(),
                            style: Theme.of(context).textTheme.headline4)),
                  ],
                )),
            Divider(
              thickness: 2.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    if (state.list.length > 0)
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.payment),
                          title: Text('${state.list[index].bill}'),
                        ),
                      );
                    return null;
                  }),
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _insertNewBillModal(context);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
