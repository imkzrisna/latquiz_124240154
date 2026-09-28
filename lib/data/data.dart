// DATA AKUN LOGIN
// File ini hanya menyimpan data akun (pengganti database sederhana).
// LoginPage akan membandingkan input pengguna dengan isi variabel user1.

// Model/blueprint sebuah akun.
class User {
  String username;
  String password;
  String nama;

  // 'required' = wajib diisi saat membuat objek User.
  User({required this.username, required this.password, required this.nama});
}

// Satu akun yang boleh login. Username & password harus sama persis (case-sensitive).
User user1 = User(username: 'Krisna', password: '154', nama: 'Krisna');
