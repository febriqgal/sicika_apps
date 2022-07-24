import 'package:flutter/material.dart';

import 'package:get/get.dart';

class StrukturorganisasiView extends GetView {
  const StrukturorganisasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StrukturorganisasiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StrukturorganisasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
