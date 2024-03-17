import 'dart:convert';
import 'package:http/http.dart';
import 'package:pengaduan_masyarakat/models/complaint_model.dart';
import '../common/constant.dart';

class ComplaintService {
  Future<ComplaintModel> create(
    String nik,
    String nama,
    String aduan,
  ) async {
    String apiURL = "${baseAPIURL()}/create-pengaduan";

    try {
      var response = await post(
        Uri.parse(apiURL),
        headers: header(false),
        body: {
          'nik': nik,
          'nama': nama,
          'aduan': aduan,
        },
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
