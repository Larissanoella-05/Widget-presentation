import 'package:flutter/material.dart';
import '../widgets/country_dropdown.dart';
import '../widgets/custom_icon_button.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key});

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;
  String? _selectedSex;
  String? _selectedCountry;
  bool _machineLearning = false;
  bool _fullStack = false;
  bool _mobileApp = false;
  double _tuitionValue = 50.0;
  bool _showSuccessMessage = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    setState(() {
      _showSuccessMessage = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showSuccessMessage = false;
        });
      }
    });

    print('Username: ${usernameController.text}');
    print('Password: ${passwordController.text}');
    print('Sex: $_selectedSex');
    print('Country: $_selectedCountry');
    print('Courses: ML=$_machineLearning, FS=$_fullStack, Mobile=$_mobileApp');
    print('Tuition: $_tuitionValue');
  }

  void _clearForm() {
    setState(() {
      usernameController.clear();
      passwordController.clear();
      _selectedSex = null;
      _selectedCountry = null;
      _machineLearning = false;
      _fullStack = false;
      _mobileApp = false;
      _tuitionValue = 50.0;
      _showSuccessMessage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        toolbarHeight: 80.0,
        title: const Text(
          'User Registration Form',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Color(0xFF1a1a1a)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: usernameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Username must be 15-18 long',
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 193, 189, 189),
                      fontSize: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[600]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[900],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'password must be 6 or 8 long',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[600]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[900],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey[400],
                        size: 22,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                const Text(
                  'Sex',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Male',
                      groupValue: _selectedSex,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          _selectedSex = value;
                        });
                      },
                    ),
                    const Text(
                      'Male',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(width: 15),
                    Radio<String>(
                      value: 'Female',
                      groupValue: _selectedSex,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          _selectedSex = value;
                        });
                      },
                    ),
                    const Text(
                      'Female',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                const Text(
                  'Country',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                CountryDropdown(
                  selectedCountry: _selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      _selectedCountry = value;
                    });
                  },
                ),
                const SizedBox(height: 15),

                const SizedBox(height: 20),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CustomIconButton(
                          icon: Icons.send,
                          onPressed: _submitForm,
                          backgroundColor: Colors.lightGreen[600],
                        ),
                        const Text(
                          'Submit',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomIconButton(
                          icon: Icons.clear,
                          onPressed: _clearForm,
                          backgroundColor: const Color.fromARGB(
                            255,
                            135,
                            98,
                            96,
                          ),
                        ),
                        const Text(
                          'Clear',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomIconButton(
                          icon: Icons.info,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Form information displayed!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          backgroundColor: const Color.fromARGB(1, 12, 12, 12),
                        ),
                        const Text(
                          'Info',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                if (_showSuccessMessage)
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              255,
                              135,
                              183,
                              137,
                            ).withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Text(
                        'Submitted successful ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
