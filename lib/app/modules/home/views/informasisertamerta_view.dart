import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InformasisertamertaView extends GetView {
  const InformasisertamertaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InformasisertamertaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InformasisertamertaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
