// 科目枚举
enum Subject {
  english('英语'),
  chinese('语文');

  final String label;
  const Subject(this.label);
}

// 年级枚举
enum Grade {
  grade1Upper('高一上', 1, 1),
  grade1Lower('高一下', 1, 2),
  grade2Upper('高二上', 2, 1),
  grade2Lower('高二下', 2, 2),
  grade3Upper('高三上', 3, 1),
  grade3Lower('高三下', 3, 2);

  final String label;
  final int year;
  final int semester;
  const Grade(this.label, this.year, this.semester);
}

// 教材类型
enum TextbookType {
  required('必修'),
  elective('选择性必修');

  final String label;
  const TextbookType(this.label);
}
