import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Surat1Controller extends GetxController {
  List namaPegawai = [
    'Cynthia Utami Putri, ST, MT',
    'Lenindo, ST',
    'Wenni Handayani, ST',
    'Reno Mardani, ST',
    'Visy Asmery, ST, MT',
    'Riski Mardiansyah Joniswa, ST',
    'Novi Eryanto, ST',
    'Heflima Surya  Harsian, ST',
    'Julita Andrini Repadi,ST, MT',
    'Andri Haris, ST',
    'Harnesia Wirda, ST',
    'Reny Indria, ST',
    'Irwandi, ST',
    'Donny Eka Putra,ST',
    'Budi Ramali, ST, MT ',
    'Harry Richardo, ST, MT',
    'Arnis, S.ST',
    'Mutia Fitriani, ST,M Si',
    'Zen, A.Md',
    'Kisman, ST',
  ];
  List nipPegawai = [
    '19870614 201101 2 004',
    '19870513 201403  001',
    '19820321 201503 2 002',
    '19750925 201001 2 008',
    '19770506 201101 2 001',
    '19850315 201403  001',
    '19810206 200902  002',
    '19810410 201101 2 004',
    '19860818 201503  002',
    '19870226 201503  004',
    '19840909 201403 2 001',
    '19880505 201101 2 001',
    '19701011 200701  003',
    '19751110 200604  017',
    '19711006 200604  005',
    '19840123 201101  002',
    '19800530 200003  002',
    '19830823 200902 2 003',
    '19710926 200604  002',
    '19680915 200212  012',
  ];
  List golonganPegawai = [
    'III.c',
    'III.b',
    'III.b',
    'III.c',
    'III.c',
    'III.b',
    'III.d',
    'III.c',
    'III.b',
    'III.b',
    'III.b',
    'III.c',
    'III.c',
    'III.d',
    'III.d',
    'III.c',
    'III.b',
    'III.c',
    'III.c',
    'III.b',
  ];
  final pdf = pw.Document();
  //form 1
  TextEditingController namaC1 = TextEditingController();
  TextEditingController golC1 = TextEditingController();
  TextEditingController nipC1 = TextEditingController();
  TextEditingController kdtC1 = TextEditingController();

//form 2
  TextEditingController namaC2 = TextEditingController();
  TextEditingController golC2 = TextEditingController();
  TextEditingController nipC2 = TextEditingController();
  TextEditingController kdtC2 = TextEditingController();
//=============================================================
  TextEditingController nomorC = TextEditingController();
  TextEditingController perihalC = TextEditingController();
  TextEditingController tanggalC = TextEditingController();
  TextEditingController kepadaYthC = TextEditingController();

  Future<void> getPDF() async {
    if (namaC1.text.isEmpty ||
        golC1.text.isEmpty ||
        nipC1.text.isEmpty ||
        kdtC1.text.isEmpty ||
        nomorC.text.isEmpty ||
        perihalC.text.isEmpty ||
        tanggalC.text.isEmpty ||
        kepadaYthC.text.isEmpty) {
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
        messageText: const Center(child: Text('Harap isi semua field')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
      );
    } else {
      try {
        final netImage =
            (await rootBundle.load('assets/sum.png')).buffer.asUint8List();
//====================================================================================>
// Page 1
        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (pw.Context context) {
              return pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Container(
                        height: 80,
                        child: pw.Image(
                          pw.MemoryImage(
                            netImage,
                          ),
                        ),
                      ),
                      pw.Center(
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text(
                              'PEMERINTAH PROVINSI SUMATERA BARAT',
                              style: const pw.TextStyle(fontSize: 12),
                            ),
                            pw.Text(
                              'DINAS BINA MARGA, CIPTA KARYA, DAN TATA RUANG',
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Text(
                              'Jl Taman Siswa No. 1, Padang, Telp. 7051700-7051765 | Fax. (0751) 7051783)',
                              style: const pw.TextStyle(
                                fontSize: 7,
                              ),
                            ),
                            pw.Text(
                              'http://www.sumbar.go.id | email: pdeisb@sumbar.go.id',
                              style: const pw.TextStyle(fontSize: 7),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(
                    height: 20,
                    thickness: 1,
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: pw.Column(
                      children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                                width: 150,
                                child: pw.Row(
                                  children: [
                                    pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      children: [
                                        pw.Text('Nomor',
                                            style: const pw.TextStyle(
                                                fontSize: 10)),
                                        pw.Text('Lampiran',
                                            style: const pw.TextStyle(
                                                fontSize: 10)),
                                        pw.Text('Perihal',
                                            style: const pw.TextStyle(
                                                fontSize: 10)),
                                      ],
                                    ),
                                    pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      children: [
                                        pw.Text(' : ${nomorC.text}',
                                            style: const pw.TextStyle(
                                                fontSize: 10)),
                                        pw.Text(' : 1 (satu) lembar',
                                            style: const pw.TextStyle(
                                                fontSize: 10)),
                                        pw.Text(' : ${perihalC.text}',
                                            style: const pw.TextStyle(
                                                fontSize: 10)),
                                      ],
                                    ),
                                  ],
                                )),
                            pw.Container(
                              width: 150,
                              child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    'Padang, ${tanggalC.text}',
                                    style: const pw.TextStyle(fontSize: 10),
                                  ),
                                  pw.SizedBox(height: 5),
                                  pw.Text(
                                      'Kepada Yth :\n${kepadaYthC.text} di Padang',
                                      style: const pw.TextStyle(fontSize: 10),
                                      textAlign: pw.TextAlign.justify),
                                ],
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 20),
                        pw.Text(
                          '''Sehubungan dengan surat sekretaris daerah provinsi sumatera barat nomor560/17/umur-2022 tanggal 10 Januari 2022 perihal permintaan tenaga pengelola teknis pekerjaan (PTP) pada kegiatan pemeliharaan / Rehabilitas Gedung Kantor dan Bangunan Lainnya, maka sesuai dengan peraturan presiden nomor 72 tahun 2011 tentang Pembangunan Bangunan Gedung Negara dan Peraturan Menteri Pekerjaan Umum dan Perumahan Rakyat Nomor 22/PRT/M/2018 tentang Pembangunan Bangunan Gedung Negara, dengan ini ditugaskan personil sebagaimana terlampir untuk ditugaskan menjadi Tenaga Pengelola Teknis Pembangunan Bangunan Gedung Negara Pada Kegiatan dimaksud.
      
Selanjutnya ditambahkan bahwa tugas Pengelola Teknis adalah membantu Kementerian/Lembaga/ OPD dalam Pengelolaan Pembanguan Bangunan Gedung Negara di bidang Teknis Administrasi yang dapat berupa pemberian saran teknis atas persoalan tingkat program, Perencanaan dan Pelaksanaan Operasional yang timbul dalam pelaksanaan pembangunan. Dalam Hal Kementerian/Lembaga/ OPD membutuhkan, Pengelola Teknis dapat memberikan masukan teknis teknologis dan manajemen dengan tidak mengambil tanggung jawab profesional penyedia jasa (Konsultasi Perencanam Konsultan Pengawas/ Manajemen Konstruksi atau Kontraktor) yang memiliki perikatan dengan pengguna Jasa secara Kontraktual.
      
Tenaga Pengelola Teknis yang telah ditugaskan agar segera ditetapkan di dalam Surat Keputusan Pembentukan Organisasi Pengelolaan Kegiatan oleh Kuasa Pengguna Anggaran Kegiatan Pembangunan Gedung Terkait. Pembiayaan dan pengeluaran yang diakibatkan oleh Bermintaan Bantuan Tenaga Pengelolaa Teknis ini agar dialokasikan di dalam DIPA/DPA Kegiatan Pemeliharaan / Rehabilitasi Gedung Kantor dan Bangunan Lainnya, Pemeliharaan / Rehabilitasi Gedung Kantor dan Bangunan Lainnya, yang ditetapkan dalam Surat Keputusan Pembentukan Organisasi Pengelolaan Kegiatan oleh Kuasa Pengguna Anggaran Kegiatan Pembangunan Sarana dan Prasarana Pendukung Gedung Kanotr dan Bangunan Lainnya Sekretasi Daerah Provinsi Sumatera Barat.
      
Untuk koordinasi dapat menghubungi sekretariat Pengelola Teknis Sdri. Cythia Utami Putri,ST, MT (085263453453) dan Sdri. Helvi Anria (08126759031).
      
Demikian disampaikan, atas perhatiannya diucapkan terima kasih.''',
                          style: const pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.justify,
                        ),
                        pw.SizedBox(height: 30),
                        pw.Align(
                          alignment: pw.Alignment.bottomRight,
                          child: pw.Column(
                            children: [
                              pw.Text(
                                'Kepala Dinas',
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.SizedBox(height: 50),
                              pw.Text(
                                'Erasukma Munaf, ST, MM',
                                style: pw.TextStyle(
                                    fontSize: 10,
                                    decoration: pw.TextDecoration.underline,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Text(
                                'NIP 19720925 1999803 1 003',
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                    child: pw.Align(
                      alignment: pw.Alignment.bottomLeft,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'Tembusan disampaikan kepada Yth:',
                            style: pw.TextStyle(
                                decoration: pw.TextDecoration.underline,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 10),
                          ),
                          pw.Text(
                            '1. Sdr. yang bersangkutan untuk dilaksanakan dengan bertanggungjawab',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );

//====================================================================================>
// Page 2
        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (context) {
              return pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Text(
                            'LAMPIRAN',
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.bold,
                              decoration: pw.TextDecoration.underline,
                            ),
                          ),
                          pw.Text(
                            'Nomor : ${nomorC.text}',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                          pw.Text(
                            'Tanggal : ${tanggalC.text}',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                          pw.Text(
                            '''Perihal : ${perihalC.text}''',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 20),
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Center(
                        child: pw.Text(
                          'Tenaga Pengelola Teknis Pembangunan Bangunan Gedung Negara\n Sekretasi Daerah Provinsi Sumatera Barat',
                          textAlign: pw.TextAlign.center,
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 20),
                  pw.Table(
                    border: pw.TableBorder.all(),
                    children: [
                      pw.TableRow(
                        decoration:
                            const pw.BoxDecoration(color: PdfColors.black),
                        children: [
                          'NIP',
                          'Nama',
                          'Gol',
                          'Kedudukan dalam TIM',
                        ].map((cell) {
                          return pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(
                              cell,
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 10,
                                color: PdfColors.white,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      pw.TableRow(
                        children: [
                          (nipC1.text),
                          (namaC1.text),
                          (golC1.text),
                          (kdtC1.text),
                        ].map((cell) {
                          return pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(
                              cell,
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 10,
                                color: PdfColors.black,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      pw.TableRow(
                        children: [
                          (nipC2.text),
                          (namaC2.text),
                          (golC2.text),
                          (kdtC2.text),
                        ].map((cell) {
                          return pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(
                              cell,
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 10,
                                color: PdfColors.black,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 20),
                  pw.Align(
                    alignment: pw.Alignment.bottomRight,
                    child: pw.Column(
                      children: [
                        pw.Text(
                          'Kepala Dinas',
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 50),
                        pw.Text(
                          'Erasukma Munaf, ST, MM',
                          style: pw.TextStyle(
                              fontSize: 10,
                              decoration: pw.TextDecoration.underline,
                              fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text(
                          'NIP 19720925 1999803 1 003',
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
//====================================================================================>
        final bytes = await pdf.save();
        final dir = await getApplicationDocumentsDirectory();
        final file = File(
            '${dir.path}/${perihalC.text}-${DateFormat("EEEE, d MMMM yyyy", "id_ID").add_Hm().format(DateTime.now())}.pdf');
        await file.writeAsBytes(bytes);
        await OpenFile.open(file.path);
        Get.back();
      } catch (e) {
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
            child: Text('Terjadi kesalahan, coba lagi atau hubungi admin'),
          ),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: Colors.white,
        );
      }

//====================================================================================>

    }
  }
}
