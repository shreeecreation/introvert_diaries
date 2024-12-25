final class FormValidator {
  const FormValidator._();
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';

    // Allow only letters, numbers, dots, and @ symbols in the email format
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? validateOtherFields(String? value, String returnValue) {
    if (value == null || value.trim().isEmpty) return returnValue;
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password cannot be empty';

    if (value.length < 8) return 'Password must be at least 8 characters long.';

    if (!RegExp('[A-Z]').hasMatch(value)) {
      return 'Password must contain at least 1 uppercase letter.';
    }

    if (!RegExp(r'\d').hasMatch(value)) return 'Password must contain at least 1 number.';

    return null;
  }

  static bool isValidPassword(String password) {
    // Define the regex pattern for validation
    final passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');

    // Check if the password matches the regex pattern
    return passwordRegex.hasMatch(password);
  }

  static String? validatePhoneNumber(String value) {
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) return 'Enter a valid phone number';

    return null;
  }
}
