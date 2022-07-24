import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/datasatu_controller.dart';

class DatasatuView extends GetView<DatasatuController> {
  const DatasatuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Coming Soon!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
