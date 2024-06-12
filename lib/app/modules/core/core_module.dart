import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohmydog/app/modules/core/auth/auth_store.dart';

class CoreModule extends Module {

   @override
   List<Bind> get binds => [
    Bind.lazySingleton((i) => AuthStore(), export: true)
   ];



}