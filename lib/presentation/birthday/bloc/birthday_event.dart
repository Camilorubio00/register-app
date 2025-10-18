abstract class BirthdayEvent {
  const BirthdayEvent();
}

class ChangeBirthday extends BirthdayEvent {
  final DateTime birthday;

  const ChangeBirthday(this.birthday);
}

class SaveBirthday extends BirthdayEvent {
  final DateTime birthday;

  const SaveBirthday(this.birthday);
}
