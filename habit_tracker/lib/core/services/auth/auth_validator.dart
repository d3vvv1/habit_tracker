class AuthValidator {
  static const minPasswordLength = 8;
  // static const emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  static bool validateEmail(String email) {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');

    if (!emailRegex.hasMatch(email)) {
      throw Exception('Неверный формат электронной почты.');
    }

    return true;
  }

  static bool validatePassword(String password) {
    const minLength = 8;

    // Проверяем длину пароля
    if (password.length < minLength) {
      throw Exception('Пароль должен быть не менее $minLength символов.');
    }

    // Регулярные выражения для проверки наличия прописных букв, строчных букв и цифр
    final uppercaseRegex = RegExp(r'[A-Z]');
    final lowercaseRegex = RegExp(r'[a-z]');
    final digitRegex = RegExp(r'\d+');

    // Проверяем наличие необходимых символов
    if (!(uppercaseRegex.hasMatch(password))) {
      throw Exception('Пароль должен содержать хотя бы одну заглавную букву.');
    }

    if (!(lowercaseRegex.hasMatch(password))) {
      throw Exception('Пароль должен содержать хотя бы одну строчную букву.');
    }

    if (!(digitRegex.hasMatch(password))) {
      throw Exception('Пароль должен содержать хотя бы одну цифру.');
    }

    return true;
  }
}
