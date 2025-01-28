import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dokter_model.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8002/rest/v1';
  static const Map<String, String> headers = {
     'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5oZGZlZXJnbGJkeXJsd212b3hoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYzNDIzMjAsImV4cCI6MjA1MTkxODMyMH0.qRpWYz1bQZizSWi6j6wZN_WgOMxuwsKWqguyIM-GGnw',
  };

  Future<List<Doctor>> getDoctors() async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/dokter'),
        headers: headers,
      );

print(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Doctor.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Doctor>> getDoctorsDummy() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay

    final List<Map<String, dynamic>> dummyData = [
      {
        "id": "fc4dba96-d4f7-462e-ae64-5d374625ed3f",
        "user_id": "f2388c06-b04e-4fa3-b596-2017f444af4c",
        "department_id": "10d8d1fb-1a9a-46a2-920b-ca5f30f5938f",
        "license_number": "doctor 2",
        "experience_years": null,
        "education": null,
        "created_at": "2025-01-16T06:32:50.500211+00:00",
        "updated_at": "2025-01-16T06:32:50.500211+00:00",
        "users": {"full_name": "doctor 2"},
        "departments": {
          "name": "Anak",
          "specializations": {"name": "Anak"}
        }
      },
      {
        "id": "ca6b3c86-7796-41a6-ac9b-6aea6e72945d",
        "user_id": "9a81100b-475e-4eac-b160-23085668af31",
        "department_id": "3777e156-51c1-4934-8332-6c85e8aea6f6",
        "license_number": "-3080jk87",
        "experience_years": 9,
        "education": null,
        "created_at": "2025-01-16T10:58:37.347272+00:00",
        "updated_at": "2025-01-16T10:58:37.347272+00:00",
        "users": {"full_name": "doctor 1"},
        "departments": {
          "name": "Umum",
          "specializations": {"name": "Umum"}
        }
      }
    ];

    return dummyData.map((json) => Doctor.fromJson(json)).toList();
  }
}
