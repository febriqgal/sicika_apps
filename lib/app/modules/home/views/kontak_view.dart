import 'package:flutter/material.dart';

import 'package:get/get.dart';

class KontakView extends GetView {
  const KontakView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KontakView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KontakView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
