import 'package:ciptakarya/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../controllers/akun_controller.dart';

class AkunView extends GetView<AkunController> {
  const AkunView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final akunC = Get.put(AkunController());
    return Scaffold(
      body: GetBuilder<AkunController>(
        builder: (controller) {
          return ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 5),
                    child: ClipOval(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/foto_profile%2F${auth.currentUser?.uid}?alt=media&token=476e5c7f-47c7-42f6-9ba2-6d816f133cd8',
                          ),
                        ),
                      ),
                    ),
                  ),
                  //NAMA USER
                  Text(
                    auth.currentUser?.displayName ?? 'Guest'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              //EMAIL USER
              Center(
                child: Text(
                  auth.currentUser?.email ?? '-',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //EDIT AKUN
              ExpansionTile(
                leading: const Icon(Icons.edit),
                iconColor: Colors.amber,
                textColor: Colors.amber,
                backgroundColor: Colors.grey[200],
                title: const Text('Edit Akun'),
                children: [
                  //ubah foto profile
                  ListTile(
                    onTap: () {
                      Get.bottomSheet(
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          child: Container(
                            color: Colors.white,
                            height: Get.height * 0.5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextField(
                                      onTap: () async {
                                        akunC.ubahFotoProfle();
                                      },
                                      autocorrect: false,
                                      cursorColor: Colors.amber,
                                      style: const TextStyle(),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                        hintText: 'Foto Baru',
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                        ),
                                        suffixIcon: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.amber,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    title: const Text('Ubah Foto Profil'),
                  ),
                  //ubah password
                  ListTile(
                    onTap: () {
                      Get.bottomSheet(
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          child: Container(
                            color: Colors.white,
                            height: Get.height * 0.5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextField(
                                      controller: akunC.ubahPassC,
                                      autocorrect: false,
                                      cursorColor: Colors.amber,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10),
                                        hintText: 'Password Baru',
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.key,
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 5),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(Get.width, 20),
                                          primary: Colors.amber,
                                        ),
                                        onPressed: () async {
                                          bool result =
                                              await InternetConnectionChecker()
                                                  .hasConnection;
                                          if (result == true) {
                                            akunC.ubahPassword();
                                          } else {
                                            Get.snackbar(
                                              '-',
                                              '-',
                                              titleText: const Center(
                                                child: Text(
                                                  'Kesalahan',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              messageText: const Center(
                                                child: Text(
                                                    'Tidak ada koneksi internet'),
                                              ),
                                              snackStyle: SnackStyle.GROUNDED,
                                              backgroundColor: Colors.white,
                                              barBlur: 0.5,
                                            );
                                          }
                                        },
                                        child: const Text('Kirim',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    title: const Text('Ubah Password'),
                  ),
                  //ubah nama
                  ListTile(
                    onTap: () {
                      Get.bottomSheet(
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          child: Container(
                            color: Colors.white,
                            height: Get.height * 0.5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextField(
                                      maxLength: 20,
                                      controller: akunC.ubahNamaC,
                                      autocorrect: false,
                                      cursorColor: Colors.amber,
                                      style: const TextStyle(),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10),
                                        hintText: 'Nama Baru',
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 5),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(Get.width, 20),
                                          primary: Colors.amber,
                                        ),
                                        onPressed: () {
                                          akunC.ubahNama();
                                        },
                                        child: const Text('Kirim',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    title: const Text('Ubah nama'),
                  ),
                ],
              ),
              //BERITASAYA
              ListTile(
                onTap: () {
                  Get.toNamed(Routes.BERITASAYA);
                },
                leading: const Icon(Icons.newspaper),
                title: const Text('Berita Saya'),
              ),

              //KELUAR
              ListTile(
                onTap: () {
                  akunC.keluar();
                },
                title: const Center(
                  child: Text(
                    'Keluar',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          if (auth.currentUser?.email == 'febriqgalp@gmail.com' ||
              auth.currentUser?.email == 'febriqgal@gmail.com') {
            Get.toNamed(Routes.ADMIN);
          } else {
            Get.snackbar(
              '-',
              '-',
              titleText: const Center(
                child: Text(
                  'Ups!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              messageText: const Center(
                child: Text(
                  'Dilarang masuk keruangan admin✌️',
                ),
              ),
            );
          }
        },
        child: const Icon(Icons.admin_panel_settings),
      ),
    );
  }
}
