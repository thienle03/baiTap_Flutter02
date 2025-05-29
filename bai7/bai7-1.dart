import 'dart:io';

//hàm thêm sinh viên
void themSinhVien(List<Map<String, dynamic>> ds) {
  stdout.write('Nhập họ tên: ');
  String? hoTen = stdin.readLineSync();
  //Nhập điểm toán
  double toan = nhapDiem('Toán');
  //Nhập điểm lí
  double ly = nhapDiem('Lý');
  //Nhập điểm hóa
  double hoa = nhapDiem('Hóa');

  double dtb = (toan + ly + hoa) / 3;

  ds.add({
    'hoTen': hoTen,
    'toan': toan,
    'ly': ly,
    'hoa': hoa,
    'dtb': dtb,
    'xepLoai': getXepLoai(dtb),
  });

  print('=> Đã thêm sinh viên thành công!');
}

//hàm nhập điểm
double nhapDiem(String mon) {
  while (true) {
    stdout.write('Nhập điểm $mon: ');
    String? input = stdin.readLineSync();
    try {
      double diem = double.parse(input!);
      if (diem < 0 || diem > 10) {
        print('Điểm phải trong khoảng 0 - 10.');
      } else {
        return diem;
      }
    } catch (e) {
      print('Vui lòng nhập số hợp lệ.');
    }
  }
}

//hàm xếp loại
String getXepLoai(double dtb) {
  if (dtb < 5) return 'Kém';
  if (dtb < 7 && dtb >= 5) return 'Khá';
  if (dtb < 9 && dtb >= 7) return 'Giỏi';
  return 'Xuất sắc';
}

//hàm timf TBMax
void timDTBCaoNhat(List<Map<String, dynamic>> ds) {
  if (ds.isEmpty) {
    print('Danh sách sinh viên trống.');
    return;
  }

  double maxDTB = ds
      .map((sv) => sv['dtb'] as double)
      .reduce((a, b) => a > b ? a : b);
  var svMax = ds.where((sv) => sv['dtb'] == maxDTB).toList();

  print('\nSINH VIÊN CÓ ĐTB CAO NHẤT:');
  for (var sv in svMax) {
    print(
      'Họ tên: ${sv['hoTen']} | ĐTB: ${sv['dtb'].toStringAsFixed(2)} | Xếp loại: ${sv['xepLoai']}',
    );
  }
}

//hàm hiểm thị
void hienThiDanhSach(List<Map<String, dynamic>> ds) {
  if (ds.isEmpty) {
    print('Danh sách sinh viên trống.');
    return;
  }

  print('\nDANH SÁCH SINH VIÊN:');
  for (var sv in ds) {
    print(
      'Họ tên: ${sv['hoTen']} | ĐTB: ${sv['dtb'].toStringAsFixed(2)} | Xếp loại: ${sv['xepLoai']}',
    );
  }
}

//hàm in menu
void inMenu() {
  const int chieuDaiKhung = 40;
  for (int i = 0; i < chieuDaiKhung; i++) {
    stdout.write('=');
  }
  print('');

  List<String> menu = [
    '1. Thêm sinh viên.',
    '2. Hiển thị danh sách sinh viên.',
    '3. Tìm sinh viên có ĐTB cao nhất.',
    '4. Thoát chương trình.',
  ];

  for (var line in menu) {
    int khoangTrang = chieuDaiKhung - line.length - 2;
    String khoangTrangStr = ' ' * khoangTrang;
    print('|$line$khoangTrangStr|');
  }

  for (int i = 0; i < chieuDaiKhung; i++) {
    stdout.write('=');
  }
  print('');
}

void main() {
  List<Map<String, dynamic>> danhSach = [];
  String? luaChon;
  do {
    print("\nBài tập quản lý sinh viên: ");
    //hàm in menu
    inMenu();

    print('Chọn chức năng (1-4): ');
    luaChon = stdin.readLineSync();

    switch (luaChon) {
      case '1':
        themSinhVien(danhSach);
        break;
      case '2':
        hienThiDanhSach(danhSach);
        break;
      case '3':
        timDTBCaoNhat(danhSach);
        break;
      case '4':
        print('Đã thoát chương trình.');
        break;
      default:
        print('Lựa chọn không hợp lệ. Vui lòng chọn lại từ(1-4).');
    }
  } while (luaChon != '4');
}
