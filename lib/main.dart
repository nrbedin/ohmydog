
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohmydog/app/app_module.dart';
import 'package:ohmydog/app/app_widget.dart';
import 'package:ohmydog/app/core/application_config.dart';


void main() async{
  await ApplicationConfig().configureApp();
  
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
