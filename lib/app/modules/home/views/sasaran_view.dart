import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SasaranView extends GetView {
  const SasaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SasaranView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SasaranView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
