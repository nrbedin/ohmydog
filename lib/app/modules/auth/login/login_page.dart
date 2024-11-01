import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohmydog/app/core/helpers/environments.dart';
import 'package:ohmydog/app/core/logger/app_logger.dart';
import 'package:ohmydog/app/core/ui/extensions/size_screen_extension.dart';
import 'package:ohmydog/app/core/ui/extensions/theme_extension.dart';
import 'package:ohmydog/app/core/ui/icons/oh_my_dog_icons.dart';
import 'package:ohmydog/app/core/ui/widgets/button_default.dart';
import 'package:ohmydog/app/core/ui/widgets/global_text_form_field.dart';
import 'package:ohmydog/app/core/ui/widgets/messages.dart';
import 'package:ohmydog/app/core/ui/widgets/rounded_button_with_icons.dart';
import 'package:ohmydog/app/models/social_login_type.dart';
import 'package:ohmydog/app/modules/auth/login/login_controller.dart';
import 'package:ohmydog/app/modules/register/register_page.dart';
import 'package:validatorless/validatorless.dart';
part 'widgets/login_form.dart';
part 'widgets/login_register_buttons.dart';
class LoginPage extends StatelessWidget {

   const LoginPage({ super.key });
   @override
   Widget build(BuildContext context) {
    var log = Modular.get<AppLogger>();
    log.append('Mensagem 1');
    log.append('Mensagem 2');
    log.append('Mensagem 3');
    log.closeAppend();
       return  Scaffold(
           body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
               child: Column(
              children: [
                Text(Environments.param('base_url') ?? ''),
                SizedBox(height: 50.h
                ,),
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
                const _LoginForm(),
                const SizedBox(
                  height: 8,
                ),
                const OrSeparator(),
                const SizedBox(
                  height: 8,
                ),
                LoginRegisterButtons(),
              ],
            ),
          ) ,
         
        ),
           
      );
  }
}



class OrSeparator extends StatelessWidget {

  const OrSeparator({ super.key });

   @override
   Widget build(BuildContext context) {
       return Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 2,
              color: context.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('OU',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: context.primaryColor,
            ),),
          ),
          Expanded(
            child: Divider(
              thickness: 2,
              color: context.primaryColor,
            ),
          )
        ],
       );
  }
}