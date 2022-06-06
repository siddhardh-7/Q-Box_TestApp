import 'package:flutter/material.dart';
import 'package:notes_app/utilities/dimensions.dart';

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
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width10 * 1.5,
              vertical: Dimensions.height10 * 3),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Batches ',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Dimensions.height10 * 2,
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
      ),
    );
  }
}
