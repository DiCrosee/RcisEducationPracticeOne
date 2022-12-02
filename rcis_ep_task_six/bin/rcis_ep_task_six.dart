import 'dart:io';
import 'dart:math';
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
  List<String> words = File('numsTask1.txt').readAsLinesSync();
  try {
    for (var word in words) {
      words = word.split(' ');
    }
  }
  catch(e) {
    print('$e\nНеверное оформление. Уберите все лишние символы.');
  }
  int wordlength = 0;
  List<String> necessaryWord = [];
  for (int i = 0; i < words.length; i++) {
    wordlength = words[i].length;
    if (wordlength % 2 != 0) {
      necessaryWord.add(words[i]);
    }
  }
  print('Ваш текстовый файл: $words');
  print('Все нечетные слова: $necessaryWord');
} 

void task2() {
  List<String> words = File('numsTask2.txt').readAsLinesSync();
  String wordadd = "";
  try {
    for (var word in words) {
      wordadd += word;
      wordadd += " ";
    }
  }
  catch(e) {
    print('$e\nНеверное оформление. Уберите все лишние символы.');
  }

  print(wordadd);
}

void task3() {
  stdout.write("Введите целое число: ");
  int num = 0;
  try {
    num = int.parse(stdin.readLineSync()!);
  }
  catch(e) {
    print('$e\nВы ввели не число, либо ввели несколько чисел');
    return;
  }

  if (num != 0) {
    if (num % 2 == 0 && num % 10 == 0 ){
      print ('Число $num четное и кратно 10');
    }
    else if (num % 2 == 0 && num % 10 != 0) {
      print('Число $num четное и не кратно 10');
    }
    else {
      print('Число $num нечетное и не кратно 10');
    }
  }
  else {
    print('Число $num четное и не кратно 10');
  }
}

void task4() {
  print('Введите положительное число, кроме "0" : ');
  int num = 0;
  try {
    num = int.parse(stdin.readLineSync()!);
  }
  catch(e) {
    print('$e\nОшибка ввода.');
    return;
  }
  if (num < 0) {
    while (num < 0) {
      try {
        print('Вы ввели отрицательное число. Пожалуйста, введите положительное: ');
        num = int.parse(stdin.readLineSync()!);
      }
      catch(e) {
        print('$e\nОшибка ввода.');
        return;
      }
    }
  }
  else if(num == 0) {
    print('Вы ввели "0". Перезаупстите программу');
    return;
  }
  
  List<int> digits = [];
  int nums = 0;
  while (nums > -1) {
    try {
      print('Введите число: ');
      nums = int.parse(stdin.readLineSync()!);
    }
    catch(e) {
      print('$e\nОшибка ввода.');
      return;
    }
    if (nums > -1) {
      digits.add(nums);
    }
    else {
      break;
    }
  }
  print('Введено отрицательное число');
  int sum = 0;
  for (int i = 0; i < digits.length; i++) {
    if (num % digits[i] == 0) {
      sum += digits[i];
    }
  }
  print(digits);
  print('Сумма чисел = $sum');
}

void task5() {
  int n = 0;
  int m = 0;
  print('                Введите размер матрицы\n');
  print('Введите высоту: ');
  try {
    n = int.parse(stdin.readLineSync()!);
    print('Введите длинну: ');
    m = int.parse(stdin.readLineSync()!);
  }
  catch(e) {
    print('$e\nОшибка ввода.');
    return;
  }
  List<List<int>> matrix = List.generate(n, (index) => List.generate(m + 1, ((index) => Random().nextInt(2))));

  int amount = 0;
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < m; j++) {
      if(matrix[i][j] == 1){
        amount++;
      }
    }
    if(amount % 2 != 0){
      matrix[i][m] = 1;
    }
    else {
      matrix[i][m] = 0;
    }
  }
  for(int i = 0; i < n; i++){
    for(int j = 0; j < m + 1; j++){
      stdout.write('${matrix[i][j]} ');
    }
    print(' ');
  }
}

void task6(){
  List<double> random = List.generate(Random().nextInt(9) + 1, (index) => (Random().nextDouble() * (30) + -10));
  List<double> positive = [];
  List<double> neggative = [];
  for(int i = 0; i < random.length; i++) {
    if(random[i] > 0) {
      positive.add(random[i]);
    }
    else {
      neggative.add(random[i]);
    }
  }
  print('Случайные числа - $random');
  print('Положительные элементы - $positive');
  print('Отрицательные элементы - $neggative');
}