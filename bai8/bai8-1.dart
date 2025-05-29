import 'dart:io';

//hàm thêm sản phẩm
void themSanPham(List<Map<String, dynamic>> gioHang) {
  print('Nhập tên sản phẩm: ');
  String? ten = stdin.readLineSync();
  print('Nhập số lượng: ');
  int sl = int.parse(stdin.readLineSync()!);
  print('Nhập giá tiền: ');
  double gia = double.parse(stdin.readLineSync()!);

  gioHang.add({'ten': ten, 'soLuong': sl, 'gia': gia});
  print('=> Đã thêm sản phẩm vào giỏ hàng.');
}

//hàm sửa sản phẩm
void suaSanPham(List<Map<String, dynamic>> gioHang) {
  print('Nhập tên sản phẩm cần sửa: ');
  String? ten = stdin.readLineSync();

  var sp = gioHang.firstWhere(
    (item) => item['ten'].toString().toLowerCase() == ten!.toLowerCase(),
    orElse: () => {},
  );

  if (sp.isEmpty) {
    print('Không tìm thấy sản phẩm.');
    return;
  }

  print('Nhập số lượng mới: ');
  int slMoi = int.parse(stdin.readLineSync()!);
  print('Nhập giá tiền mới: ');
  double giaMoi = double.parse(stdin.readLineSync()!);

  sp['soLuong'] = slMoi;
  sp['gia'] = giaMoi;

  print('=> Đã cập nhật sản phẩm.');
}

//hàm xóa sản phẩm
void xoaSanPham(List<Map<String, dynamic>> gioHang) {
  print('Nhập tên sản phẩm cần xóa: ');
  String? ten = stdin.readLineSync();

  gioHang.removeWhere(
    (item) => item['ten'].toString().toLowerCase() == ten!.toLowerCase(),
  );

  print('=> Đã xóa sản phẩm (nếu tồn tại).');
}

//hàm hiển thị giỏ hàng
void hienThiGioHang(List<Map<String, dynamic>> gioHang) {
  if (gioHang.isEmpty) {
    print('Giỏ hàng trống.');
    return;
  }

  print('\nGIỎ HÀNG:');
  for (var sp in gioHang) {
    double thanhTien = sp['soLuong'] * sp['gia'];
    print(
      'Tên: ${sp['ten']} | SL: ${sp['soLuong']} | Giá: ${sp['gia']} | Thành tiền: ${thanhTien.toStringAsFixed(0)}',
    );
  }
}

//hàm tính tổng tiền
void tinhTongTien(List<Map<String, dynamic>> gioHang) {
  double tong = 0;

  for (var sp in gioHang) {
    tong += sp['soLuong'] * sp['gia'];
  }

  print('Tổng tiền hóa đơn: ${tong.toStringAsFixed(0)} VND');
}

//hàm in menu
void inMenu() {
  print('\n============ MENU ===================');
  print('1. Thêm sản phẩm vào giỏ hàng');
  print('2. Sửa sản phẩm trong giỏ hàng');
  print('3. Xóa sản phẩm khỏi giỏ hàng');
  print('4. Hiển thị giỏ hàng');
  print('5. Tính tổng tiền hóa đơn');
  print('6. Thoát');
  print('=======================================');
}

void main() {
  List<Map<String, dynamic>> gioHang = [];
  String? luaChon;

  do {
    inMenu();
    print('\nChọn chức năng (1-6): ');
    luaChon = stdin.readLineSync();
    switch (luaChon) {
      case '1':
        themSanPham(gioHang);
        break;
      case '2':
        suaSanPham(gioHang);
        break;
      case '3':
        xoaSanPham(gioHang);
        break;
      case '4':
        hienThiGioHang(gioHang);
        break;
      case '5':
        tinhTongTien(gioHang);
        break;
      case '6':
        print('Đã thoát chương trình.');
        return;
      default:
        print('Lựa chọn không hợp lệ!');
    }
  } while (luaChon != 6);
}
