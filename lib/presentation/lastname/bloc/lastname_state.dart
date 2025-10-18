abstract class LastnameState {
  const LastnameState();
}

class LastnameInitial extends LastnameState {}

class LastnameLoading extends LastnameState {}

class LastnameValidated extends LastnameState {
  final bool isValid;

  const LastnameValidated(this.isValid);
}

class LastnameSaved extends LastnameState {
  final String lastname;

  const LastnameSaved(this.lastname);
}

class LastnameError extends LastnameState {
  final String message;

  const LastnameError(this.message);
}