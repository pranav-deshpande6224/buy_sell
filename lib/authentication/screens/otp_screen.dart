import 'package:buy_sell/authentication/auth_handler.dart';
import 'package:buy_sell/authentication/provider/auth_handler_provider.dart';
import 'package:buy_sell/authentication/provider/otp_button_state_provider.dart';
import 'package:buy_sell/authentication/provider/password_see_notsee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({
    super.key,
    required this.phoneNo,
    required this.verificationId,
  });
  final String phoneNo;
  final String verificationId;

  @override
  ConsumerState<OtpScreen> createState() {
    return _OtpScreenState();
  }
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final _otpController = TextEditingController();
  late AuthHandler handler;

  @override
  void initState() {
    handler = ref.read(authHandlerProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue,
              Colors.white,
              Colors.lightBlue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 12, right: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter OTP',
                      style: GoogleFonts.comicNeue(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        text:
                            'Confirmation Code is sent to the registered mobile Number : ',
                        style: GoogleFonts.comicNeue(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: widget.phoneNo,
                            style: GoogleFonts.comicNeue(
                              color: Colors.lightBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Consumer(builder: (ctx, ref, child) {
                      final value = ref.watch(passwordProvider);
                      return TextField(
                        maxLength: 6,
                        obscureText: value == false ? true : false,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        cursorColor: Colors.lightBlue,
                        keyboardType: TextInputType.phone,
                        controller: _otpController,
                        decoration: InputDecoration(
                          counterText: '',
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ref.read(passwordProvider.notifier).stateChange();
                            },
                            icon: Icon(
                              value == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.lightBlue,
                          ),
                          label: Text(
                            'OTP',
                            style: GoogleFonts.comicNeue(
                                fontSize: 20, color: Colors.black87),
                          ),
                        ),
                        onChanged: (value) {
                          ref
                              .read(otpChangeProvider.notifier)
                              .changeStateOtpButton(value);
                        },
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Consumer(
                        builder: (ctx, ref, child) {
                          final value = ref.watch(otpChangeProvider);
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: value
                                ? () {
                                    handler.verifyOTP(
                                      widget.verificationId,
                                      _otpController.text,
                                      ctx
                                    );
                                  }
                                : null,
                            child: Text(
                              "Validate OTP",
                              style: GoogleFonts.comicNeue(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
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
