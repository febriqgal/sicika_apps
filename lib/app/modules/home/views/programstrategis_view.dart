import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProgramstrategisView extends GetView {
  const ProgramstrategisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgramstrategisView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProgramstrategisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
