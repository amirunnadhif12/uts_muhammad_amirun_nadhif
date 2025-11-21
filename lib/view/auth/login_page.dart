import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/auth_controller.dart';
import 'register_page.dart';
import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userC = TextEditingController();
  final passC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF1AAE6F);
    final auth = Provider.of<AuthController>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, foregroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 18),
              const Align(alignment: Alignment.centerLeft, child: Text('Login', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
              const SizedBox(height: 8),
              const Align(alignment: Alignment.centerLeft, child: Text('Welcome back! Please login to continue.', style: TextStyle(color: Colors.black54))),
              const SizedBox(height: 28),
              TextFormField(controller: userC, decoration: const InputDecoration(labelText: 'Username', prefixIcon: Icon(Icons.person)), validator: (v) => v == null || v.isEmpty ? 'Wajib diisi' : null),
              const SizedBox(height: 14),
              TextFormField(controller: passC, obscureText: _obscure, decoration: InputDecoration(labelText: 'Password', prefixIcon: const Icon(Icons.lock), suffixIcon: IconButton(icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility), onPressed: () => setState(() => _obscure = !_obscure))), validator: (v) => v == null || v.length < 6 ? 'Minimal 6 karakter' : null),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _loading ? null : () async {
                    if (!_formKey.currentState!.validate()) return;
                    setState(() => _loading = true);
                    final ok = await auth.login(userC.text.trim(), passC.text.trim());
                    setState(() => _loading = false);
                    if (!ok) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Username atau password salah')));
                    } else {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: _loading ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : const Text('Login', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterPage())), child: const Text('Don\'t have an account? Sign Up')),
            ],
          ),
        ),
      ),
    );
  }
}
