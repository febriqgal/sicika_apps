import 'package:animate_do/animate_do.dart';
import 'package:ciptakarya/app/modules/surat1/controllers/surat1_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Surat1View extends GetView<Surat1Controller> {
  const Surat1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final surat1C = Get.put(Surat1Controller());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surat Tugas'),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //JUDUL SURAT
                  const Text(
                    '*JUDUL SURAT',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  BounceInRight(
                      duration: const Duration(seconds: 3),
                      child: Container(
                          color: Colors.amber, width: 120, height: 3)),
                  const SizedBox(height: 20),
                  // NOMOR SURAT
                  TextField(
                    autocorrect: false,
                    controller: surat1C.nomorC,
                    cursorColor: Colors.amber,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'Nomor Surat',
                      helperText: 'contoh: 602/123-SK/2022',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //PERIHAL
                  TextField(
                    autocorrect: false,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: surat1C.perihalC,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'Masukan Perihal',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //TANGGAL
                  TextField(
                    readOnly: true,
                    controller: surat1C.tanggalC,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'Masukan tanggal',
                      suffixIcon: IconButton(
                          color: Colors.amber,
                          onPressed: () {
                            showDatePicker(
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              initialDatePickerMode: DatePickerMode.day,
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                              // 100 years
                            ).then(
                              (value) => surat1C.tanggalC.text =
                                  DateFormat("EEEE, d MMMM yyyy", "id_ID")
                                      .format(value!)
                                      .toString(),
                            );
                          },
                          icon: const Icon(Icons.calendar_today)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const SizedBox(height: 20),
                  //TUJUAN
                  TextField(
                    autocorrect: false,
                    controller: surat1C.kepadaYthC,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'Masukan kepada yang ditujuhkan',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 20),
                  //NAMA PEGAWAI 1
                  const Text(
                    '*Nama pegawai 1 ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  BounceInRight(
                      duration: const Duration(seconds: 3),
                      child: Container(
                          color: Colors.amber, width: 150, height: 3)),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        value: '1',
                        child: Text(surat1C.namaPegawai[0]),
                      ),
                      DropdownMenuItem(
                        value: '2',
                        child: Text(surat1C.namaPegawai[1]),
                      ),
                      DropdownMenuItem(
                        value: '3',
                        child: Text(surat1C.namaPegawai[2]),
                      ),
                      DropdownMenuItem(
                        value: '4',
                        child: Text(surat1C.namaPegawai[3]),
                      ),
                      DropdownMenuItem(
                        value: '5',
                        child: Text(surat1C.namaPegawai[4]),
                      ),
                      DropdownMenuItem(
                        value: '6',
                        child: Text(surat1C.namaPegawai[5]),
                      ),
                      DropdownMenuItem(
                        value: '7',
                        child: Text(surat1C.namaPegawai[6]),
                      ),
                      DropdownMenuItem(
                        value: '8',
                        child: Text(surat1C.namaPegawai[7]),
                      ),
                      DropdownMenuItem(
                        value: '9',
                        child: Text(surat1C.namaPegawai[8]),
                      ),
                      DropdownMenuItem(
                        value: '10',
                        child: Text(surat1C.namaPegawai[9]),
                      ),
                      DropdownMenuItem(
                        value: '11',
                        child: Text(surat1C.namaPegawai[10]),
                      ),
                      DropdownMenuItem(
                        value: '12',
                        child: Text(surat1C.namaPegawai[11]),
                      ),
                      DropdownMenuItem(
                        value: '13',
                        child: Text(surat1C.namaPegawai[12]),
                      ),
                      DropdownMenuItem(
                        value: '14',
                        child: Text(surat1C.namaPegawai[13]),
                      ),
                      DropdownMenuItem(
                        value: '15',
                        child: Text(surat1C.namaPegawai[14]),
                      ),
                      DropdownMenuItem(
                        value: '16',
                        child: Text(surat1C.namaPegawai[15]),
                      ),
                      DropdownMenuItem(
                        value: '17',
                        child: Text(surat1C.namaPegawai[16]),
                      ),
                      DropdownMenuItem(
                        value: '18',
                        child: Text(surat1C.namaPegawai[17]),
                      ),
                      DropdownMenuItem(
                        value: '19',
                        child: Text(surat1C.namaPegawai[18]),
                      ),
                      DropdownMenuItem(
                        value: '20',
                        child: Text(surat1C.namaPegawai[19]),
                      ),
                    ],
                    onChanged: (Object? value) {
                      if (value == '1') {
                        controller.namaC1.text = surat1C.namaPegawai[0];
                        controller.nipC1.text = surat1C.nipPegawai[0];
                        controller.golC1.text = surat1C.golonganPegawai[0];
                      } else if (value == '2') {
                        controller.namaC1.text = surat1C.namaPegawai[1];
                        controller.nipC1.text = surat1C.nipPegawai[1];
                        controller.golC1.text = surat1C.golonganPegawai[1];
                      } else if (value == '3') {
                        controller.namaC1.text = surat1C.namaPegawai[2];
                        controller.nipC1.text = surat1C.nipPegawai[2];
                        controller.golC1.text = surat1C.golonganPegawai[2];
                      } else if (value == '4') {
                        controller.namaC1.text = surat1C.namaPegawai[3];
                        controller.nipC1.text = surat1C.nipPegawai[3];
                        controller.golC1.text = surat1C.golonganPegawai[3];
                      } else if (value == '5') {
                        controller.namaC1.text = surat1C.namaPegawai[4];
                        controller.nipC1.text = surat1C.nipPegawai[4];
                        controller.golC1.text = surat1C.golonganPegawai[4];
                      } else if (value == '6') {
                        controller.namaC1.text =
                            controller.namaC1.text = surat1C.namaPegawai[5];
                        controller.nipC1.text = surat1C.nipPegawai[5];
                        controller.golC1.text = surat1C.golonganPegawai[5];
                      } else if (value == '7') {
                        controller.namaC1.text = surat1C.namaPegawai[6];
                        controller.nipC1.text = surat1C.nipPegawai[6];
                        controller.golC1.text = surat1C.golonganPegawai[6];
                      } else if (value == '8') {
                        controller.namaC1.text =
                            controller.namaC1.text = surat1C.namaPegawai[7];
                        controller.nipC1.text = surat1C.nipPegawai[7];
                        controller.golC1.text = surat1C.golonganPegawai[7];
                      } else if (value == '9') {
                        controller.namaC1.text =
                            controller.namaC1.text = surat1C.namaPegawai[8];
                        controller.nipC1.text = surat1C.nipPegawai[8];
                        controller.golC1.text = surat1C.golonganPegawai[8];
                      } else if (value == '10') {
                        controller.namaC1.text = surat1C.namaPegawai[9];
                        controller.nipC1.text = surat1C.nipPegawai[9];
                        controller.golC1.text = surat1C.golonganPegawai[9];
                      } else if (value == '11') {
                        controller.namaC1.text = surat1C.namaPegawai[10];
                        controller.nipC1.text = surat1C.nipPegawai[10];
                        controller.golC1.text = surat1C.golonganPegawai[10];
                      } else if (value == '12') {
                        controller.namaC1.text = surat1C.namaPegawai[11];
                        controller.nipC1.text = surat1C.nipPegawai[11];
                        controller.golC1.text = surat1C.golonganPegawai[11];
                      } else if (value == '13') {
                        controller.namaC1.text = surat1C.namaPegawai[12];
                        controller.nipC1.text = surat1C.nipPegawai[12];
                        controller.golC1.text = surat1C.golonganPegawai[12];
                      } else if (value == '14') {
                        controller.namaC1.text = surat1C.namaPegawai[13];
                        controller.nipC1.text = surat1C.nipPegawai[13];
                        controller.golC1.text = surat1C.golonganPegawai[13];
                      } else if (value == '15') {
                        controller.namaC1.text = surat1C.namaPegawai[14];
                        controller.nipC1.text = surat1C.nipPegawai[14];
                        controller.golC1.text = surat1C.golonganPegawai[14];
                      } else if (value == '16') {
                        controller.namaC1.text = surat1C.namaPegawai[15];
                        controller.nipC1.text = surat1C.nipPegawai[15];
                        controller.golC1.text = surat1C.golonganPegawai[15];
                      } else if (value == '17') {
                        controller.namaC1.text = surat1C.namaPegawai[16];
                        controller.nipC1.text = surat1C.nipPegawai[16];
                        controller.golC1.text = surat1C.golonganPegawai[16];
                      } else if (value == '18') {
                        controller.namaC1.text = surat1C.namaPegawai[17];
                        controller.nipC1.text = surat1C.nipPegawai[17];
                        controller.golC1.text = surat1C.golonganPegawai[17];
                      } else if (value == '19') {
                        controller.namaC1.text = surat1C.namaPegawai[18];
                        controller.nipC1.text = surat1C.nipPegawai[18];
                        controller.golC1.text = surat1C.golonganPegawai[18];
                      } else if (value == '20') {
                        controller.namaC1.text = surat1C.namaPegawai[19];
                        controller.nipC1.text = surat1C.nipPegawai[19];
                        controller.golC1.text = surat1C.golonganPegawai[19];
                      }
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'Pilih pegawai',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    style: const TextStyle(color: Colors.grey),
                    enabled: false,
                    controller: controller.nipC1,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'NIP',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    style: const TextStyle(color: Colors.grey),
                    enabled: false,
                    controller: controller.golC1,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'Golongan',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'Kedudukan',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: '1',
                        child: Text('Tenaga Pengelola Teknis'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == '1') {
                        controller.kdtC1.text = 'Tenaga Pengelola Teknis';
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 20),
                  //NAMA PEGAWAI 2
                  const Text(
                    'Nama pegawai 2',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  BounceInRight(
                      duration: const Duration(seconds: 3),
                      child: Container(
                          color: Colors.amber, width: 150, height: 3)),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        value: '1',
                        child: Text(surat1C.namaPegawai[0]),
                      ),
                      DropdownMenuItem(
                        value: '2',
                        child: Text(surat1C.namaPegawai[1]),
                      ),
                      DropdownMenuItem(
                        value: '3',
                        child: Text(surat1C.namaPegawai[2]),
                      ),
                      DropdownMenuItem(
                        value: '4',
                        child: Text(surat1C.namaPegawai[3]),
                      ),
                      DropdownMenuItem(
                        value: '5',
                        child: Text(surat1C.namaPegawai[4]),
                      ),
                      DropdownMenuItem(
                        value: '6',
                        child: Text(surat1C.namaPegawai[5]),
                      ),
                      DropdownMenuItem(
                        value: '7',
                        child: Text(surat1C.namaPegawai[6]),
                      ),
                      DropdownMenuItem(
                        value: '8',
                        child: Text(surat1C.namaPegawai[7]),
                      ),
                      DropdownMenuItem(
                        value: '9',
                        child: Text(surat1C.namaPegawai[8]),
                      ),
                      DropdownMenuItem(
                        value: '10',
                        child: Text(surat1C.namaPegawai[9]),
                      ),
                      DropdownMenuItem(
                        value: '11',
                        child: Text(surat1C.namaPegawai[10]),
                      ),
                      DropdownMenuItem(
                        value: '12',
                        child: Text(surat1C.namaPegawai[11]),
                      ),
                      DropdownMenuItem(
                        value: '13',
                        child: Text(surat1C.namaPegawai[12]),
                      ),
                      DropdownMenuItem(
                        value: '14',
                        child: Text(surat1C.namaPegawai[13]),
                      ),
                      DropdownMenuItem(
                        value: '15',
                        child: Text(surat1C.namaPegawai[14]),
                      ),
                      DropdownMenuItem(
                        value: '16',
                        child: Text(surat1C.namaPegawai[15]),
                      ),
                      DropdownMenuItem(
                        value: '17',
                        child: Text(surat1C.namaPegawai[16]),
                      ),
                      DropdownMenuItem(
                        value: '18',
                        child: Text(surat1C.namaPegawai[17]),
                      ),
                      DropdownMenuItem(
                        value: '19',
                        child: Text(surat1C.namaPegawai[18]),
                      ),
                      DropdownMenuItem(
                        value: '20',
                        child: Text(surat1C.namaPegawai[19]),
                      ),
                    ],
                    onChanged: (Object? value) {
                      if (value == '1') {
                        controller.namaC2.text = surat1C.namaPegawai[0];
                        controller.nipC2.text = surat1C.nipPegawai[0];
                        controller.golC2.text = surat1C.golonganPegawai[0];
                      } else if (value == '2') {
                        controller.namaC2.text = surat1C.namaPegawai[1];
                        controller.nipC2.text = surat1C.nipPegawai[1];
                        controller.golC2.text = surat1C.golonganPegawai[1];
                      } else if (value == '3') {
                        controller.namaC2.text = surat1C.namaPegawai[2];
                        controller.nipC2.text = surat1C.nipPegawai[2];
                        controller.golC2.text = surat1C.golonganPegawai[2];
                      } else if (value == '4') {
                        controller.namaC2.text = surat1C.namaPegawai[3];
                        controller.nipC2.text = surat1C.nipPegawai[3];
                        controller.golC2.text = surat1C.golonganPegawai[3];
                      } else if (value == '5') {
                        controller.namaC2.text = surat1C.namaPegawai[4];
                        controller.nipC2.text = surat1C.nipPegawai[4];
                        controller.golC2.text = surat1C.golonganPegawai[4];
                      } else if (value == '6') {
                        controller.namaC2.text =
                            controller.namaC2.text = surat1C.namaPegawai[5];
                        controller.nipC2.text = surat1C.nipPegawai[5];
                        controller.golC2.text = surat1C.golonganPegawai[5];
                      } else if (value == '7') {
                        controller.namaC2.text = surat1C.namaPegawai[6];
                        controller.nipC2.text = surat1C.nipPegawai[6];
                        controller.golC2.text = surat1C.golonganPegawai[6];
                      } else if (value == '8') {
                        controller.namaC2.text =
                            controller.namaC2.text = surat1C.namaPegawai[7];
                        controller.nipC2.text = surat1C.nipPegawai[7];
                        controller.golC2.text = surat1C.golonganPegawai[7];
                      } else if (value == '9') {
                        controller.namaC2.text =
                            controller.namaC2.text = surat1C.namaPegawai[8];
                        controller.nipC2.text = surat1C.nipPegawai[8];
                        controller.golC2.text = surat1C.golonganPegawai[8];
                      } else if (value == '10') {
                        controller.namaC2.text = surat1C.namaPegawai[9];
                        controller.nipC2.text = surat1C.nipPegawai[9];
                        controller.golC2.text = surat1C.golonganPegawai[9];
                      } else if (value == '11') {
                        controller.namaC2.text = surat1C.namaPegawai[10];
                        controller.nipC2.text = surat1C.nipPegawai[10];
                        controller.golC2.text = surat1C.golonganPegawai[10];
                      } else if (value == '12') {
                        controller.namaC2.text = surat1C.namaPegawai[11];
                        controller.nipC2.text = surat1C.nipPegawai[11];
                        controller.golC2.text = surat1C.golonganPegawai[11];
                      } else if (value == '13') {
                        controller.namaC2.text = surat1C.namaPegawai[12];
                        controller.nipC2.text = surat1C.nipPegawai[12];
                        controller.golC2.text = surat1C.golonganPegawai[12];
                      } else if (value == '14') {
                        controller.namaC2.text = surat1C.namaPegawai[13];
                        controller.nipC2.text = surat1C.nipPegawai[13];
                        controller.golC2.text = surat1C.golonganPegawai[13];
                      } else if (value == '15') {
                        controller.namaC2.text = surat1C.namaPegawai[14];
                        controller.nipC2.text = surat1C.nipPegawai[14];
                        controller.golC2.text = surat1C.golonganPegawai[14];
                      } else if (value == '16') {
                        controller.namaC2.text = surat1C.namaPegawai[15];
                        controller.nipC2.text = surat1C.nipPegawai[15];
                        controller.golC2.text = surat1C.golonganPegawai[15];
                      } else if (value == '17') {
                        controller.namaC2.text = surat1C.namaPegawai[16];
                        controller.nipC2.text = surat1C.nipPegawai[16];
                        controller.golC2.text = surat1C.golonganPegawai[16];
                      } else if (value == '18') {
                        controller.namaC2.text = surat1C.namaPegawai[17];
                        controller.nipC2.text = surat1C.nipPegawai[17];
                        controller.golC2.text = surat1C.golonganPegawai[17];
                      } else if (value == '19') {
                        controller.namaC2.text = surat1C.namaPegawai[18];
                        controller.nipC2.text = surat1C.nipPegawai[18];
                        controller.golC2.text = surat1C.golonganPegawai[18];
                      } else if (value == '20') {
                        controller.namaC2.text = surat1C.namaPegawai[19];
                        controller.nipC2.text = surat1C.nipPegawai[19];
                        controller.golC2.text = surat1C.golonganPegawai[19];
                      }
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'Pilih Pegawai',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    style: const TextStyle(color: Colors.grey),
                    enabled: false,
                    controller: controller.nipC2,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'NIP',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    style: const TextStyle(color: Colors.grey),
                    enabled: false,
                    controller: controller.golC2,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'Golongan',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'Pilih kedudukan',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: '1',
                        child: Text('Tenaga Pengelola Teknis'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == '1') {
                        controller.kdtC2.text = 'Tenaga Pengelola Teknis';
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const Text(
                    'Note: yang bertanda \' * \' wajib diisi',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  //TOMBOL SUBMIT
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.white,
                      fixedSize: Size(
                        Get.width,
                        10,
                      ),
                    ),
                    onPressed: () {
                      surat1C.getPDF();
                    },
                    child: const Text('Buat Surat'),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
