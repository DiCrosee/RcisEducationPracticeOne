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

  switch (menu) {
    case 1:
      print('Редактор задач:');
      print('1 - добавить задачу');
      print('2 - удалить задачу');
      print('3 - редактировать задачу');
      print('4 - Завершение работы');
      stdout.write('Введите номер: ');
      tasks = int.parse(stdin.readLineSync()!);
      break;
    case 2:
      print('Просмотр задач');
      break;
    case 3:  
      return;
    default:
  }
  switch (tasks) {
    case 1:
      print('Добавить задачу: ');
      break;
    case 2:
      print('Удалить задачу: ');
      break;
    case 3:
      print('Редактировать здачу: ');
      break;
    case 4:
      break;
    default:
  }
}
