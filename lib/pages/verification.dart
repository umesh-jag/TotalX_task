import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:totalx_task/pages/homepage.dart';

// ignore: must_be_immutable
class CodeVerificationPage extends StatefulWidget {
  String verificationId;
  CodeVerificationPage({super.key, required this.verificationId});

  @override
  State<CodeVerificationPage> createState() => _CodeVerificationPageState();
}

class _CodeVerificationPageState extends State<CodeVerificationPage> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Lottie.network(
                  repeat: false,
                  "https://lottie.host/e94a9452-be1d-462e-898c-fff26d3e589a/QDxkuaWaFW.json",
                  height: 300,
                  width: 300),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      'OTP Verification',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: RichText(
                  text: const TextSpan(
                    text: "Enter the Verification code we just sent to your ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 89, 87, 87), fontSize: 17),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'number +91********21',
                        style: TextStyle(
                            color: Color.fromARGB(255, 89, 87, 87),
                            fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildCodeInputs(),
              ),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't get OTP?"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Resend",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
                height: 50,
                width: 370,
                child: GestureDetector(
                  onTap: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: widget.verificationId,
                              smsCode: otpController.text.toString());
                      FirebaseAuth.instance
                          .signInWithCredential(credential)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      });
                    } catch (ex) {
                      log(ex.toString());
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCodeInputs() {
    List<Widget> inputs = [];

    for (int i = 0; i < 6; i++) {
      inputs.add(
        SizedBox(
          width: 50,
          child: TextField(
            controller: _controllers[i],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            onChanged: (String value) {
              if (value.isEmpty && i > 0) {
                FocusScope.of(context)
                    .previousFocus(); // Move to the previous input field
              } else if (value.isNotEmpty && i < 5) {
                FocusScope.of(context)
                    .nextFocus(); // Move to the next input field
              }
            },
            decoration: InputDecoration(
              counter: const Offstage(),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      );
    }

    return inputs;
  }
}
