import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohmydog/app/core/ui/extensions/size_screen_extension.dart';
import 'package:ohmydog/app/core/ui/extensions/theme_extension.dart';
import 'package:ohmydog/app/core/ui/widgets/button_default.dart';
import 'package:ohmydog/app/core/ui/widgets/global_text_form_field.dart';
import 'package:ohmydog/app/modules/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';
part 'widgets/register_form.dart';
class RegisterPage extends StatelessWidget {

  const RegisterPage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
            title: const Text(
              'Cadastrar Usuário'
            ),
            elevation: 0,
          ),
           body:  SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 162.w,
                      fit: BoxFit.fill,
            
                    ),
                    
                  ),
                  const SizedBox(
                     height: 20,
                  ),
                  const RegisterForm(),
                ],
              ),
            )),
       );
  }
}