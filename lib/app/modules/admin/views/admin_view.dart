import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Get.bottomSheet(
                Container(
                  color: Colors.white,
                  height: Get.height * 0.8,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Stack(
                                children: [
                                  Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Header_Home%2Fgambar0?alt=media&token=4a8dcd6e-f7a6-41be-bb8f-bbabe5b7f1fe',
                                    height: 200,
                                    width: 350,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    height: 200,
                                    width: 350,
                                    color: Colors.black.withOpacity(0.5),
                                    child: IconButton(
                                      onPressed: () {
                                        controller.putFilee0();
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Stack(
                                children: [
                                  Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Header_Home%2Fgambar1?alt=media&token=4a8dcd6e-f7a6-41be-bb8f-bbabe5b7f1fe',
                                    height: 200,
                                    width: 350,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    height: 200,
                                    width: 350,
                                    color: Colors.black.withOpacity(0.5),
                                    child: IconButton(
                                      onPressed: () {
                                        controller.putFilee1();
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Stack(
                                children: [
                                  Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Header_Home%2Fgambar2?alt=media&token=4a8dcd6e-f7a6-41be-bb8f-bbabe5b7f1fe',
                                    height: 200,
                                    width: 350,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    height: 200,
                                    width: 350,
                                    color: Colors.black.withOpacity(0.5),
                                    child: IconButton(
                                      onPressed: () {
                                        controller.putFilee2();
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Stack(
                                children: [
                                  Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Header_Home%2Fgambar3?alt=media&token=4a8dcd6e-f7a6-41be-bb8f-bbabe5b7f1fe',
                                    height: 200,
                                    width: 350,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    height: 200,
                                    width: 350,
                                    color: Colors.black.withOpacity(0.5),
                                    child: IconButton(
                                      onPressed: () {
                                        controller.putFilee3();
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Stack(
                                children: [
                                  Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Header_Home%2Fgambar4?alt=media&token=4a8dcd6e-f7a6-41be-bb8f-bbabe5b7f1fe',
                                    height: 200,
                                    width: 350,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    height: 200,
                                    width: 350,
                                    color: Colors.black.withOpacity(0.5),
                                    child: IconButton(
                                      onPressed: () {
                                        controller.putFilee3();
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            title: const Text('Ubah Gambar Header'),
          ),
        ],
      ),
    );
  }
}
