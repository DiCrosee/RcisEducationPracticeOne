import 'dart:io';
import 'dart:convert';
import 'dart:async';

void main() {
  try {
    print("Введите номер задания (1-6): ");
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
      case 6:
        task6();
      break;
      default:
        print("Этого номера задания нет в списке.");
    }
  }
  catch(e) {
    print('Ошибка. Перезапустите программу и напишите номер задания (1-6) ');
  }
}

void task1() {
  int n = 0;
  try {
    print('Введите число "n" ');
    n = int.parse(stdin.readLineSync()!);
  }
  catch(e) {
    print('$e/nОшибка при вводе.');
  }
  int mult = 1;

  for(int i = 3; i <= n; i += 3) {
    mult *= i;
  }

  print("Произведение чисел, кратным трем и не превышающем число $n = $mult");
}

void task2() async {
  final file = File('numsTask2.txt'); 
  String numbers = ""; 
  List<double> digits = []; 
  String num = ""; 
  double sum = 0;  
  Stream<String> lines = file.openRead().transform(utf8.decoder).transform(LineSplitter());  

  print("Чтение текстового файла...");
  sleep(Duration(seconds:1));
  try { 
    await for (var line in lines) { 
      numbers += line; 
    }
  
    for (int i = 0; i < numbers.length; i++) { 
      if (numbers[i] != ";") { 
        num += numbers[i]; 
      }
      else if (numbers[i] == ";") { 
        try {
          digits.add(double.parse(num)); 
        } 
        catch(e) {
          print("$e\nНеверное оформление. Уберите все лишние символы. ");
        }
        num = ""; 
      }
    }
  } 
  catch (e) { 
    print("$e\nФайл поврежден или отсутствует"); 
  }

  for (int i = 0; i < digits.length; i++) { 
    if (digits[i] > 0) { 
      sum += digits[i]; 
    } 
    else if (digits[i] == 0) { 
      break; 
    } 
  }
  print("Секунду...");
  sleep(Duration(seconds:1));
  print("Выполняем подсчеты...");
  sleep(Duration(seconds:1));
  print("Сумма положительных элементов = $sum"); 
}

void task3() async {
  String numbers = "";
  List<int> digits = [];
  String num = "";

  final file = File('numsTask3.txt');
  Stream<String> lines = file.openRead().transform(utf8.decoder).transform(LineSplitter());
  print('Читаем текстовый документ...');
  sleep(Duration(seconds: 1));
  try {
    await for (var line in lines) {
      numbers += line;
    }

    for (int i = 0; i < numbers.length; i++) {
      if(numbers[i] != ",") {
        num += numbers[i];
      }
      else if(numbers[i] == ",") {
        try {
          digits.add(int.parse(num));
        }
        catch(e) {
          print("$e\nНеверное оформление. Уберите все лишние символы.");
        }
        num = "";
      }
    }
  }
  catch (e) {
    print("Файл поврежден, либо отсутствует.");
    return;
  }

  print("Ваши числа: $digits");
  int max = digits[0];
  int min = digits[0];
  try {
    for (int i = 0; i < digits.length; i++) {
      if (digits[i] > 0) {
        if (digits[i] > max) {
          max = digits[i];
        }
        if (digits[i] < min) {
          min = digits[i];
        }
      }
      else if (digits[i] == 0) {
        break;
      }
    }
  }
  catch(e) {
    print(e);
    return;
  } 
  
  print("Производим вычисления...");
  sleep(Duration(seconds: 1));
  print('Отношение минимального числа к максимальному = ${min / max}');
  print('Отношение макисмального числа к минимальному = ${max / min}');
}


void task4() async {
  Stream<String> lines = Stream.value("");
  File input = File("");
  String numbers = "";
  List<int> digits = [];
  int count = 0;

  print("Запуск программы...");

  input = File('numsTask4.txt');
  lines = input.openRead().transform(utf8.decoder).transform(LineSplitter());

  try {
    await for (var line in lines) {
      line += " ";
      for (int i = 0; i < line.length; i++) {
        if (line[i] != " ") {
          numbers += line[i];
        }
        else if (line[i] == " ") {
          try {
            digits.add(int.parse(numbers));
          }
          catch (e) {
            print("$e\nНеверное оформление. Уберите все лишние символы. ");
          }
          numbers = "";
        }
      }
    }
  }
  catch(e) {
    print("Файл поврежден или отсутствует");
  }
  
  for (var i = 0; i < digits.length - 1; i++) {
    if (digits[i] == digits[i + 1]) {
      count++;
    }
  }
  print("Количество одинаковых рядом стоящих чисел = $count");
}


void task5() {
  double x = 0;
  double y = 0;
  try {
    stdout.write('Введите вещественное число x: ');
    x = double.parse(stdin.readLineSync()!);
    stdout.write('Введите вещественное число y: ');
    y = double.parse(stdin.readLineSync()!);
  }
  catch(e) {
    print('$e\nНеправильный ввод');
    return;
  }

  if (x >= -1 && x <= 3 && y <= 4 && y >= -2) {
    print('Ты попал в заштрихованную область!');
  }
  else {
    print('Ты не попал в заштрихованную область!');
  }
}


void task6() {
  double x = 0;
  double y = 0;
  int x1 = -2;
  int y1 = -3;
  int y2 = 2;
  int x2 = 0;
  int y3 = -3;
  int x3 = 2;
  try {
    stdout.write('Введите вещественное число x: ');
    x = double.parse(stdin.readLineSync()!);
    stdout.write('Введите вещественное число y: ');
    y = double.parse(stdin.readLineSync()!);
  }
  catch(e) {
    print('$e\nНеправильный ввод');
    return;
  }

  double a = (x-x1)*(y1-y2)-(y-y1)*(x1-x2);
  double b = (x-x2)*(y2-y3)-(y-y2)*(x2-x3);
  double c = (x-x3)*(y3-y1)-(y-y3)*(x3-x1);
  if ((a >= 0 && b >= 0 && c >= 0) || (a <= 0 && b <= 0 && c <= 0)) {
    print('Ты попал в заштрихованную область!');
  }
  else {
    print('Ты не попал в заштрихованную область!');
  }
}