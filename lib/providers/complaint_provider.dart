import 'package:flutter/material.dart';
import 'package:pengaduan_masyarakat/models/complaint_model.dart';
import 'package:pengaduan_masyarakat/services/complaint_service.dart';

class ComplaintProvider with ChangeNotifier {
  final _complaintService = ComplaintService();
  ComplaintModel? _complaintModel;
  ComplaintModel? get complaintModel => _complaintModel;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  checkLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> create(
    String nik,
    String nama,
    String aduan,
  ) async {
    checkLoading(true);

    try {
      final data = await _complaintService.create(
        nik,
        nama,
        aduan,
      );

      _complaintModel = data;
      checkLoading(false);

      return true;
    } catch (e) {
      checkLoading(false);

      return false;
    }
  }
}
