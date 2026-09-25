import 'package:flutter/material.dart';
import '../models/mahasiswa.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  // Controller untuk setiap input
  final TextEditingController namaController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController hpController =
      TextEditingController();

  final TextEditingController tanggalController =
      TextEditingController();

  final TextEditingController alamatController =
      TextEditingController();

  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  // Menyimpan pilihan gender
  String? selectedGender;

  // Menyimpan tanggal yang dipilih
  DateTime? selectedDate;

  // Mengatur tampilan password
  bool isObscure = true;

  // Object mahasiswa hasil dari form
  Mahasiswa? mahasiswa;

  // Menentukan apakah data sudah disubmit
  bool isSubmitted = false;

  // Memilih tanggal lahir
  Future<void> pilihTanggal() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;

        tanggalController.text =
            "${picked.day.toString().padLeft(2, '0')}/"
            "${picked.month.toString().padLeft(2, '0')}/"
            "${picked.year}";
      });
    }
  }

  // Submit form
  void submitForm() {
  if (_formKey.currentState!.validate()) {

    final mahasiswa = Mahasiswa(
      fullname: namaController.text,
      email: emailController.text,
      nomorHp: hpController.text,
      gender: selectedGender!,
      tanggalLahir: tanggalController.text,
      alamat: alamatController.text,
      username: usernameController.text,
      password: passwordController.text,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          mahasiswa: mahasiswa,
          anggotaKelompok: anggotaKelompok,
        ),
      ),
    );
  

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registrasi berhasil dikirim!'),
        ),
      );
    }
  }

  // Validasi input
  String? wajibDiisi(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Kolom ini wajib diisi';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // =========================
                // JUDUL
                // =========================

                const Text(
                  'Buat Akun Baru',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Silakan lengkapi data diri Anda.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 25),

                // =========================
                // NAMA
                // =========================

                TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: wajibDiisi,
                ),

                const SizedBox(height: 15),

                // =========================
                // EMAIL
                // =========================

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Email wajib diisi';
                    }

                    if (!value.contains('@')) {
                      return 'Format email tidak valid';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // =========================
                // NOMOR HP
                // =========================

                TextFormField(
                  controller: hpController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Nomor HP',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  validator: wajibDiisi,
                ),

                const SizedBox(height: 15),

                // =========================
                // GENDER
                // =========================

                DropdownButtonFormField<String>(
                  value: selectedGender,
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    prefixIcon: Icon(Icons.people),
                    border: OutlineInputBorder(),
                  ),

                  items: const [
                    DropdownMenuItem(
                      value: 'Laki-laki',
                      child: Text('Laki-laki'),
                    ),
                    DropdownMenuItem(
                      value: 'Perempuan',
                      child: Text('Perempuan'),
                    ),
                  ],

                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },

                  validator: (value) {
                    if (value == null) {
                      return 'Gender wajib dipilih';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // =========================
                // TANGGAL LAHIR
                // =========================

                TextFormField(
                  controller: tanggalController,
                  readOnly: true,
                  onTap: pilihTanggal,

                  decoration: const InputDecoration(
                    labelText: 'Tanggal Lahir',
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                    suffixIcon:
                        Icon(Icons.arrow_drop_down),
                  ),

                  validator: wajibDiisi,
                ),

                const SizedBox(height: 15),

                // =========================
                // ALAMAT
                // =========================

                TextFormField(
                  controller: alamatController,
                  maxLines: 3,

                  decoration: const InputDecoration(
                    labelText: 'Alamat',
                    prefixIcon: Icon(Icons.home),
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),

                  validator: wajibDiisi,
                ),

                const SizedBox(height: 15),

                // =========================
                // USERNAME
                // =========================

                TextFormField(
                  controller: usernameController,

                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon:
                        Icon(Icons.account_circle),
                    border: OutlineInputBorder(),
                  ),

                  validator: wajibDiisi,
                ),

                const SizedBox(height: 15),

                // =========================
                // PASSWORD
                // =========================

                TextFormField(
                  controller: passwordController,
                  obscureText: isObscure,

                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),

                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),

                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                  ),

                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return 'Password wajib diisi';
                    }

                    if (value.length < 8) {
                      return 'Password minimal 8 karakter';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 25),

                // =========================
                // SUBMIT
                // =========================

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    onPressed: submitForm,

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),

                    child: const Text(
                      'Submit Registrasi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // =================================================
                // HASIL SETELAH SUBMIT
                // =================================================

                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}