String greet(String name, [String? title]) {    // (1) title은 '선택적', 기본값 ""
  return "Hello ${title?? ""}$name"; // (2) title 없으면 name만
}

void main() {
  print(greet("지원"));             // (3) "Hello 지원"
  print(greet("지원 ", "학생"));      // (4) "Hello 학생 지원"
}