import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohmydog/app/modules/register/register_controller.dart';
import 'package:ohmydog/app/modules/register/register_page.dart';

class RegisterModule extends Module {

   @override
   final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterController(
      userService: i(), 
      log: i(),
      ),
    ),
   ];

   @override
   final List<ModularRoute> routes = [
      ChildRoute(Modular.initialRoute, child: (_, __) => const RegisterPage()),
   ];

}