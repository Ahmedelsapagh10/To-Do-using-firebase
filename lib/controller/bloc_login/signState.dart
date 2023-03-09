abstract class SignState {}

class InitStateSign extends SignState {}

class LoadingSignUpState extends SignState {}

class SignUpState extends SignState {}

class SignErrorState extends SignState {
  final String errorMessage;
  SignErrorState(this.errorMessage);
}

class LoadingSignInState extends SignState {}

class SignInState extends SignState {}

class SignOutState extends SignState {}
