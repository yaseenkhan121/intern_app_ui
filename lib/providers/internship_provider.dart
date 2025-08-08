import 'package:flutter/material.dart';
import 'package:intern_management_system_app/providers/internship_api_service.dart';
import '../models/internship.dart';
import '../services/internship_api_service.dart';

class InternshipProvider with ChangeNotifier {
  final InternshipApiService _apiService = InternshipApiService();
  List<Internship> _allInternships = [];
  bool _isLoading = false;

  List<Internship> get allInternships => _allInternships;
  List<Internship> get savedInternships => _allInternships.where((i) => i.isSaved).toList();
  bool get isLoading => _isLoading;

  Future<void> fetchInternships() async {
    _isLoading = true;
    notifyListeners();

    try {
      _allInternships = await _apiService.fetchInternships();
    } catch (e) {
      // In a real app, you would handle errors here
      print('Error fetching internships: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  void toggleSaveStatus(String id) {
    final internship = _allInternships.firstWhere((i) => i.id == id);
    internship.isSaved = !internship.isSaved;
    notifyListeners();
  }
}