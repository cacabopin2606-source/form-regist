// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Mahasiswa {
  String fullname;
  String email;
  String nomorHp;
  String gender;
  String tanggalLahir;
  String alamat;
  String username;
  String password;

  Mahasiswa({
    required this.fullname,
    required this.email,
    required this.nomorHp,
    required this.gender,
    required this.tanggalLahir,
    required this.alamat,
    required this.username,
    required this.password,
  });

  Mahasiswa copyWith({
    String? fullname,
    String? email,
    String? nomorHp,
    String? gender,
    String? tanggalLahir,
    String? alamat,
    String? username,
    String? password,
  }) {
    return Mahasiswa(
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      nomorHp: nomorHp ?? this.nomorHp,
      gender: gender ?? this.gender,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      alamat: alamat ?? this.alamat,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'email': email,
      'nomorHp': nomorHp,
      'gender': gender,
      'tanggalLahir': tanggalLahir,
      'alamat': alamat,
      'username': username,
      'password': password,
    };
  }

  factory Mahasiswa.fromMap(Map<String, dynamic> map) {
    return Mahasiswa(
      fullname: map['fullname'] as String,
      email: map['email'] as String,
      nomorHp: map['nomorHp'] as String,
      gender: map['gender'] as String,
      tanggalLahir: map['tanggalLahir'] as String,
      alamat: map['alamat'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mahasiswa.fromJson(String source) => Mahasiswa.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Mahasiswa(fullname: $fullname, email: $email, nomorHp: $nomorHp, gender: $gender, tanggalLahir: $tanggalLahir, alamat: $alamat, username: $username, password: $password)';
  }

  @override
  bool operator ==(covariant Mahasiswa other) {
    if (identical(this, other)) return true;
  
    return 
      other.fullname == fullname &&
      other.email == email &&
      other.nomorHp == nomorHp &&
      other.gender == gender &&
      other.tanggalLahir == tanggalLahir &&
      other.alamat == alamat &&
      other.username == username &&
      other.password == password;
  }

  @override
  int get hashCode {
    return fullname.hashCode ^
      email.hashCode ^
      nomorHp.hashCode ^
      gender.hashCode ^
      tanggalLahir.hashCode ^
      alamat.hashCode ^
      username.hashCode ^
      password.hashCode;
  }
}

final List<Mahasiswa> anggotaKelompok = [
    Mahasiswa(
      fullname: 'Fariq Muhammad Kajayataa',
      email: 'fariq@example.com',
      nomorHp: '08123456789',
      gender: 'Laki-laki',
      tanggalLahir: '01/01/2000',
      alamat: 'Jl. Contoh No. 123',
      username: 'fariq',
      password: '',
    ),
    Mahasiswa(
      fullname: 'Nadia Laela Anabella Kurnia',
      email: 'nadia@example.com',
      nomorHp: '08123456789',
      gender: 'Perempuan',
      tanggalLahir: '01/01/2000',
      alamat: 'Jl. Contoh No. 123',
      username: 'nadia',
      password: '',
    ),
    Mahasiswa(
      fullname: 'Muhammad Sony Budiman',
      email: 'sony@example.com',
      nomorHp: '08123456789',
      gender: 'Laki-laki',
      tanggalLahir: '01/01/2000',
      alamat: 'Jl. Contoh No. 123',
      username: 'sony',
      password: '',
    ),
    Mahasiswa(
      fullname: 'Muhammad Reyvan Ardiansyah',
      email: 'reyvan@example.com',
      nomorHp: '08123456789',
      gender: 'Laki-laki',
      tanggalLahir: '01/01/2000',
      alamat: 'Jl. Contoh No. 123',
      username: 'reyvan',
      password: '',
    ),
    Mahasiswa(
      fullname: 'Darma Abdi Negara',
      email: 'darma@example.com',
      nomorHp: '08123456789',
      gender: 'Laki-laki',
      tanggalLahir: '01/01/2000',
      alamat: 'Jl. Contoh No. 123',
      username: 'darma',
      password: '',
    ),
  ];