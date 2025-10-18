abstract class NameState {
  const NameState();
}

class NameInitial extends NameState {}

class NameLoading extends NameState {}

class NameValidated extends NameState {
  final bool isValid;

  const NameValidated(this.isValid);
}

class NameSaved extends NameState {
  final String name;

  const NameSaved(this.name);
}

class NameError extends NameState {
  final String message;

  const NameError(this.message);
}