import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohmydog/app/modules/auth/login/login_controller.dart';
import 'package:ohmydog/app/modules/auth/login/login_page.dart';

class LoginModule extends Module {

   @override
   List<Bind> get binds => [

    Bind.lazySingleton((i) => LoginController(
      userService: i(), //AuthModulee
      log: i(), //CoreModule
      ),
    ),
   ];

   @override
   List<ModularRoute> get routes => [
      ChildRoute('/', child: (context, args) =>   LoginPage())
   ];

}