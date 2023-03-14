import 'package:flutter/material.dart';

import '../models/transaction.dart';

class SpentMoney extends StatelessWidget {
  final List<Transaction> userTransactions;

  SpentMoney(this.userTransactions);

  double get totalSpending {
    return userTransactions.fold(0.0, (sum, item) {
      return sum + item.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      child: Text(
        'Total expenses: ${totalSpending.toStringAsFixed(2)}',
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
