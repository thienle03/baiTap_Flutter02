import 'dart:io';

//lớp người
class Person {
  String id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}

//lớp học sinh kế thừa từ lớp người
class Student extends Person {
  String grade;
  double score;

  Student(
    String id,
    String name,
    int age,
    String gender,
    this.grade,
    this.score,
  ) : super(id, name, age, gender);

  //thông tin học sinh
  void displayInfo() {
    print(
      'ID: $id, Name: $name, Age: $age, Gender: $gender, Grade: $grade, Score: $score',
    );
  }
}

//lớp giáo viên kế thừa từ lớp người
class Teacher extends Person {
  String subject;
  double salary;

  Teacher(
    String id,
    String name,
    int age,
    String gender,
    this.subject,
    this.salary,
  ) : super(id, name, age, gender);

  //Thông tin giáo viên
  void displayInfo() {
    print(
      'ID: $id, Name: $name, Age: $age, Gender: $gender, Subject: $subject, Salary: $salary',
    );
  }
}

//lớp thông tin lớp học
class Classroom {
  String id;
  String name;
  List<Student> students = [];
  Teacher? teacher;

  Classroom(this.id, this.name);

  //thêm học sinh
  void addStudent(Student student) {
    students.add(student);
  }

  //gán giáo viên cho lớp học
  void assignTeacher(Teacher t) {
    teacher = t;
  }

  //in thông tin lớp học
  void displayClassInfo() {
    print('=== Classroom: $name ===');
    print('Teacher: ${teacher != null ? teacher!.name : 'None'}');
    print('Students:');
    for (var s in students) {
      print('  - ${s.name} (${s.id}) - Score: ${s.score}');
    }
  }
}

//hàm kiểm tra không được để trống
String readNonEmptyString(String prompt) {
  while (true) {
    print(prompt);
    String? input = stdin.readLineSync();
    if (input != null && input.trim().isNotEmpty) return input.trim();
    print('Giá trị không được để trống. Vui lòng nhập lại!!!');
  }
}

//hàm kiểm tra số nguyên
int readInt(String prompt) {
  while (true) {
    print(prompt);
    String? input = stdin.readLineSync();
    try {
      return int.parse(input!);
    } catch (_) {
      print('Vui lòng nhập một số nguyên hợp lệ!!!');
    }
  }
}

//hàm kiểm tra số thực
double readDouble(String prompt) {
  while (true) {
    print(prompt);
    String? input = stdin.readLineSync();
    try {
      return double.parse(input!);
    } catch (_) {
      print('Vui lòng nhập một số thực hợp lệ!!!');
    }
  }
}

//hàm kiểm tra id
String readId(String prompt, List<dynamic> list) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input != null && input.trim().isNotEmpty && !input.contains(' ')) {
      bool exists = list.any((e) => e.id == input);
      if (!exists) return input;
      print('ID đã tồn tại. Vui lòng nhập ID khác.');
    } else {
      print('ID không hợp lệ. Không được để trống hoặc có dấu cách.');
    }
  }
}

//hàm kiểm tra giới tính
String readGender(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input != null) {
      String gender = input.trim().toLowerCase();
      if (gender == 'nam' || gender == 'nữ' || gender == 'nu') {
        // Chuẩn hóa viết hoa chữ cái đầu
        return gender[0].toUpperCase() + gender.substring(1);
      }
    }
    print('Giới tính không hợp lệ. Vui lòng nhập "Nam" hoặc "Nữ".');
  }
}

