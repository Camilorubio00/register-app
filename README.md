# 📱 Register users app

This app allows you to add users locally to the device. Users must have a first name, last name, date of birth, and can have multiple addresses.
This app has no API connection; the entire data collection and storage process is done locally.

---
## 🌟 Characteristics

* **Clean Architecture:** Separate structure into Data, Domain, and Presentation.
* **State Management:** Implementation with the `flutter_bloc` library to centrally manage the `UserRegistrationBloc`.
* **Dependency Injection:** Use of `get_it` for `singletons` of BLoCs and services (`locator()` / `GetIt.I`).
* **Local Persistence:** Fast storage of entities (`UserEntity`) with the `hive` library.
* **Secure Navigation:** Handling a sequential and nested form flow with `go_router`.
---

## 🖼️ Screenshots

<img src="https://github.com/user-attachments/assets/d13e7e8f-5b93-4569-a2d3-d9246f86214d" width="250"/> <img src="screenshots/login.png" width="250"/>
<img src="https://github.com/user-attachments/assets/32e1195d-8b5a-4df6-b7fe-0166ff1326a9" width="250"/> <img src="screenshots/login.png" width="250"/>
<img src="https://github.com/user-attachments/assets/b58f0c6c-7b27-488d-a0c1-c81e5cf98718" width="250"/> <img src="screenshots/login.png" width="250"/>

---

## 🛠️ Tecnologías usadas

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- BLoC
- Hive
- Go_Router

---

## ⚙️ Installation and Runtime

Follow these steps to run the project locally:

```bash
# 1. Clone the repository
git clone https://github.com/tuusuario/tu-proyecto-flutter.git

# 2. Instalall dependencies
flutter pub get

# 3. Run app
flutter run
