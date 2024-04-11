import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class IGoogleSignInDataService {
  FutureOr<OAuthCredential> signIn();

  FutureOr<void> signOut();
}
