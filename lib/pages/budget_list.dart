import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:budget_tracker/list.dart';

class BudgetList extends StatefulWidget {
  const BudgetList({super.key});

  @override
  State<BudgetList> createState() => _BudgetListState();
}

class _BudgetListState extends State<BudgetList> {
  @override
  Widget build(BuildContext context) {

    final budget = Provider.of<List<Track>>(context);

    return Column(
      children: budget.map((entry) => EntryCard(
          entry: entry,
          delete: () {
            setState(() {
              budget.remove(entry);
            });
          }
      )).toList(),
    );
  }
}

class EntryCard extends StatelessWidget {

  final Track entry;
  final VoidCallback delete;
  const EntryCard({super.key,  required this.entry, required this.delete });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(width: 8.0),
          Text(
            entry.category,
            style: const TextStyle(
              fontSize: 17.0,
              color: Colors.black54,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(width: 150.0),
          Text(
            '$entry.price',
            style: const TextStyle(
              letterSpacing: 1.2,
              color: Colors.black87,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(width: 4.0),
          IconButton(
            onPressed: delete,
            icon: const Icon(
              Icons.delete,
              size: 35.0,
            ),
          ),
        ],
      ),
    );
  }
}