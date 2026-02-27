import 'package:ecomm_class/ui/on_boarding/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/utils/ui_helper.dart';
import 'bloc/user_bloc.dart';
import 'bloc/user_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isAccCreated = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobNoController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, please sign up..",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 11),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                controller: nameController,
                decoration: AppDecoration.mDecoration(
                  label: "Name",
                  hint: "Enter your name here..",
                ),
              ),
              SizedBox(height: 11),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
                decoration: AppDecoration.mDecoration(
                  label: "Email",
                  hint: "Enter your email here..",
                ),
              ),
              SizedBox(height: 11),
              TextFormField(
                controller: mobNoController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your mobile number";
                  } else if (value.length != 10) {
                    return "Please enter a valid mobile number";
                  }
                  return null;
                },
                decoration: AppDecoration.mDecoration(
                  label: "Mobile Number",
                  hint: "Enter your mobile number here..",
                ),
              ),
              SizedBox(height: 11),
              TextFormField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  } else if (!RegExp(
                    r'''^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}''',
                  ).hasMatch(value)) {
                    return "Password must be at least 8 characters \nand include uppercase, lowercase, digit, \nand special character.";
                  }
                  return null;
                },
                decoration: AppDecoration.mDecoration(
                  label: "Password",
                  hint: "Enter your password here..",
                  isPassword: true,
                  isPasswordVisible: isPasswordVisible,
                  onObscuretap: () {
                    isPasswordVisible = !isPasswordVisible;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 11),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: !isConfirmPasswordVisible,
                validator: (value) {
                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    return "Password does not match";
                  }
                  return null;
                },

                decoration: AppDecoration.mDecoration(
                  label: "Confirm Password",
                  hint: "Enter your password here..",
                  isPassword: true,
                  isPasswordVisible: isConfirmPasswordVisible,
                  onObscuretap: () {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 11),
              SizedBox(
                width: double.infinity,
                child: BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UserLoadingState) {
                      isAccCreated = true;
                    }

                    if (state is UserFailureState) {
                      isAccCreated = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: ${state.errorMsg}'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }

                    if (state is UserSuccessState) {
                      isAccCreated = false;
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Account created successfully!!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade200,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          /// sign up work here
                          context.read<UserBloc>().add(
                            UserRegisterEvent(
                              name: nameController.text,
                              email: emailController.text,
                              mobileNo: mobNoController.text,
                              password: passwordController.text,
                            ),
                          );
                        }
                      },
                      child: isAccCreated
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: CircularProgressIndicator(),
                                ),
                                SizedBox(width: 11),
                                Text('Creating Account...'),
                              ],
                            )
                          : Text('SignUp'),
                    );
                  },
                ),
              ),
              SizedBox(height: 11),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Already have an account,'),
                        TextSpan(
                          text: ' Login now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade200,
                          ),
                        ),
                      ],
                      style: TextStyle(color: Colors.black),
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
}
