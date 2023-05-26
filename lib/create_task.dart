import 'dart:io';

void main(List<String> args) {
  File f2 = File('lib/homework.txt');
  String text = f2.readAsStringSync();
  List<String> lines = text.split('\n');
  for (int i = 0; i < lines.length; i++) {
    print(i);
    if (lines[i].contains(RegExp('^Task [0-9]+:'))) {
      print(lines[i]);
      String fname = "bin/${args[0]}${lines[i].split(' ')[1].split(':')[0].padLeft(2, '0')}.dart";
      File f = File(fname);
      f.createSync();
      f.writeAsStringSync("//${lines[i]}\n//${lines[i + 1]}\nvoid main() {}");
    }
  }
}
