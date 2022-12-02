import 'dart:io';

void main() {
  try {
    print("Введите номер задания (1-5): ");
    int numTask = int.parse(stdin.readLineSync()!);

    switch (numTask) {
      case 1:
        task1();
      break;
      case 2:
        task2();
      break;
      case 3:
        task3();
      break;
      case 4:
        task4();
      break;
      case 5:
        task5();
      break;
      default:
        print("Этого номера задания нет в списке.");
    }
  }
  catch(e) {
    print('$e\nОшибка. Перезапустите программу и напишите номер задания (1-5) ');
  }
}

void task1() {
  var file = File('numsTask1.txt');
  String nums = file.readAsStringSync();

  List<String> digitsString = nums.split(' ');
  List<int> digits = [];
  
  try{
    for (int i = 0; i < digitsString.length; i++) {
      digits.add(int.parse(digitsString[i]));
    }
  }
  catch(e) {
    print('$e\nФайл испорчен или некорректный ввод. P.S. Вводите числа через пробел.');
    return;
  }

  int min = digits[0];
  int index = 0;
  for (int i = 0; i < digits.length; i++) {
    if (digits[i] < min) {
      min = digits[i];
      index = i;
    }
  }
  int mult = 1;
  for (int i = index + 1; i < digits.length; i++) {
    mult *= digits[i];
  }
  print("Текстовый файл: $digits");
  print("Минимальное число = $min");
  print("Произведение после минимального = $mult");
}

void task2()  {
  print('Запуск программы...');
  var file = File('numsTask2.txt');
  String nums = file.readAsStringSync();

  List<String> digitsString = nums.split(';');
  List<double> digits = [];
  
  try{
    for (int i = 0; i < digitsString.length; i++) {
      digits.add(double.parse(digitsString[i]));
    }
  }
  catch(e) {
    print('$e\nФайл испорчен или некорректный ввод.');
    return;
  }
  print('Сортируем...');
  double temp = 0;
  for (int i = 0; i < digits.length - 1; i++) {
    for (int j = 0; j < digits.length - i - 1; j++) {
      if (digits[j] > digits[j + 1]) {
        temp = digits[j];
        digits[j] = digits[j + 1];
        digits[j + 1] = temp;
      }
    }
  }

  var sink = file.openWrite();
  for (int i = 0; i < digits.length; i++) {
    sink.write(digits[i]);
    sink.write(';');
  }
  sink.close();
  print("Завершение программы...");
  sleep(Duration(seconds: 1));
}

void task3()  {
  var file = File('numsTask3.txt');
  String nums = file.readAsStringSync();

  List<String> digitsString = nums.split(' ');
  List<int> digits = [];
  
  try{
    for (int i = 0; i < digitsString.length; i++) {
      digits.add(int.parse(digitsString[i]));
    }
  }
  catch(e) {
    print('$e\nФайл испорчен или некорректный ввод. P.S. Вводите числа через пробел.');
    return;
  }

  int min = digits[0];
  int index = 0;
  double res = 0;
  for (int i = 0; i < digits.length; i++) {
    if (digits[i] < min) {
      min = digits[i];
      index = i;
    }
  }

  for (int i = 0; i < index; i++) {
    res += digits[i];
  }
  res /= index;
  print('Минимальный элемент: $min');
  print('Среднее арифметическое $res');
}

void task4()  {
  var file = File('numsTask4.txt');
  String nums = file.readAsStringSync();

  List<String> digitsString = nums.split(' ');
  List<int> digits = [];
  
  try{
    for (int i = 0; i < digitsString.length; i++) {
      digits.add(int.parse(digitsString[i]));
    }
  }
  catch(e) {
    print('$e\nФайл испорчен или некорректный ввод. P.S. Вводите числа через пробел.');
    return;
  }

  int max = digits[0];
  for (int i = 1; i < digits.length; i++) {
    if (digits[i] > max) {
      max = digits[i];
    }
  }

  int res = 0;
  for (int i = 0; i < digits.length; i++) {
    if (digits[i] == (max - 1)) {
      res += digits[i];
    }
  }
  print('Сумма элементов: $res');
}

void task5() {
  var file = File('numsTask5.txt');
  String nums = file.readAsStringSync();

  List<String> digitsString = nums.split(' ');
  List<int> digits = [];
  
  try{
    for (int i = 0; i < digitsString.length; i++) {
      digits.add(int.parse(digitsString[i]));
    }
  }
  catch(e) {
    print('$e\nФайл испорчен или некорректный ввод. P.S. Вводите числа через пробел.');
    return;
  }

  int max = digits[0];
  int min = digits[0];
  int indexMax = 0;
  int indexMin = 0;
  for (int i = 1; i < digits.length; i++) {
    if (digits[i] > max) {
      max = digits[i];
      indexMax = i;
    }
    if (digits[i] < min) {
      min = digits[i];
      indexMin = digits[i];
    }
  }

  int res = 0;
  int countNum = 0;
  if (indexMin < indexMax) {
    for (int i = indexMin; i < indexMax; i++) {
      res += digits[i];
      countNum++;
    }
  } 
  else {
    for (int i = indexMax; i < indexMin; i++) {
      res += digits[i];
      countNum++;
    }
  }
  print("Ваш текстовый докумет: $digits");
  print('Среднее арифметическое чисел между ${digits[indexMin + 2]} и ${digits[indexMax]} = ${res / countNum}');
}