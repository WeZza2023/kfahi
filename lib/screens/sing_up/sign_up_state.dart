abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {}

class WeakPasswordState extends SignUpState {}

class InvalidEmailState extends SignUpState {}
