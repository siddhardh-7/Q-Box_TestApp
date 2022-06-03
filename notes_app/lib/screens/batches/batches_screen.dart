import 'package:flutter/material.dart';

import './batch_details_screen.dart';
import './batch_name_tile.dart';

class BatchesScreen extends StatelessWidget {
  const BatchesScreen({Key? key}) : super(key: key);
  static const String routeName = '/batches-screen';

  final List<String> _batcheNames = const [
    'Batch Name 1',
    'Batch Name 2',
    'Batch Name 3'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'Batches ',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 15.0,
                    child: Icon(Icons.person),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              for (int i = 0; i < _batcheNames.length; i++)
                BatchNameListTile(
                  batchName: _batcheNames[i],
                  onTapHandler: () => Navigator.of(context)
                      .pushNamed(BatcheDetailsScreen.routeName, arguments: {
                    'batchName': _batcheNames[i],
                  }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
