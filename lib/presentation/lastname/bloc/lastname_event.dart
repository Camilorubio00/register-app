abstract class LastnameEvent {
  const LastnameEvent();
}

class ChangeLastname extends LastnameEvent {
  final String lastname;

  const ChangeLastname(this.lastname);
}

class SaveLastname extends LastnameEvent {
  final String lastname;

  const SaveLastname(this.lastname);
}