import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PpidsumbarView extends GetView {
  const PpidsumbarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PpidsumbarView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PpidsumbarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
