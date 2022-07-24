import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TujuanView extends GetView {
  const TujuanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TujuanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TujuanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
