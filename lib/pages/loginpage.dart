import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:totalx_task/pages/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Lottie.network(
              repeat: false,
              "https://lottie.host/e94a9452-be1d-462e-898c-fff26d3e589a/QDxkuaWaFW.json",
              height: 300,
              width: 300),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 12, bottom: 3),
          child: Row(
            children: [
              Text(
                "Enter Phone Number",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: TextField(
            controller: phoneController,
            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: EdgeInsets.all(8),
              constraints: BoxConstraints(maxWidth: 400),
              labelText: "Enter the Phone Number *",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        )
        // const Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: TextField(
        //     keyboardType: TextInputType.phone,
        //     decoration: InputDecoration(
        //         constraints: BoxConstraints(),
        //         border: UnderlineInputBorder(),
        //         hintText: "Enter the Phone Number*",
        //         enabledBorder: OutlineInputBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(12)))),
        //   ),
        // ),
        ,
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: RichText(
            text: const TextSpan(
              text: "By Continuing, I agree to TotalX's ",
              style: TextStyle(color: Color.fromARGB(255, 89, 87, 87)),
              children: <TextSpan>[
                TextSpan(
                  text: 'Terms and Conditions',
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(text: ' & '),
                TextSpan(
                  text: 'Privacy policy',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
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
            onTap: () {
              FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException ex) {},
                  codeSent: (String verificationid, int? resendtoken) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CodeVerificationPage(
                              verificationId: verificationid,
                            )));
                  },
                  codeAutoRetrievalTimeout: (String verificatioId) {},
                  phoneNumber: phoneController.text.toString());
            },
            child: const Center(
              child: Text(
                "Get OTP",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
