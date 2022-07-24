import 'package:flutter/material.dart';

import 'package:get/get.dart';

class VisimisiView extends GetView {
  const VisimisiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VisimisiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VisimisiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
