part of '../login_page.dart';

class LoginRegisterButtons extends StatelessWidget {
  final controller = Modular.get<LoginController>();

   LoginRegisterButtons({ super.key });

   @override
   Widget build(BuildContext context) {
       return Wrap(
        spacing: 10,
        runSpacing: 10,
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        children: [
          RoundedButtonWithIcons(
            onTap: (){}, 
            width: 42.sw, 
            color: Color(0xFF4267B3), 
            icon: OhMyDogIcons.facebook, 
            label: 'Facebook',
          ),
          RoundedButtonWithIcons(
            onTap: (){
              controller.socialLogin(SocialLoginType.google);
            }, 
            width: 42.sw, 
            color: Color(0xFFE15031), 
            icon: OhMyDogIcons.google, 
            label: 'Google',
          ),
          RoundedButtonWithIcons(
            onTap: (){
              Navigator.pushNamed(context, '/auth/register/');
            }, 
            width: 42.sw, 
            color: context.primaryColorDark, 
            icon: Icons.mail, 
            label: 'Cadastre-se',
          ),                    
        ],
       );
  }
}