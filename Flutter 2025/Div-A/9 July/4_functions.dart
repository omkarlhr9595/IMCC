void main() {
  printMessage();
  printMessageWithName("Alice");
  printMessageWithNamedParameter(nameTobePrinted: 'Bob');
  printMessageWithFirstName();
  printMessageWithFirstName(name: "Charlie");
}

void printMessage() {
  print("Hello, World!");
}

void printMessageWithName(String name) {
  print("Hello, $name!");
}

void printMessageWithNamedParameter({required String nameTobePrinted}) {
  print("Hello, $nameTobePrinted!");
}

void printMessageWithFirstName({String name = "Default Name"}) {
  print("Hello, $name!");
}
