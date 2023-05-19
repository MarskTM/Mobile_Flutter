import './loginScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:btl_cuoi_ki_nhom2/pages/mainPage.dart';
import 'package:btl_cuoi_ki_nhom2/models/payload.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  TextEditingController _textEditingController = TextEditingController();
  RegisterPayload registerPayload = RegisterPayload('', '', '');

  void singUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: registerPayload.email, password: registerPayload.password);
      print(userCredential);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Sign-up Success',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              content: Text(
                'Email-already-in-use !',
                style: TextStyle(color: Colors.purple),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => mainPage()));
                    },
                    child: Text('Goto HomePage',
                        style: TextStyle(color: Colors.blue))),
              ],
            );
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The password provided is too weak.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The account already exists for that email.'),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _textEditingController.clear();
    super.dispose();
  }

  bool isEmailCorrect = false;
  bool isPasswordCorrect = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx7IBkCtYd6ulSfLfDL-aSF3rv6UfmWYxbSE823q36sPiQNVFFLatTFdGeUSnmJ4tUzlo&usqp=CAU'),
                fit: BoxFit.cover,
                opacity: 0.3)),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                      'https://assets6.lottiefiles.com/packages/lf20_k9wsvzgd.json',
                      animate: true,
                      height: 120,
                      width: 600),
                  Text(
                    'Register Now',
                    style: GoogleFonts.indieFlower(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),

                  // Declearing the form size
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 280,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 20),
                          child: TextFormField(
                            controller: _textEditingController,
                            // Check validate email
                            onChanged: (val) => {
                              setState(() {
                                isEmailCorrect = !val.isEmpty;
                                registerPayload.email = val;
                              })
                            },
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.purple,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Email",
                              hintText: 'your-email@domain.com',
                              labelStyle: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              obscuringCharacter: '*',
                              obscureText: true,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.purple,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Password",
                                hintText: '********',
                                labelStyle: TextStyle(color: Colors.purple),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  isPasswordCorrect = value.length >= 6;
                                  registerPayload.password = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Form(
                            // key: _formKey,
                            child: TextFormField(
                              obscuringCharacter: '*',
                              obscureText: true,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.purple,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Valid Password",
                                hintText: '********',
                                labelStyle: TextStyle(color: Colors.purple),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  registerPayload.resPassword = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //this is button register
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.purple,
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 3.3,
                              vertical: 20)),
                      onPressed: () {
                        if (!isEmailCorrect) {
                          print("email: " + registerPayload.email);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email Invalid!'),
                            ),
                          );
                        } else if (!isPasswordCorrect) {
                          print("password: " + registerPayload.password);
                          print("re-password: " + registerPayload.resPassword);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Password Invalid!'),
                            ),
                          );
                        } else if (registerPayload.password !=
                            registerPayload.resPassword) {
                          print("password: " + registerPayload.password);
                          print("re-password: " + registerPayload.resPassword);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Password Not Match!'),
                            ),
                          );
                        } else {
                          singUp();
                        }
                      },
                      child: Text(
                        'Sign up!',
                        style: TextStyle(fontSize: 17),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I already have an account',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      TextButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      loginScreen()))
                        },
                        child: Text(
                          'Go Back!',
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
