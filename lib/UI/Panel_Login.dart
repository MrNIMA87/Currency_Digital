import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/Home_Page.dart';
import 'Panel_Register.dart';
import 'package:multi_state_button/multi_state_button.dart';
import 'package:shimmer/shimmer.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  static const String _submit = "Submit";
  static const String _loading = "Loading";
  static const String _success = "Success";

  final MultiStateButtonController multiStateButtonController =
      MultiStateButtonController(initialStateName: _submit);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(230, 23, 24, 29),

        //AppBar
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(230, 29, 29, 36),
          title: Shimmer.fromColors(
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 30),
              ),
              baseColor: Colors.white,
              highlightColor: Colors.white70),
          centerTitle: true,
          elevation: 10,
        ),
        body: SafeArea(
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              //icon change mode body

              const SizedBox(
                height: 170,
              ),
              //Text Big....
              const Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              //Inputs
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.1,
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        )
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email,Phone Number',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 1),
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.1,
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                      )
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              //buttom
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: Container(
                    child: MultiStateButton(
                      multiStateButtonController: multiStateButtonController,
                      buttonStates: [
                        ButtonState(
                          stateName: _submit,
                          child: const Text(
                            _submit,
                          ),
                          textStyle:
                              const TextStyle(color: Colors.white, fontSize: 20),
                          size: const Size(160, 48),
                          color: const Color.fromARGB(255, 250, 34, 19),
                          onPressed: () => multiStateButtonController
                              .setButtonState = _loading,
                        ),
                        ButtonState(
                          stateName: _loading,
                          alignment: Alignment.center,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.white,
                            ),
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.all(Radius.circular(48)),
                          ),
                          size: const Size(48, 48),
                          onPressed: () => multiStateButtonController
                              .setButtonState = _success,
                        ),
                        ButtonState(
                          stateName: _success,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                _success,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            ],
                          ),
                          textStyle:
                              const TextStyle(color: Colors.white, fontSize: 22),
                          color: Colors.green,
                          size: const Size(200, 48),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Did you not register?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Register(),
                        ));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          shadows: [
                            BoxShadow(
                              color: Colors.yellow,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 0),
                            ),
                          ],
                          fontWeight: FontWeight.w900,
                          fontSize: 19,
                          color: Colors.yellow,
                        ),
                      ))
                ],
              ),
            ],
          )),
        ));
  }
}
