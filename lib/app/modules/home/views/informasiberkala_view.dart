import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InformasiberkalaView extends GetView {
  const InformasiberkalaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InformasiberkalaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InformasiberkalaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
