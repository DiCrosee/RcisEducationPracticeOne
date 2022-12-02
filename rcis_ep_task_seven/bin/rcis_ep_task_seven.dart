import 'dart:io';

void main() {
  print('\nЕжедневник\n');

  int menu = 0;
  int tasks = 0;

  print('1 - Редактор задач');
  print('2 - Просмотр задач');
  print('3 - Завершение работы');
  stdout.write('Введите номер: ');
  menu = int.parse(stdin.readLineSync()!);
  if(menu == 1) {
    print('Редактор задач:');
    print('1 - добавить задачу');
    print('2 - удалить задачу');
    print('3 - редактировать задачу');
    print('4 - Завершение работы');
    stdout.write('Введите номер: ');
    tasks = int.parse(stdin.readLineSync()!);
    if(tasks == 1) {
      print('Добавить задачу: ');
    }
    else if(tasks == 2) {
      print('Удалить задачу: ');
    }
    else if(tasks == 3) {
      print('Редактировать задачу: ');
    }
    else if(tasks == 4) {
      return;
    }
  }
  else if(menu == 2) {
    print('Просмотр задач: ');
  }
  else if(menu == 3) {
    return;
  }
}
