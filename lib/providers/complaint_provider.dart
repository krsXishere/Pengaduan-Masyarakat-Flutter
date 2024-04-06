import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pengaduan_masyarakat/models/complaint_model.dart';
import 'package:pengaduan_masyarakat/services/complaint_service.dart';

class ComplaintProvider with ChangeNotifier {
  final _complaintService = ComplaintService();
  ComplaintModel? _complaintModel;
  ComplaintModel? get complaintModel => _complaintModel;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  FilePickerResult? _filePicked;
  FilePickerResult? get filePicked => _filePicked;

  checkLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  checkFilePicked(FilePickerResult? value) {
    _filePicked = value;
    notifyListeners();
  }

  deleteFilePicked() async {
    if (_filePicked != null) {
      _filePicked = null;
      notifyListeners();
    }
  }

  Future<bool> create(
    String nik,
    String nama,
    String aduan,
    FilePickerResult? bukti,
  ) async {
    checkLoading(true);

    try {
      final data = await _complaintService.create(
        nik,
        nama,
        aduan,
        bukti,
      );

      _complaintModel = data;
      checkLoading(false);
      deleteFilePicked();

      return true;
    } catch (e) {
      checkLoading(false);

      return false;
    }
  }
}
