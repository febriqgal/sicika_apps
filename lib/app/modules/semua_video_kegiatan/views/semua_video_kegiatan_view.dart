import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/semua_video_kegiatan_controller.dart';

class SemuaVideoKegiatanView extends GetView<SemuaVideoKegiatanController> {
  const SemuaVideoKegiatanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Video Kegiatan'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Video Kegiatan'),
        ));
  }
}
