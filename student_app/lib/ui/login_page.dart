import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/bloc/login_bloc.dart';
import 'package:student_app/bloc/login_event.dart';
import 'package:student_app/bloc/login_state.dart';
import 'package:student_app/ui/home_page.dart';

class LoginScreen extends StatelessWidget {
  bool showPassword = true;
  LoginScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: loginController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          labelText: 'Login',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your login';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration:  InputDecoration(
                          suffixIcon: IconButton(

                            onPressed: (){

                          },
                            color: Colors.grey,
                            icon:showPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),


                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                          ),
                        ),
                        obscureText: showPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.cyan,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(LoginAuthEvent(
                                login: loginController.text,
                                password: passwordController.text));
                          }
                        },
                        child: Container(
                          height: 55,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF00B8D4),
                                Color(0xFF008B8B),
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          try {
                            if (state is LoginSuccess) {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                              return const SizedBox.shrink();
                            }
                            else if (state is LoginFailure) {
                              state.message = "login or password incorrect";
                              return Text(state.message,style:TextStyle(
                                color: Colors.red,
                              ),);
                            }
                            else {
                              return const Text('Login');
                            }
                          } catch (error) {
                            print(error);
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
