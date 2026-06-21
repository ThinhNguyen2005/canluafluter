# 🌾 Cân Lúa

[English](README.md) | **Tiếng Việt**

Ứng dụng Flutter di động hỗ trợ ghi chép phiếu cân lúa ruộng, theo dõi giá cả thị trường, tin tức và tư vấn nông nghiệp bằng AI. Tối ưu hóa offline-first, giao diện dễ thao tác cho nông dân ĐBSCL.

---

## 🚀 Tính Năng Chính

* **Ghi nhận & Nhập cân lúa:**
  * Lưới nhập cân 5x6 (30 ô) sắp xếp theo thứ tự cột trước, dòng sau (column-major) truyền thống.
  * Hỗ trợ chạm chọn ô bất kỳ để chỉnh sửa trực tiếp, cập nhật live-preview.
  * Tích hợp cấu hình nhanh tại chỗ (khấu bì, tạp chất, độ ẩm), giải thích công thức toán nông nghiệp chi tiết.
  * Đọc số ký bằng giọng nói (TTS tiếng Việt) và rung phản hồi (Haptic).
* **Quản lý phiếu cân & giao dịch:**
  * Danh sách phiếu cân hỗ trợ tìm kiếm, lọc theo ngày/nợ, vuốt trái để xóa (có hoàn tác).
  * Chi tiết phiếu trực quan hóa với 3 thẻ chỉ số nổi bật: Kg Thực, Tổng Tiền, Còn Nợ.
  * Ghi nhận giao dịch tài chính (cọc, trả thêm, hoàn tiền).
* **Bảng giá thị trường & Tin tức:**
  * Xem giá lúa/gạo realtime (đồng bộ từ Firestore), tự động lưu cache Drift khi offline.
  * Đọc tin tức nông nghiệp từ RSS feeds, phân loại chủ đề tự động.
* **AI Khuyến nông:**
  * Hỏi đáp tư vấn trồng lúa qua OpenRouter API (Gemini-Flash-1.5).
  * Tự động đính kèm thông tin thị trường và kiến thức canh tác vào câu hỏi.
* **Dashboard Thống kê:**
  * Thống kê vụ mùa hiện tại và so sánh liên vụ (biểu đồ cột, biểu đồ tròn giống lúa).

---

## 🛠️ Công Nghệ Sử Dụng

* **State Management:** Riverpod (`flutter_riverpod`)
* **Local Database:** Drift (`drift` + `drift_dev`) - SQLite type-safe.
* **Navigation:** GoRouter (`go_router`)
* **Charts:** fl_chart (`fl_chart`)
* **API Client:** Dio (`dio`)
* **TTS & STT:** `flutter_tts`, `speech_to_text`
* **Markdown:** `flutter_markdown`
* **Theme:** Hỗ trợ Light & Dark theme.

---

## 📁 Cấu Trúc Thư Mục

```text
lib/
├── core/
│   ├── theme/            # Cấu hình màu sắc (cấm màu tím), typography
│   ├── constants/        # Giống lúa mặc định, cấu hình chung
│   └── utils/            # Logic tính toán RiceCalculator, format định dạng số
├── database/             # AppDatabase Drift SQLite setup
├── features/
│   ├── weighing/         # Quản lý phiếu cân, chi tiết & nhập cân lúa
│   ├── market/           # Xem bảng giá lúa thị trường
│   ├── news/             # Đọc tin tức RSS
│   ├── ai_chat/          # AI khuyến nông tư vấn canh tác
│   └── dashboard/        # Báo cáo thống kê vụ mùa & liên vụ
└── services/             # TTS, Firestore, AI API, RSS parser
```

---

## 🏁 Hướng Dẫn Cài Đặt & Chạy Dự Án

### 1. Chuẩn bị môi trường
* Flutter SDK (phiên bản mới nhất)
* Android SDK / Xcode (dành cho iOS)

### 2. Cài đặt thư viện
```bash
flutter pub get
```

### 3. Sinh mã tự động (Drift Database)
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Khởi chạy ứng dụng
```bash
flutter run
```

### 5. Chạy unit tests
```bash
flutter test
```

---

## ⚠️ Nguyên Tắc Phát Triển Cốt Lõi

1. **Cấm màu tím/violet:** Không sử dụng màu tím trong bất kỳ cấu phần giao diện nào.
2. **Kích thước chạm:** Tất cả các thành phần tương tác (nút bấm, ô cân) phải có touch target tối thiểu từ $48 \times 48\text{dp}$.
3. **Offline-first:** Mọi phép tính toán khối lượng thực tế, tổng tiền, nợ phải hoạt động tức thì thông qua dữ liệu nội bộ không phụ thuộc internet.
