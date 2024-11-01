import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohmydog/app/modules/auth/home/auth_home_page.dart';
import 'package:ohmydog/app/modules/auth/login/login_module.dart';
import 'package:ohmydog/app/modules/register/register_module.dart';
import 'package:ohmydog/app/modules/register/register_page.dart';
import 'package:ohmydog/app/repositories/social/social_repository.dart';
import 'package:ohmydog/app/repositories/social/social_repository_impl.dart';
import 'package:ohmydog/app/repositories/user/user_repository.dart';
import 'package:ohmydog/app/repositories/user/user_repository_impl.dart';
import 'package:ohmydog/app/services/user/user_service.dart';
import 'package:ohmydog/app/services/user/user_service_impl.dart';

class AuthModule extends Module {

   @override
   final List<Bind>  binds = [
        Bind.lazySingleton<SocialRepository>((i) => SocialRepositoryImpl()),
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(
      log: i(),
      restClient: i(),
    )),
    Bind.lazySingleton<UserService>((i) => UserServiceImpl(
      log: i(),
      userRepository: i(),
      localStorage: i(),
      localSecureStorage: i(),
      socialRepository: i(),

    )),
   ];

   @override
   final List<ModularRoute> routes = [
      ChildRoute(Modular.initialRoute, child: (_, __) =>
       AuthHomePage(authStore: Modular.get(),
        ),
       ),
       ModuleRoute('/login', module: LoginModule()),
       ModuleRoute('/register', module: RegisterModule()),
   ];

}