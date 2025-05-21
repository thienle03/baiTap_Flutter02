import 'dart:io';

void main() {
  print('Nhập tên sản phẩm: ');
  String? tenSanPham = stdin.readLineSync();

  print('Nhập số lượng mua: ');
  int soLuong = int.parse(stdin.readLineSync()!);

  print('Nhập đơn giá: ');
  double donGia = double.parse(stdin.readLineSync()!);

  double thanhTien = soLuong * donGia;

  double giamGia;
  if (thanhTien >= 1000000) {
    giamGia = 0.1 * thanhTien;
  } else if (thanhTien >= 500000 && thanhTien < 1000000) {
    giamGia = 0.05 * thanhTien;
  } else {
    giamGia = 0.0;
  }

  double tienSauGiam = thanhTien - giamGia;

  double thueVAT = 0.08 * tienSauGiam;

  double tongThanhToan = tienSauGiam + thueVAT;

  print('\nHOÁ ĐƠN BÁN HÀNG');
  print('Tên sản phẩm: $tenSanPham');
  print('Số lượng: $soLuong');
  print('Đơn giá: ${donGia.toStringAsFixed(0)} VND');
  print('Thành tiền: ${thanhTien.toStringAsFixed(0)} VND');
  print('Giảm giá: ${giamGia.toStringAsFixed(0)} VND');
  print('Thuế VAT (8%): ${thueVAT.toStringAsFixed(0)} VND');
  print('Tổng thanh toán: ${tongThanhToan.toStringAsFixed(0)} VND');
}
