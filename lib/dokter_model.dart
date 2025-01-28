class Doctor {

final String name;

final String specialty;

Doctor({required this.name, required this.specialty});

factory Doctor.fromJson(Map<String, dynamic> json) {

return Doctor(

name: json['nama_dokter'] as String,

specialty: json['spesialisasi'] as String,

);

}

}