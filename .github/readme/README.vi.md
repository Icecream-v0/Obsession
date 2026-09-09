<p align="center">
  <img src="../../assets/obsession-logo.svg" alt="obsession-ai" width="140" />
</p>
<p align="center">
  <strong align="center">Biến sự phân tâm thành siêu tập trung. Không cần chẩn đoán!</strong>
</p>
<p align="center">
  <a href="../../LICENSE"><img src="https://img.shields.io/github/license/ayghri/obsession-ai?style=flat" alt="Giấy phép"></a>
  <a href="https://www.npmjs.com/package/obsession-ai"><img src="https://img.shields.io/npm/v/obsession-ai" alt="Phiên bản npm"></a>
</p>

<p align="center">
  <a href="../../README.md" title="English" aria-label="English">🇬🇧</a> ·
  <a href="README.zh-CN.md" title="简体中文" aria-label="简体中文">🇨🇳</a> ·
  <a href="README.pt-BR.md" title="Português (Brasil)" aria-label="Português (Brasil)">🇧🇷</a> ·
  <a href="README.ja.md" title="日本語" aria-label="日本語">🇯🇵</a> ·
  <strong title="Tiếng Việt" aria-label="Tiếng Việt">🇻🇳</strong> ·
  <a href="README.ko.md" title="한국어" aria-label="한국어">🇰🇷</a> ·
  <a href="README.th.md" title="ภาษาไทย" aria-label="ภาษาไทย">🇹🇭</a>
</p>

<p align="center">
  <img src="../../assets/hero-banner.svg" alt="Obsession-AI Banner" width="600" />
</p>

## Cài đặt

🔗 [Hướng dẫn cài đặt](../install/INSTALL.vi.md)

## Tính năng

Một kỹ năng dành cho trợ lý coding, ngăn nó ẩn câu trả lời trong những đoạn văn dài.**Hành động ưu tiên. Đánh số các bước. Bật chế độ siêu tập trung.**

<p align="center">
  <img src="../../assets/flow-diagram.svg" alt="Sơ đồ quy trình" width="500" />
</p>

## Ví dụ về thay đổi

<p align="center">
  <img src="../../assets/before-after.svg" alt="So sánh trước sau" width="600" />
</p>

<table>
<tr>
<td width="50%">

### Trước

> Câu hỏi hay! Để tôi suy nghĩ. Quy trình xác thực của bạn bao gồm một vài phần: middleware, xác minh token và xử lý cookie. Sau khi xem `src/auth.ts`, hàm `verifyToken` (khoảng dòng 42–58) dường như đang sử dụng API `jsonwebtoken` cũ. Một cách làm là nâng cấp gói này và viết lại hàm. Sau khi sửa xong, bạn cần chạy test xác thực để đảm bảo không phá vỡ chức năng nào. Nhân tiện, bạn cũng có thể muốn kiểm tra tổng thể các phiên bản phụ thuộc. Hy vọng điều này giúp ích! Nếu bạn muốn tìm hiểu sâu hơn, hãy cho tôi biết.

</td>

<td width="50%">

### Sau

> Chạy `npm install jsonwebtoken@latest`, sau đó chỉnh sửa `src/auth.ts:42`.
>
> 1. Mở `src/auth.ts`
> 2. Thay thế `verifyToken` (dòng 42–58) bằng đoạn mã bên dưới
> 3. Chạy `npm test -- auth.spec.ts`
>
> Bước tiếp theo: Nếu có test lỗi, hãy dán dòng báo lỗi đầu tiên.

</td>
</tr>
</table>

## 10 Quy tắc của Chế độ Siêu tập trung

Tổng cộng 10 quy tắc. Xem đầy đủ tại [SKILL.md](../../skills/obsession-ai/SKILL.md).

<p align="center">
  <img src="../../assets/platform-grid.svg" alt="Hỗ trợ nền tảng" width="600" />
</p>

1. **Nói hành động tiếp theo trước** - Lệnh/đường dẫn/đoạn mã ưu tiên
2. **Đánh số các tác vụ nhiều bước** - Một hành động mỗi bước
3. **Kết thúc bằng một bước cụ thể** - Công việc dưới 2 phút
4. **Tránh lạc đề** - Hoàn thành vấn đề hiện tại trước
5. **Nhắc lại trạng thái mỗi lượt** - "Bước 3 trong 5 bước"
6. **Ước lượng thời gian rõ ràng** - "15 phút" thay vì "một lát"
7. **Làm cho kết quả dễ thấy** - Chỉ ra cái gì hoạt động ngay
8. **Lỗi nói theo sự thật** - Nêu nguyên nhân và cách sửa
9. **Danh sách tối đa 5 mục** - Chia thành "làm ngay" và "làm sau"
10. **Không mở bài/tóm/kết** - Bắt đầu bằng câu trả lời

## Nền tảng hỗ trợ

| Danh mục | Nền tảng |
|------|------|
| **Trợ lý AI** | Claude Code, Cursor, Windsurf, GitHub Copilot, Codex, Pi, Qwen, Kimi, Gemini |
| **Trình soạn thảo** | VS Code, JetBrains IDEs, Vim/Neovim, Emacs, Zed |
| **Tiện ích mở rộng** | Continue.dev, Tabnine, Cody |

## Tùy chỉnh

Fork repository này, chỉnh sửa `skills/obsession-ai/SKILL.md`, sau đó sử dụng bản sao của bạn:

```bash
claude plugin uninstall obsession-ai            # Xóa bản upstream trước
claude plugin marketplace remove obsession-ai   # Fork dùng cùng tên với upstream
claude plugin marketplace add <your-username>/obsession-ai
claude plugin install obsession-ai@obsession-ai
```

Khởi động lại Claude Code, sau đó gọi lại `/obsession-ai`.

## Đóng góp

Chào mừng Issue và Pull Request! Xem [CONTRIBUTING.md](../../CONTRIBUTING.md) để biết cách tham gia.

## Giấy phép

Giấy phép MIT.

---

<p align="center">
  <strong>Nếu nó giúp bạn giảm một lần cuộn màn hình, bỏ qua một câu "Câu hỏi hay!", hãy để lại Star ⭐</strong>
</p>

<p align="center">
  <a href="https://github.com/ayghri/obsession-ai">Xem trên GitHub</a> · 
  <a href="https://www.npmjs.com/package/obsession-ai">Xem trên npm</a>
</p>
