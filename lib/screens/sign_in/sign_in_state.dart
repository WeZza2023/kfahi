abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {}

class InActiveState extends SignInState {}

class SignInErrorState extends SignInState {}

class AutoSignInLoadingState extends SignInState {}

class AutoSignInSuccessState extends SignInState {}

class AutoSignInFailedState extends SignInState {}
