import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InformasisetiaphariView extends GetView {
  const InformasisetiaphariView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InformasisetiaphariView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InformasisetiaphariView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
