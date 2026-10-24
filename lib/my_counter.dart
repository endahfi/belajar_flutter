import 'package:flutter/material.dart';

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
	int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Nilai: $counter'),
          ElevatedButton(
          	onPressed: () {
          		setState(() {
          		  counter++;
          		});
          		},
          		child: Text('Tambah'),
          	)
        ],
      ),
    );
  }
}