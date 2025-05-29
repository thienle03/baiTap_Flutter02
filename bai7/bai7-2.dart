import 'dart:io';

//hàm thêm sản phẩm
void themSanPham(List<Map<String, dynamic>> ds) {
  print('Nhập tên sản phẩm: ');
  String? ten = stdin.readLineSync();

  double gia = nhapSoThuc('giá tiền');
  int soLuong = nhapSoNguyen('số lượng');

  ds.add({'ten': ten, 'gia': gia, 'soLuong': soLuong});

  print('=> Đã thêm sản phẩm thành công!');
}

//hàm nhập số thực (giá tiền)
double nhapSoThuc(String noiDung) {
  while (true) {
    print('Nhập $noiDung: ');
    String? input = stdin.readLineSync();
    try {
      double value = double.parse(input!);
      if (value < 0) {
        print('$noiDung không được âm.');
      } else {
        return value;
      }
    } catch (e) {
      print('Vui lòng nhập số hợp lệ.');
    }
  }
}

//hàm nhập số nguyên (số lượng)
int nhapSoNguyen(String noiDung) {
  while (true) {
    print('Nhập $noiDung: ');
    String? input = stdin.readLineSync();
    try {
      int value = int.parse(input!);
      if (value < 0) {
        print('$noiDung không được âm.');
      } else {
        return value;
      }
    } catch (e) {
      print('Vui lòng nhập số nguyên hợp lệ.');
    }
  }
}

//hàm hiển thị danh sách sản phẩm
void hienThiSanPham(List<Map<String, dynamic>> ds) {
  if (ds.isEmpty) {
    print('Danh sách sản phẩm trống.');
    return;
  }

  print('\nDANH SÁCH SẢN PHẨM:');
  for (var sp in ds) {
    print('Tên: ${sp['ten']} | Giá: ${sp['gia']} | Số lượng: ${sp['soLuong']}');
  }
}

//hàm tìm kiếm sản phẩm theo tên
void timKiemSanPham(List<Map<String, dynamic>> ds) {
  print('Nhập tên sản phẩm cần tìm: ');
  String? ten = stdin.readLineSync();

  var ketQua =
      ds
          .where(
            (sp) =>
                sp['ten'].toString().toLowerCase().contains(ten!.toLowerCase()),
          )
          .toList();

  if (ketQua.isEmpty) {
    print('Không tìm thấy sản phẩm nào.');
  } else {
    print('\nKẾT QUẢ TÌM KIẾM:');
    for (var sp in ketQua) {
      print(
        'Tên: ${sp['ten']} | Giá: ${sp['gia']} | Số lượng: ${sp['soLuong']}',
      );
    }
  }
}

//hàm bán sản phẩm
void banSanPham(List<Map<String, dynamic>> ds) {
  print('Nhập tên sản phẩm cần bán: ');
  String? ten = stdin.readLineSync();
  int soLuongCanBan = nhapSoNguyen('số lượng cần bán');
  var sp = ds.firstWhere(
    (s) => s['ten'].toString().toLowerCase() == ten!.toLowerCase(),
    orElse: () => {},
  );

  if (sp.isEmpty) {
    print('Không tìm thấy sản phẩm!');
    return;
  }

  if (sp['soLuong'] >= soLuongCanBan) {
    sp['soLuong'] -= soLuongCanBan;
    print('=> Đã bán $soLuongCanBan sản phẩm "${sp['ten']}".');
  } else {
    print('Không đủ hàng trong kho. Hiện có: ${sp['soLuong']} sản phẩm.');
  }
}

// In menu
void inMenu() {
  print('\n========== QUẢN LÝ SẢN PHẨM ==========');
  print('1. Thêm sản phẩm.');
  print('2. Hiển thị danh sách sản phẩm.');
  print('3. Tìm kiếm sản phẩm theo tên.');
  print('4. Bán sản phẩm.');
  print('5. Thoát chương trình.');
  print('=======================================');
}

void main() {
  List<Map<String, dynamic>> danhSachSanPham = [];
  String? luaChon;

  do {
    inMenu();
    stdout.write('Chọn chức năng (1-5): ');
    luaChon = stdin.readLineSync();
    switch (luaChon) {
      case '1':
        themSanPham(danhSachSanPham);
        break;
      case '2':
        hienThiSanPham(danhSachSanPham);
        break;
      case '3':
        timKiemSanPham(danhSachSanPham);
        break;
      case '4':
        banSanPham(danhSachSanPham);
        break;
      case '5':
        print('Đã thoát chương trình.');
        break;
      default:
        print('Lựa chọn không hợp lệ. Vui lòng chọn từ 1-5.');
    }
  } while (luaChon != '5');
}
