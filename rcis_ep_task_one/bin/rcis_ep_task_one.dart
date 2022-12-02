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

void task1() {

  List<int> mas = List.generate(10, (i) => Random().nextInt(100) + 0);

  int index = 0;
  for (int i = 0; i < mas.length; i++) {
    if(mas[i] < mas[index]) {
      index = i;
    }
  }
  print("В массиве $mas\nМинимальный элемент: ${mas[index]}");
}

void task2() {
  try {
    List<int> mas = [];
    int nulls = 1;
    while (nulls != 0) {
    print('Добавьте число в массив или завершите программу цифрой "0"');
    nulls = int.parse(stdin.readLineSync()!);
    mas.add(nulls);
    }
    mas.remove(mas.last);

    int sum = 0;
    int mult = 1;
    double average = 0;
    for (int i = 0; i < mas.length; i++) {
      sum = sum + mas[i];
      mult = mult * mas[i];
    }
    average = sum / (mas.length);
    print("Ваш массив: $mas\nСумма всех чисел: $sum\nПроизведение всех чисел: $mult\nСреднее арифметическое всех чисел: $average");
  }
  catch(e) {
    print('Возникла ошибка. Завершение работы программы.');
  }
}

void task3() {
  try {
    List<String> mas = [];

    String words = 'word';
    while(words != '') {
      print('Введите строку. Для завершения нажмите "enter"');
      words = stdin.readLineSync()!;
      mas.add(words);
    }
    mas.removeLast();

    int short = 0;
    int long = 0;
    for (int i = 0; i < mas.length; i++) {
      if (mas[i].length < mas[short].length) {
        short = i;
      }
      if (mas[i].length > mas[long].length) {
        long = i;
      }
    }
    print('\nВаш массив: $mas\n');
    print('Самый короткий элемент списка: ${mas[short]}\nСамый длинный элемент списка: ${mas[long]}');
  } 
  catch(e) {
    print('Возникла ошибка. Завершение работы программы.');
  }
}
void task4() {
  try {
    const int N = 10;

    print('Введите первый диапазон: ');
    int first = int.parse(stdin.readLineSync()!);
    print('Введите второй диапазон: ');
    int second = int.parse(stdin.readLineSync()!);
    
    List<int> mas = funRandom(first, second, N);

    print('Ваши рандомные числа от $first до $second: ');
    for (int i = 0; i < N; i++) {
      print(mas[i]);
    }
  }
  catch (e) {
    print('Возникла ошибка. Завершение работы программы.');
  }
}
List<int> funRandom(int first, int second, int N) {
  List<int> mas = [];
  int range = 0;
  for (int i = 0; i < N; i++) {
    range = (Random().nextInt(second - first + 1) + first);
    mas.add(range);
  }
  return mas;
}

void task5() {
  try {
    print('Введите предложение: ');
    String word = stdin.readLineSync()!; 

    List<String> words = word.split(' ');
    
    if(word == '') {
      words.remove('');
    }

    words.add('End');
    words.insert(0, 'Start');

    print('Колличество слов : ${words.length - 2}');
  }
  catch (e) {
    print('Возникла ошибка. Завершение работы программы.');
  }
}