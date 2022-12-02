import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:math';


//  задание первое
// void main() async {                   

//   print("Запуск программы..\n");
//   int countLines = 0;
//   List<int> winNum = [];
//   String nums = "";
//   int n = 0;
//   int winTicket = 0;
//   String answer = "";
//   Map<int,List<int>> tickets = {};
//   List<int> ticket = [];
//   Stream<String> lines = Stream.value("");
//   File input;

//   input = File('input.txt');
//   lines = input.openRead().transform(utf8.decoder).transform(LineSplitter());

//   try {
//     await for (var line in lines) {
//       if(countLines == 0){
//         line += " ";
//         for (int i = 0; i < line.length; i++) {
//           if (line[i] != " "){
//             nums += line[i];
//           }
//           else if (line[i] == " ") {
//             try {
//               winNum.add(int.parse(nums));
//             }
//             catch (e) {
//               print("$e\nНеверное оформление. Уберите все лишние символы в первой строке. ");
//             }
//             nums = "";
//           }

//         }
//         countLines++;
//         continue;
//       }

//       if(countLines == 1){
//         try {
//         n = int.parse(line);
//         }
//         catch(e) {
//           print("$e\nНеверное оформление. Уберите все лишние символы во второй строке. ");
//         }
//         countLines++;
//         continue;
//       }
        
//       if(countLines >= 2) {
//         line += " ";
//         for (int i = 0; i < line.length; i++) {
//           if (line[i] != " "){
//             nums += line[i];
//           }
//           else if (line[i] == " ") {
//             try {
//               ticket.add(int.parse(nums));
//             }
//             catch(e){
//               print("$e\nНеверное оформление. Уберите все лишние символы в ${countLines + 1} строке. ");
//             }
//             nums = "";
//           }
//         }
//         tickets.addAll({countLines - 2 : ticket});
//         ticket = [];
//         countLines++;
//         continue;
//       }
//     }
//   }
//   catch(e) {
//     print("Файл поврежден или отсуствует.");
//   }
//   n = countLines - 2;
//   if(n != countLines - 2){
//     print("Приравниваю введенное колличество билетов");
//   }

//   for (int k = 0; k < n; k++) {
//     for (int i = 0; i < winNum.length; i++) {
//       try {
//         for (int j = 0; j < tickets[k]!.length; j++) {
//           if (winNum[i] == tickets[k]![j]) {
//            winTicket++;
//           }
//         }
//       }
//       catch(e) {
//         print("Введите корректное колличество билетов");
//       }
//     }

//     if (winTicket >= 3 ){
//       answer += "Lucky\n";
//     }
//     else {
//       answer += "UnLucky\n";
//     }
//     winTicket = 0;
//   }

//   var output = await File("output.txt").writeAsString(answer);
//   print("\nЗавершение программы...");
// }






// Задание 2

// void main() async {
//   Stream<String> lines = Stream.value("");
//   File input = File("");
//   String numbers = "";
//   List<int> digits = [];
//   String necessary = "";
//   String unnecessary = "";

//   print("Запуск программы...");

//   input = File('nums.txt');
//   lines = input.openRead().transform(utf8.decoder).transform(LineSplitter());

//   try {
//     await for (var line in lines) {
//       line += " ";
//       for (int i = 0; i < line.length; i++) {
//         if (line[i] != " ") {
//           numbers += line[i];
//         }
//         else if (line[i] == " ") {
//           try {
//             digits.add(int.parse(numbers));
//           }
//           catch (e) {
//             print("$e\nНеверное оформление. Уберите все лишние символы. ");
//           }
//           numbers = "";
//         }
//       }
//     }
//   }
//   catch(e){
//     print("Файл поврежден или отсутствует");
//   }

//   try {
//     for (int i = 0; i < digits.length; i++) {
//       if (digits[i] % 2 == 0){
//         unnecessary += "${digits[i]}";
//       }
//       else {
//         necessary += "${digits[i]}";
//         necessary += " ";
//       }
//     }
//   }
//   catch(e) {
//     print("Непредвиденная ошибка. Завершение программы...");
//   }
//   var output = await File("nums.txt").writeAsString(necessary);
//   print("\nЗавершение программы...");
// }






// Задание 3

void main() async {

  Stream<String> lines = Stream.value("");
  File input;
  String numbers = "";
  List<int> digits = [];
  input = File('height.txt');
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
  catch(e){
    print("Файл поврежден или отсутствует");
  }

  int left = 0;
  int right = digits.length - 1;
  int maxHeight = 0;
  int height = 0;
  int range = 0;
  while (left != right) {
    range = (left - right).abs();
    if (digits[left] < digits[right]) {
      height = digits[left] * range;
      left++;
    } 
    else {
      height = digits[right] * range;
      right--;
    }
    if (height > maxHeight) {
      maxHeight = height;
    }
  }
print("Максимальный объем воды: $maxHeight");
}