import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';
import 'package:pengaduan_masyarakat/models/complaint_model.dart';
import '../common/constant.dart';
import 'package:path/path.dart' as path;

class ComplaintService {
  Future<ComplaintModel> create(
    String nik,
    String nama,
    String aduan,
    FilePickerResult? bukti,
  ) async {
    String apiURL = "${baseAPIURL()}/create-pengaduan";

    try {
      // var response = await post(
      //   Uri.parse(apiURL),
      //   headers: header(false),
      //   body: {
      //     'nik': nik,
      //     'nama': nama,
      //     'aduan': aduan,
      //   },
      // );

      var request = MultipartRequest(
        'POST',
        Uri.parse(apiURL),
      );
      request.headers.addAll(
        {
          'Accept': 'application/json',
          'Content-Type': 'multipart/form-data',
        },
      );

      request.fields.addAll(
        {
          'nik': nik,
          'nama': nama,
          'aduan': aduan,
        },
      );

      if (bukti != null) {
        File file = File(bukti.files.single.path!);
        var stream = ByteStream(file.openRead());
        stream.cast();
        var length = await file.length();

        request.files.add(
          MultipartFile(
            "bukti",
            stream,
            length,
            filename: path.basename(file.path),
          ),
        );
      }

      Response response = await Response.fromStream(
        await request.send(),
      );

      if (response.statusCode == 200) {
        var jsonObject = jsonDecode(response.body);
        // print(jsonObject);

        return ComplaintModel.fromJson(jsonObject);
      } else {
        var jsonObject = jsonDecode(response.body);
        // print(jsonObject);

        return ComplaintModel.fromJson(jsonObject);
      }
    } catch (e) {
      // print(e);
      throw Exception("Pengaduan Gagal. Error: $e");
    }
  }
}
