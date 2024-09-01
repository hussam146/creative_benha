// ignore_for_file: must_be_immutable

import 'package:creative_benha/data_model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.dataModel});
  late DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Image.asset(
                  dataModel.image!,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: 250.0,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Color.fromARGB(255, 255, 136, 0),
                  ),
                ),
              ],
            ),
            // Text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                dataModel.text!,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 136, 0),
                ),
              ),
            ),
            // desc
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                dataModel.desc!,
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[600],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
