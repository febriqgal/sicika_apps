import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PertimbanganteknisView extends GetView {
  const PertimbanganteknisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PertimbanganteknisView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PertimbanganteknisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
