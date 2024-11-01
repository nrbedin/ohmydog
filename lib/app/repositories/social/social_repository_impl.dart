import 'package:google_sign_in/google_sign_in.dart';
import 'package:ohmydog/app/core/exceptions/failure.dart';
import 'package:ohmydog/app/models/social_network_model.dart';
import 'package:ohmydog/app/repositories/social/social_repository.dart';

class SocialRepositoryImpl implements SocialRepository {
  @override
  Future<SocialNetworkModel> facebookLogin() {
    // TODO: implement facebookLogin
    throw UnimplementedError();
  }

  @override
  Future<SocialNetworkModel> googleLogin() async {
    final googleSign = GoogleSignIn();

    if (await googleSign.isSignedIn()) {
      await googleSign.disconnect();
    }

    final googleUser = await googleSign.signIn();
    final googleAuth = googleUser?.authentication;

    if (googleAuth != null && googleUser != null) {
      return SocialNetworkModel(
        id: '',
       // id: googleAuth.idToken ?? '',
        name: googleUser.displayName ?? '',
        email: googleUser.email,
        type: 'Google',
        accessToken: '',
        avatar: '',
       // accessToken: googleAuth.accessToken ?? '',
      );
    } else {
      throw Failure(message: 'Erro ao finalizar login com o Google');
    }
  }
}
