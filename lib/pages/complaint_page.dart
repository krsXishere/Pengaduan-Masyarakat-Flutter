import 'package:flutter/material.dart';
import 'package:pengaduan_masyarakat/common/constant.dart';
import 'package:pengaduan_masyarakat/providers/complaint_provider.dart';
import 'package:pengaduan_masyarakat/widgets/custom_button_widget.dart';
import 'package:pengaduan_masyarakat/widgets/custom_textformfield_widget.dart';
import 'package:provider/provider.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final nikController = TextEditingController();
  final namaController = TextEditingController();
  final aduanController = TextEditingController();

  showSnackBar(
    String message,
    Color color,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(
          message,
          style: primaryTextStyle.copyWith(
            color: white,
          ),
        ),
      ),
    );
  }

  aduan(ComplaintProvider value) async {
    if (nikController.text.isNotEmpty &&
        namaController.text.isNotEmpty &&
        aduanController.text.isNotEmpty) {
      if (nikController.text.length == 16) {
        if (await value.create(
          nikController.text,
          namaController.text,
          aduanController.text,
        )) {
          showSnackBar(
            "Berhasil mengirim pengaduan!",
            primaryColor,
          );

          nikController.clear();
          namaController.clear();
          aduanController.clear();
        } else {
          showSnackBar(
            "Gagal mengirim pengaduan",
            Colors.red,
          );
        }
      } else {
        showSnackBar(
          "Masukkan NIK dengan benar",
          Colors.red,
        );
      }
    } else {
      showSnackBar(
        "Isi semua data",
        Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ComplaintProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Pengaduan",
              style: primaryTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(defaultPadding),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  CustomTextFormFieldWidget(
                    hintText: "Masukkan NIK valid",
                    label: "NIK",
                    isPasswordField: false,
                    controller: nikController,
                    type: TextInputType.number,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  CustomTextFormFieldWidget(
                    hintText: "Masukkan nama lengkap",
                    label: "Nama Lengkap",
                    isPasswordField: false,
                    controller: namaController,
                    type: TextInputType.text,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  CustomTextFormFieldWidget(
                    hintText: "Deskripsikan perihal yang ingin disampaikan",
                    label: "Aduan",
                    isPasswordField: false,
                    controller: aduanController,
                    type: TextInputType.text,
                    expands: true,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  CustomButtonWidget(
                    text: "Kirim Sekarang!",
                    color: primaryColor,
                    isLoading: value.isLoading,
                    onPressed: () {
                      aduan(value);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
