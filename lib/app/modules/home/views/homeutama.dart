import 'package:ciptakarya/app/modules/story/views/hapus_pengumuman.dart';
import 'package:ciptakarya/app/modules/home/controllers/home_controller.dart';
import 'package:ciptakarya/app/modules/home/views/kontak_view.dart';
import 'package:ciptakarya/app/modules/home/views/pelayananpublik_view.dart';
import 'package:ciptakarya/app/modules/home/views/pertimbanganteknis_view.dart';
import 'package:ciptakarya/app/modules/home/views/sasaran_view.dart';
import 'package:ciptakarya/app/modules/home/views/strukturorganisasi_view.dart';
import 'package:ciptakarya/app/modules/home/views/tujuan_view.dart';
import 'package:ciptakarya/app/modules/home/views/visimisi_view.dart';
import 'package:ciptakarya/app/modules/semua_foto_kegiatan/controllers/semua_foto_kegiatan_controller.dart';
import 'package:ciptakarya/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_story_list/flutter_story_list.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../story/controllers/story_controller.dart';
import 'informasiberkala_view.dart';
import 'informasipejabat_view.dart';
import 'informasisertamerta_view.dart';
import 'informasisetiaphari_view.dart';
import 'motodanlambang_view.dart';

class Homeutama extends GetView<HomeController> {
  const Homeutama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data = [
      'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Header_Home%2Fgambar0?alt=media&token=9086d941-6533-477b-b528-dd5dffa397b5',
      'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Header_Home%2Fgambar1?alt=media&token=9086d941-6533-477b-b528-dd5dffa397b5',
      'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Header_Home%2Fgambar2?alt=media&token=9086d941-6533-477b-b528-dd5dffa397b5',
      'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Header_Home%2Fgambar3?alt=media&token=9086d941-6533-477b-b528-dd5dffa397b5',
      'https://firebasestorage.googleapis.com/v0/b/sicika-31a86.appspot.com/o/Header_Home%2Fgambar4?alt=media&token=9086d941-6533-477b-b528-dd5dffa397b5',
    ];
    FirebaseAuth auth = FirebaseAuth.instance;
    final storyC = Get.put(StoryPageController());
    final semuaKegiatanC = Get.put(SemuaFotoKegiatanController());
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  'Sicika',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {},
            ),
            ExpansionTile(
              iconColor: Colors.amber,
              textColor: Colors.amber,
              backgroundColor: Colors.grey[200],
              title: const Text('Profile'),
              children: [
                ListTile(
                  onTap: () {
                    Get.to(
                      () => const TujuanView(),
                    );
                  },
                  title: const Text('Tujuan'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const SasaranView());
                  },
                  title: const Text('Sasaran'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const VisimisiView());
                  },
                  title: const Text('Visi Misi'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const StrukturorganisasiView());
                  },
                  title: const Text('Struktur Organisasi'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const MotodanlambangView());
                  },
                  title: const Text('Moto dan Lambang'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const InformasipejabatView());
                  },
                  title: const Text('Informasi Pejabat'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const KontakView());
                  },
                  title: const Text('Kontak'),
                ),
              ],
            ),
            ExpansionTile(
              iconColor: Colors.amber,
              textColor: Colors.amber,
              backgroundColor: Colors.grey[200],
              title: const Text('Informasi'),
              children: [
                ListTile(
                  onTap: () {
                    Get.to(() => const InformasisetiaphariView());
                  },
                  title: const Text('Informasi Setiap Saat'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const InformasisertamertaView());
                  },
                  title: const Text('Informasi Serta Merta'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const InformasiberkalaView());
                  },
                  title: const Text('Informasi Berkala'),
                ),
              ],
            ),
            ExpansionTile(
              iconColor: Colors.amber,
              textColor: Colors.amber,
              backgroundColor: Colors.grey[200],
              title: const Text('Layanan'),
              children: [
                ListTile(
                  onTap: () {
                    Get.to(() => const PertimbanganteknisView());
                  },
                  title: const Text('Pertimbangan Teknis'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const PelayananpublikView());
                  },
                  title: const Text('Pelayanan Publik'),
                ),
              ],
            ),
            ExpansionTile(
              iconColor: Colors.amber,
              textColor: Colors.amber,
              backgroundColor: Colors.grey[200],
              title: const Text('Dasar Hukum/Peraturan'),
              children: [
                ListTile(
                  onTap: () {
                    Get.to(() => const PertimbanganteknisView());
                  },
                  title: const Text('Dasar Hukum/Peraturan'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const PelayananpublikView());
                  },
                  title: const Text('Rancangan Peraturan'),
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.amber,
        foregroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.amber,
        title: const Text(
          'Sicika',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'pengaturan',
                  child: Text('Pengaturan'),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 'pengaturan') {
                Get.toNamed(Routes.PENGATURAN);
              }
            },
          )
        ],
      ),
      body: ListView(
        children: [
          // PENGUMUMAN
          StreamBuilder<QuerySnapshot?>(
            stream: controller.collectionStreamDataStoryHome,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final semuaStory = snapshot.data?.docs;
                return StoryList(
                  itemMargin: 8,
                  borderRadius: 5,
                  borderColor: Colors.grey.withOpacity(0.2),
                  iconBackgroundColor: Colors.amber,
                  height: 200,
                  onPressedIcon: () {
                    auth.currentUser != null &&
                                auth.currentUser?.email ==
                                    'febriqgalp@gmail.com' ||
                            auth.currentUser?.email == 'febriqgal@gmail.com'
                        ? Get.bottomSheet(
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                              child: Container(
                                height: Get.height * 0.15,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.add),
                                      onTap: () {
                                        storyC.pickFotoStory();
                                      },
                                      title: const Text('Tambah Pengumuman'),
                                      trailing: const Icon(
                                          Icons.arrow_right_outlined),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.delete),
                                      onTap: () {
                                        Get.to(() => const HapusStory());
                                      },
                                      title: const Text('Hapus Pengumuman'),
                                      trailing: const Icon(
                                          Icons.arrow_right_outlined),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Get.snackbar(
                            '-',
                            '-',
                            titleText: const Center(
                              child: Text(
                                'Peringatan',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            messageText: const Center(
                              child: Text(
                                'Anda tidak memiliki akses\n untuk menambahkan pengumuman',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            snackStyle: SnackStyle.GROUNDED,
                            backgroundColor: Colors.white,
                          );
                  },
                  image: Image.asset('assets/Ciptakarya.png'),
                  text: const Text(
                    'Pengumuman',
                    style: TextStyle(fontSize: 12),
                  ),
                  itemCount: semuaStory?.length ?? 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.STORY,
                            arguments: semuaStory?[index].id);
                      },
                      child: Container(
                        width: 100,
                        color: Colors.grey[200],
                        child: Image.network(
                          '${(semuaStory?[index].data() as Map<String, dynamic>)['image']}',
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                : Shimmer.fromColors(
                                    direction: ShimmerDirection.ltr,
                                    baseColor: const Color.fromARGB(
                                        255, 238, 238, 238),
                                    highlightColor: const Color.fromARGB(
                                        255, 221, 217, 217),
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  );
                          },
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          ),
          //CAROUSEL SLIDER
          FlutterCarousel(
              items: [1, 2, 3, 4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: Image.network(
                            data[i],
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              return progress == null
                                  ? child
                                  : Shimmer.fromColors(
                                      direction: ShimmerDirection.ltr,
                                      baseColor: const Color.fromARGB(
                                          255, 238, 238, 238),
                                      highlightColor: const Color.fromARGB(
                                          255, 221, 217, 217),
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    );
                            },
                          ),
                        ));
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 1),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
                pauseAutoPlayOnTouch: false,
                pauseAutoPlayOnManualNavigate: false,
                pauseAutoPlayInFiniteScroll: false,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                disableCenter: false,
                showIndicator: true,
                floatingIndicator: false,
                slideIndicator: const CircularSlideIndicator(
                  padding: EdgeInsets.only(top: 8),
                  currentIndicatorColor: Colors.amber,
                  indicatorBackgroundColor: Color.fromARGB(43, 158, 158, 158),
                ),
              )),
          // FOTO KEGIATAN
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 10, right: 8, left: 8),
            child: Text(
              'Foto Kegiatan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot?>(
            stream: semuaKegiatanC.collectionStreamFotoKegiatan,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final semuaFotoKegiatan = snapshot.data?.docs;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            childAspectRatio: 1 / 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                    itemCount: semuaFotoKegiatan?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.toNamed(Routes.SEMUA_FOTO_KEGIATAN),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.network(
                              '${(semuaFotoKegiatan?[index].data() as Map<String, dynamic>)['foto']}',
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) {
                                return progress == null
                                    ? child
                                    : Shimmer.fromColors(
                                        direction: ShimmerDirection.ltr,
                                        baseColor: const Color.fromARGB(
                                            255, 238, 238, 238),
                                        highlightColor: const Color.fromARGB(
                                            255, 221, 217, 217),
                                        child: Container(
                                          color: Colors.white,
                                        ),
                                      );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
