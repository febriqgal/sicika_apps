import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MotodanlambangView extends GetView {
  const MotodanlambangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MotodanlambangView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MotodanlambangView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
