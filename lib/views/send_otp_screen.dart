import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SendOtpScreen extends StatefulWidget {
  const SendOtpScreen({super.key});

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder:
          (BuildContext context, AuthViewModel authViewModel, Widget? child) {
        return Scaffold(
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image.asset(
                      '${AppConstants.appImagesBasePath}img1.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Center(
                    child: Text(
                      "Phone Verification",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "We need to register your phone without getting started!",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _phoneNumberController,
                      onTapOutside: Utils.hideKeyBoardOnTapOutside(),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      maxLengthEnforcement: MaxLengthEnforcement.none,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        prefixIcon: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 10),
                            Text(
                              AppConstants.countryCode,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Opacity(
                              opacity: 0.2,
                              child: Text(
                                "|",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "10 digit phone number",
                        counterText: '',
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter phone number";
                        } else if (val.length != 10) {
                          return "Enter 10 digit phone number";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder<bool>(
                    valueListenable: authViewModel.isLoading,
                    builder: (context, value, child) {
                      return AbsorbPointer(
                        absorbing: value,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12.0),
                              backgroundColor: Colors.green.shade600,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await authViewModel.sendOtp(
                                context,
                                authViewModel,
                                phoneNumber: _phoneNumberController.text,
                              );
                            }
                          },
                          child: value
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : const Text("Send otp"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
  }
}
