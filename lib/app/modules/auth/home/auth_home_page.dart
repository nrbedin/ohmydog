import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ohmydog/app/core/ui/extensions/size_screen_extension.dart';
import 'package:ohmydog/app/models/user_model.dart';
import 'package:ohmydog/app/modules/core/auth/auth_store.dart';



class AuthHomePage extends StatefulWidget {
final AuthStore _authStore;

  const AuthHomePage({ super.key, required AuthStore authStore })
  :_authStore = authStore;

  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {

  @override
  void initState() {
   reaction<UserModel?>((_) => widget._authStore.userLogged, (userLogged) {

    if(userLogged != null && userLogged.email.isNotEmpty){
      Modular.to.navigate('/home');

    } else {
      Modular.to.navigate('/auth/login/');
    }
    });
    super.initState();

    WidgetsBinding.instance.addPersistentFrameCallback((_) { 
      widget._authStore.loadUserLogged();
    });
  }
   @override
   Widget build(BuildContext context) {
       return Scaffold(
          
           body: Center(child: Image.asset('assets/images/logo.png',
            width: 150.w,
            height: 200.h,
            fit: BoxFit.contain,
             ),
            ),
       );
  }
}