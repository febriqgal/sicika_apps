import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PelayananpublikView extends GetView {
  const PelayananpublikView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PelayananpublikView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PelayananpublikView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
