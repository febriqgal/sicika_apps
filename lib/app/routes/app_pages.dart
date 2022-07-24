import 'package:get/get.dart';

import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/akun/bindings/akun_binding.dart';
import '../modules/akun/views/akun_view.dart';
import '../modules/beritadetails/bindings/beritadetials_binding.dart';
import '../modules/beritadetails/views/beritadetials_view.dart';
import '../modules/beritasaya/bindings/beritasaya_binding.dart';
import '../modules/beritasaya/views/beritasaya_view.dart';
import '../modules/buat_surat/bindings/buat_surat_binding.dart';
import '../modules/buat_surat/views/buat_surat_view.dart';
import '../modules/datasatu/bindings/datasatu_binding.dart';
import '../modules/datasatu/views/datasatu_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction_page/bindings/introduction_page_binding.dart';
import '../modules/introduction_page/views/introduction_page_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pengaturan/bindings/pengaturan_binding.dart';
import '../modules/pengaturan/views/pengaturan_view.dart';
import '../modules/semua_foto_kegiatan/bindings/semua_foto_kegiatan_binding.dart';
import '../modules/semua_foto_kegiatan/views/semua_foto_kegiatan_view.dart';
import '../modules/semua_video_kegiatan/bindings/semua_video_kegiatan_binding.dart';
import '../modules/semua_video_kegiatan/views/semua_video_kegiatan_view.dart';
import '../modules/semuaberita/bindings/semuaberita_binding.dart';
import '../modules/semuaberita/views/semuaberita_view.dart';
import '../modules/story/bindings/story_binding.dart';
import '../modules/story/views/story_view.dart';
import '../modules/surat1/bindings/surat1_binding.dart';
import '../modules/surat1/views/surat1_view.dart';
import '../modules/tambah_berita/bindings/tambah_berita_binding.dart';
import '../modules/tambah_berita/views/tambah_berita_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PENGATURAN,
      page: () => const PengaturanView(),
      binding: PengaturanBinding(),
    ),
    GetPage(
      name: _Paths.SEMUABERITA,
      page: () => const SemuaberitaView(),
      binding: SemuaberitaBinding(),
    ),
    GetPage(
      name: _Paths.BERITADETIALS,
      page: () => const BeritadetialsView(),
      binding: BeritadetialsBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_BERITA,
      page: () => const TambahBeritaView(),
      binding: TambahBeritaBinding(),
    ),
    GetPage(
      name: _Paths.DATASATU,
      page: () => const DatasatuView(),
      binding: DatasatuBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.SEMUA_FOTO_KEGIATAN,
      page: () => const SemuaFotoKegiatanView(),
      binding: SemuaFotoKegiatanBinding(),
    ),
    GetPage(
      name: _Paths.SEMUA_VIDEO_KEGIATAN,
      page: () => const SemuaVideoKegiatanView(),
      binding: SemuaVideoKegiatanBinding(),
    ),
    GetPage(
      name: _Paths.BUATSURAT,
      page: () => const BuatSuratView(),
      binding: BuatSuratBinding(),
    ),
    GetPage(
      name: _Paths.STORY,
      page: () => const StoryView(),
      binding: StoryBinding(),
    ),
    GetPage(
      name: _Paths.SURAT1,
      page: () => const Surat1View(),
      binding: Surat1Binding(),
    ),
    GetPage(
      name: _Paths.BERITASAYA,
      page: () => const BeritasayaView(),
      binding: BeritasayaBinding(),
    ),
    GetPage(
      name: _Paths.AKUN,
      page: () => const AkunView(),
      binding: AkunBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION_PAGE,
      page: () => const IntroductionPageView(),
      binding: IntroductionPageBinding(),
    ),
  ];
}
