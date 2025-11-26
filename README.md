I. mô tả các chức năng em đã làm
1. Chế độ tính toán (Calculator Modes)
Cơ bản (Basic): Thực hiện các phép tính cộng (+), trừ (-), nhân (x), chia (÷) với các số thực.

Khoa học (Scientific):

Lượng giác: Tính sin (sin), cos (cos), tan (tan).

Logarit: Tính logarit tự nhiên (log).

Lũy thừa & Căn: Tính căn bậc 2 (√), lũy thừa (^).

Hằng số: Hỗ trợ số Pi (π).

Xử lý biểu thức: Hỗ trợ dấu ngoặc đơn ( ) để ưu tiên phép tính.

2. Các chức năng điều khiển
Xóa (Clear functions):

C: Xóa toàn bộ biểu thức và kết quả về 0.

CE (Clear Entry): Xóa ký tự cuối cùng vừa nhập (Backspace).

Đổi dấu: Nút ± để chuyển đổi giữa số âm và số dương.

Chế độ góc: Nút chuyển đổi đơn vị đo góc RAD (Radian) và DEG (Degree) (hiện tại trên hình đang hiển thị chế độ RAD ở góc trái).

3. Quản lý dữ liệu
Lịch sử (History): Biểu tượng đồng hồ ở góc phải trên cùng cho phép xem lại các phép tính trước đó.

<img width="417" height="982" alt="image" src="https://github.com/user-attachments/assets/70cd3900-454d-46d5-9357-bbf852894b4f" />

<img width="407" height="980" alt="image" src="https://github.com/user-attachments/assets/a6224332-63fa-4d17-955e-d1393b8743e8" />

<img width="413" height="987" alt="image" src="https://github.com/user-attachments/assets/752a495c-dfe0-4a81-a24e-549fbb1dde86" />

<img width="425" height="985" alt="image" src="https://github.com/user-attachments/assets/bfa5ea89-6654-4986-92a5-b029be8fea26" />

<img width="418" height="976" alt="image" src="https://github.com/user-attachments/assets/6b67a3d5-ca15-4694-9738-329bba203b87" />

<img width="426" height="982" alt="image" src="https://github.com/user-attachments/assets/dd536cf1-d717-4f80-aef4-f08d3476485e" />

<img width="431" height="979" alt="image" src="https://github.com/user-attachments/assets/1f419816-c69d-4ded-b2cd-57134930dd52" />

<img width="433" height="982" alt="image" src="https://github.com/user-attachments/assets/ac86435d-544a-4e2b-b103-7dffd5f6a00c" />

<img width="423" height="987" alt="image" src="https://github.com/user-attachments/assets/d7534174-3c94-4a2b-ac28-a93d931127d8" />

<img width="424" height="982" alt="image" src="https://github.com/user-attachments/assets/0efac773-d728-4b10-b1f6-e05727735e34" />

II. Sơ đồ kiến trúc 

# Advanced Mobile Calculator

Một ứng dụng máy tính bỏ túi nâng cao được phát triển bằng **Flutter**, hỗ trợ tính toán cơ bản, các hàm khoa học (Scientific), quản lý lịch sử tính toán và giao diện Dark Mode hiện đại.

Dự án này là bài tập thực hành Lab 3 cho môn Lập trình thiết bị di động.

---

## Tính năng nổi bật (Features)

### 1. Chế độ tính toán (Calculator Modes)
- **Basic Mode:** Thực hiện các phép tính cộng, trừ, nhân, chia cơ bản.
- **Scientific Mode:** Hỗ trợ các hàm lượng giác (`sin`, `cos`, `tan`), logarit (`log`), căn bậc (`√`), lũy thừa (`^`) và các hằng số (`π`).
- **Xử lý biểu thức:** Hỗ trợ nhập biểu thức phức tạp, tự động xử lý thứ tự ưu tiên toán học.

### 2. Quản lý Lịch sử (History Management)
- **Lưu trữ tự động:** Lịch sử tính toán được lưu vào bộ nhớ máy (sử dụng `shared_preferences`), không bị mất khi tắt ứng dụng.
- **Xem lại:** Giao diện lịch sử trực quan.
- **Xóa:** Hỗ trợ xóa toàn bộ lịch sử.

### 3. Đơn vị đo góc & Bộ nhớ
- **RAD/DEG:** Chuyển đổi linh hoạt giữa Radian và Degree.
- **Memory Functions:** Hỗ trợ các phím bộ nhớ `M+`, `M-`, `MR`, `MC`.

### 4. Giao diện người dùng (UI/UX)
- Giao diện **Dark Mode** chuyên nghiệp, dễ nhìn.
- Hỗ trợ cử chỉ: Vuốt màn hình để xóa ký tự (Backspace gesture).

---

## Ảnh chụp màn hình (Screenshots)

| Chế độ Cơ bản & Khoa học | Màn hình Lịch sử |
|:-------------------------:|:----------------:|
| ![Basic Mode](screenshots/basic_mode.png) | ![History](screenshots/history.png) |

*(Lưu ý: Hãy đảm bảo bạn đã thêm ảnh vào thư mục `screenshots/` trong dự án)*

---

##  Sơ đồ kiến trúc (Architecture)

Dự án sử dụng mô hình **Provider Pattern** để quản lý trạng thái (State Management), giúp tách biệt logic xử lý và giao diện người dùng.

### Cấu trúc thư mục (Project Structure):

```text
lib/
├── main.dart                  # Điểm khởi chạy ứng dụng
├── models/
│   ├── calculator_mode.dart   # Enum định nghĩa chế độ
│   └── calculation_history.dart # Model dữ liệu lịch sử
├── providers/
│   ├── calculator_provider.dart # LOGIC CHÍNH: Xử lý tính toán & State
│   └── theme_provider.dart      # Logic xử lý giao diện
├── screens/
│   ├── calculator_screen.dart   # Màn hình máy tính chính
│   └── history_screen.dart      # Màn hình xem lịch sử
├── widgets/
│   ├── calculator_button.dart   # Widget nút bấm tái sử dụng
│   └── display_area.dart        # Khu vực hiển thị kết quả
└── utils/                     # Các tiện ích bổ trợ
