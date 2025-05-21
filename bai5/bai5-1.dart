import 'dart:io';

void main() {
  print("Nhập họ tên nhân viên:");
  String? hoTen = stdin.readLineSync();

  print('Nhập số giờ làm việc: ');
  double soGioLam = double.parse(stdin.readLineSync()!);

  print('Nhập lương mỗi giờ: ');
  double luongMoiGio = double.parse(stdin.readLineSync()!);

  double tongLuong = soGioLam * luongMoiGio;

  double phuCap = soGioLam > 40 ? 0.2 * tongLuong : 0.0;

  double luongCoPhuCap = tongLuong + phuCap;

  double thue;
  if (luongCoPhuCap > 10000000) {
    thue = 0.1 * luongCoPhuCap;
  } else if (luongCoPhuCap >= 7000000 && luongCoPhuCap <= 10000000) {
    thue = luongCoPhuCap * 0.05;
  } else {
    thue = 0.0;
  }

  double luongThucLanh = luongCoPhuCap - thue;

  print("\nLƯƠNG NHÂN VIÊN:");
  print('Họ tên nhân viên: $hoTen');
  print('Tổng lương trước thuế: ${luongCoPhuCap.toStringAsFixed(0)} VND');
  print('Thuế thu nhập: ${thue.toStringAsFixed(0)} VND');
  print('Lương thực lãnh: ${luongThucLanh.toStringAsFixed(0)} VND');
}
