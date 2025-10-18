abstract class BirthdayState {
  const BirthdayState();
}

class BirthdayInitial extends BirthdayState {}

class BirthdayLoading extends BirthdayState {}

class BirthdayChanged extends BirthdayState {}

class BirthdaySaved extends BirthdayState {}

class BirthdayError extends BirthdayState {
  final String message;

  const BirthdayError(this.message);
}