void main() {
  List<Student> allStudents = [];
  List<Teacher> allTeachers = [];
  List<Classroom> allClasses = [];

  int choice;
  do {
    print('\n================= MENU ===============');
    print('1. Thêm học sinh');
    print('2. Thêm giáo viên');
    print('3. Tạo lớp học');
    print('4. Thêm học sinh vào lớp');
    print('5. Gán giáo viên vào lớp');
    print('6. Hiển thị thông tin lớp');
    print('7. Hiển thị tất cả học sinh');
    print('8. Hiển thị tất cả giáo viên');
    print('9. Thoát');
    print('=======================================');

    //nhập lựa chọn
    do {
      choice = readInt('Chọn chức năng (1-9): ');
      if (choice < 1 || choice > 9) {
        print('Lựa chọn không hợp lệ. Vui lòng chọn từ 1 đến 9.');
      }
    } while (choice < 1 || choice > 9);

    switch (choice) {
      //nhập thông tin sinh viên
      case 1:
        print('Nhập thông tin học sinh:');
        String id = readId('ID học sinh: ', allStudents);
        String name = readNonEmptyString('Tên: ');
        int age = readInt('Tuổi: ');
        String gender = readGender('Giới tính (Nam/Nữ): ');
        String grade = readNonEmptyString('Lớp: ');
        double score = readDouble('Điểm: ');
        allStudents.add(Student(id, name, age, gender, grade, score));
        print('Đã thêm học sinh.');
        break;

      //nhập thông tin giáo viên
      case 2:
        print('Nhập thông tin giáo viên:');
        String id = readId('ID giáo viên: ', allTeachers);
        String name = readNonEmptyString('Tên: ');
        int age = readInt('Tuổi: ');
        String gender = readGender('Giới tính (Nam/Nữ): ');
        String subject = readNonEmptyString('Môn dạy: ');
        double salary = readDouble('Lương: ');
        allTeachers.add(Teacher(id, name, age, gender, subject, salary));
        print('Đã thêm giáo viên.');
        break;

      //nhập thông tin lớp
      case 3:
        print('Nhập thông tin lớp:');
        String id = readId('ID lớp: ', allClasses);
        String name = readNonEmptyString('Tên lớp: ');
        allClasses.add(Classroom(id, name));
        print('Đã tạo lớp.');
        break;

      //thêm sinh viên vào lớp
      case 4:
        if (allClasses.isEmpty || allStudents.isEmpty) {
          print('Chưa có lớp hoặc học sinh nào.');
          break;
        }
        String classId = readNonEmptyString('Nhập ID lớp: ');
        Classroom? c = allClasses.firstWhere(
          (e) => e.id == classId,
          orElse: () => Classroom('', ''),
        );
        if (c.id == '') {
          print('Không tìm thấy lớp.');
          break;
        }
        String studentId = readNonEmptyString('Nhập ID học sinh: ');
        Student? s = allStudents.firstWhere(
          (e) => e.id == studentId,
          orElse: () => Student('', '', 0, '', '', 0),
        );
        if (s.id == '') {
          print('Không tìm thấy học sinh.');
          break;
        }
        c.addStudent(s);
        print('Đã thêm học sinh vào lớp.');
        break;

      //thêm giáo viên vào lớp
      case 5:
        if (allClasses.isEmpty || allTeachers.isEmpty) {
          print('Chưa có lớp hoặc giáo viên.');
          break;
        }
        String classId = readNonEmptyString('Nhập ID lớp: ');
        Classroom? c = allClasses.firstWhere(
          (e) => e.id == classId,
          orElse: () => Classroom('', ''),
        );
        if (c.id == '') {
          print('Không tìm thấy lớp.');
          break;
        }
        String teacherId = readNonEmptyString('Nhập ID giáo viên: ');
        Teacher? t = allTeachers.firstWhere(
          (e) => e.id == teacherId,
          orElse: () => Teacher('', '', 0, '', '', 0),
        );
        if (t.id == '') {
          print('Không tìm thấy giáo viên.');
          break;
        }
        c.assignTeacher(t);
        print('Đã gán giáo viên vào lớp.');
        break;

      //in thông tin lớp
      case 6:
        print('Thông tin lớp học:');
        if (allClasses.isEmpty) {
          print('Không có lớp học nào.');
          break;
        }
        for (var c in allClasses) {
          c.displayClassInfo();
        }
        break;

      //in thông tin học sinh
      case 7:
        print('Thông tin học sinh:');
        for (var s in allStudents) {
          s.displayInfo();
        }
        break;

      //in thông tin giáo viên
      case 8:
        print('Thông tin giáo viên:');
        for (var t in allTeachers) {
          t.displayInfo();
        }
        break;

      case 9:
        print('Thoát chương trình.');
        break;
    }
  } while (choice != 9);
}
