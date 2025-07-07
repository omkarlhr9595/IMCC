void main() {
  // Calling a function
  printMessage();

  // Calling a function with a parameter
  printMessageWithParameter("Hello, this is a function with a parameter!");
  // Calling a function with a named parameter
  printMessageWithParameterName(message: "Named parameters are useful!");
}

void printMessage() {
  print("Hello, this is a function!");
}

void printMessageWithParameter(String message) {
  print(message);
}

void printMessageWithParameterName({required String message}) {
  print(message);
}