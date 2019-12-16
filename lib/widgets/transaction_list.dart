import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  // TransactionList(){
  //   this.transactions = _userTransactions;
  // };
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).primaryColor)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                      '\$:${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(transactions[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(
                    // DateFormat('yyyy/MM/dd').format(tx.date),
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              )
            ],
          ));
        },
        itemCount: transactions.length,
      ),
    );
  }
}

// import 'package:flutter/material.dart'
// class TranscationList
//  extends StatefulWidget {
//   @override
//   _TranscationList
//   State createState() => _TranscationList
//   State();
// }

// class _TranscationList
// State extends State<TranscationList
// > {
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }
