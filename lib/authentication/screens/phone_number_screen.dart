import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.lightBlue,
            Colors.white,
            Colors.lightBlue,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.only(left: 20, right: 20),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Material(
                      shape: CircleBorder(),
                      elevation: 10,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/img4.jpg'),
                        radius: 50,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Welcome to ReVYb',
                      style: GoogleFonts.comicNeue(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: TextField(
                        maxLength: 10,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        cursorColor: Colors.lightBlue,
                        keyboardType: TextInputType.phone,
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          counterText: '',
                          prefixIcon: const Icon(Icons.phone),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          ),
                          prefix: const Text('+91 '),
                          labelStyle: const TextStyle(color: Colors.grey),
                          floatingLabelStyle:
                              const TextStyle(color: Colors.lightBlue),
                          label: Text(
                            'Phone Number',
                            style: GoogleFonts.comicNeue(
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {},
                          child: Text("Login",
                              style: GoogleFonts.comicNeue(
                                  fontSize: 23, fontWeight: FontWeight.bold))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
