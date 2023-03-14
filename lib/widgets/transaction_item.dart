import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.delTxCallBack,
  });

  final Transaction transaction;
  final Function delTxCallBack;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
          onPressed: () =>
              delTxCallBack(transaction.id),
          icon: const Icon(
            Icons.delete,
          ),
          label: const Text('Delete'),
          style: TextButton.styleFrom(
            foregroundColor:
            Theme.of(context).colorScheme.error,
          ),
        )
            : IconButton(
          icon: const Icon(
            Icons.delete,
          ),
          color: Theme.of(context).colorScheme.error,
          onPressed: () =>
              delTxCallBack(transaction.id),
        ),
      ),
    );
  }
}