abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {}

class WeakPasswordState extends SignUpState {}

class InvalidEmailState extends SignUpState {}

class PickImageSuccessState extends SignUpState {}

class PickImageErrorState extends SignUpState {}

class CheckImageSuccessState extends SignUpState {}

class CheckImageErrorState extends SignUpState {}
