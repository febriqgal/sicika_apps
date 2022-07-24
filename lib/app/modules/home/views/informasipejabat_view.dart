import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InformasipejabatView extends GetView {
  const InformasipejabatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InformasipejabatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InformasipejabatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
