import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:model_mvvm/res/app_color.dart';
import 'package:model_mvvm/res/components/round_custom_button.dart';
import 'package:model_mvvm/utils/routes/routes_name.dart';
import 'package:model_mvvm/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _obscureText.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Log in',
          style: TextStyle(
              color: AppColor.whiteColor
          ),),
        backgroundColor: AppColor.buttonColor,

      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: Utils(context).height * .02,
              ),
              ValueListenableBuilder(
                  valueListenable: _obscureText,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      textInputAction: TextInputAction.next,
                      obscureText: value,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                              onTap: () => _obscureText.value = !_obscureText.value,
                              child: Icon(
                                  value ? Icons.visibility : Icons.visibility_off)),
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      keyboardType: TextInputType.emailAddress,
                    );
                  }),
              SizedBox(height: Utils(context).height * .05,),
              RoundCustomButton(
                  buttonName: 'Log in',
                  buttonWork: (){
                    if(_emailController.text.isEmpty){
                      Utils.flashBarMessage(
                        message: 'Please Enter your email',
                        icon: Icon(Icons.info),
                        flushbarPosition: FlushbarPosition.TOP,
                        context: context
                      );
                    }else if(_passwordController.text.isEmpty){
                      Utils.flashBarMessage(
                          message: 'Please Enter your Password',
                          icon: Icon(Icons.info),
                          flushbarPosition: FlushbarPosition.TOP,
                          context: context
                      );

                    }else if(_passwordController.text.length < 6){
                      Utils.flashBarMessage(
                          message: 'Please input more than 6 character',
                          icon: Icon(Icons.info),
                          flushbarPosition: FlushbarPosition.TOP,
                          context: context
                      );
                    }else{
                      Utils.toastMessage('Loged in');
                    }
                  })
            ],
          ),
        ));
  }
}
