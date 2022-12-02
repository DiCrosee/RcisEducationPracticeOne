import 'dart:io';
import 'dart:math';

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
    print('Ошибка. Перезапустите программу и напишите номер задания (1-5) ');
  }
}

void task1(){
  List<int> mas = List.filled(100, 0);

  int a = 100;
  for (int i = 0; i < mas.length; i++) {
    mas[i] = a - 3;
    a -= 3;
  }
  print("Массив: $mas");
}


void task2(){
  try {
    List<int> mas = [];
    print("Сколько чисел вы хотите? ");
    int nums = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < nums; i++) {
      mas.add(1 + 2 * i);
    }
    print("Массив с нечетными числами: $mas");
  }
  catch(e) {
    print("Произошел сбой. Завершение программы...  ");
  }
}


void task3(){
  try {
    print('Введите длинну матрицы: ');
    int n = int.parse(stdin.readLineSync()!);

    List<List<int>> matrix = List.generate(n, (_) => List.filled(n, 1));

    print('матрица $n x $n: ');
    for (int i = 1; i < matrix.length; i++) {
      for (int j = 1; j < matrix.length; j++) {
        matrix[i][j] = matrix[i-1][j] + matrix[i][j-1];
      }
    }
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix.length; j++) {
        stdout.write('${matrix[i][j]}\t'); 
      }
      print("\n");
    }
  }
  catch(e) {
    print("Произошел сбой. Завершение программы...  ");
  }
}


void task4() {
  try {
    List<List<double>> temperature = List.generate(12, (_) => List.generate(30, (_) => Random().nextInt(60)-30));

    print(temperature);
    print('Средняя температура: ${averageTemperature(temperature)}' );
    print('Отсортирован: ${averageTemperature(temperature)..sort()}' );
    }
  catch(e){
    print("Произошел сбой. Завершение программы...  ");
  }
}

List averageTemperature(List<List<double>> temperature) {

  List<double> mas = List.filled(12, 0);

    for (int i = 1; i < 12; i++) {
      for (int j = 1; j < 30; j++) {
        mas[i] += temperature[i][j];
      }
      mas[i] = mas[i] / 30;
    }
  return mas;
}

void task5() {
  try {
    var months = {
      "Январь" : List.generate(30, (_) => Random().nextInt(60)-30),
      "Февраль" : List.generate(30, (_) => Random().nextInt(60)-30),
      "Март" : List.generate(30, (_) => Random().nextInt(60)-30),
      "Апрель" : List.generate(30, (_) => Random().nextInt(60)-30),
      "Май" : List.generate(30, (_) => Random().nextInt(60)-30),
      "Июнь" : List.generate(30, (_) => Random().nextInt(60)-30),
      "Июль" : List.generate(30, (_) => Random().nextInt(60)-30),
      "Август" : List.generate(30, (_) => Random().nextInt(60)-30),
      "Сентябрь" : List.generate(30, (_) => Random().nextInt(60)-30),
      "Октябрь" : List.generate(30, (_) => Random().nextInt(60)-30),
      "Ноябрь" : List.generate(30, (_) => Random().nextInt(60)-30),
      "Декабрь" : List.generate(30, (_) => Random().nextInt(60)-30),
    };

    for(var key in months.keys) {
      print("$key ${months[key]}");
    }
    print(averageTemperatures(months));
  }
  catch(e) {
    print("Произошел сбой. Завершение программы...  ");
  }
}

Map averageTemperatures(months) {

  var averageMap = {};
  num averageKey = 0;

  for (var key in months.keys) {
    for (int i = 0; i < 30; i++) {
      averageKey =  averageKey + months[key][i];
    }
    averageKey /= 30;
    averageMap.addAll({key : averageKey});
  }
  return averageMap;
}