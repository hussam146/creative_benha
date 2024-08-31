// ignore_for_file: must_be_immutable

import 'package:creative_benha/data_model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.dataModel});
  late DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(dataModel.text!),
      ),
    );
  }
}
