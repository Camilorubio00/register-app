abstract class NameEvent {
  const NameEvent();
}

class ChangeName extends NameEvent {
  final String name;

  const ChangeName(this.name);
}

class SaveName extends NameEvent {
  final String name;

  const SaveName(this.name);
}