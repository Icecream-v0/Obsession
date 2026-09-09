<p align="center">
  <img src="../../assets/obsession-logo.svg" alt="obsession-ai" width="140" />
</p>
<p align="center">
  <strong align="center">เปลี่ยนการวอกแวกเป็นสมาธิขั้นสูง ไม่ต้องวินิจฉัย!</strong>
</p>
<p align="center">
  <a href="../../LICENSE"><img src="https://img.shields.io/github/license/ayghri/obsession-ai?style=flat" alt="ใบอนุญาต"></a>
  <a href="https://www.npmjs.com/package/obsession-ai"><img src="https://img.shields.io/npm/v/obsession-ai" alt="เวอร์ชัน npm"></a>
</p>

<p align="center">
  <a href="../../README.md" title="English" aria-label="English">🇬🇧</a> ·
  <a href="README.zh-CN.md" title="简体中文" aria-label="简体中文">🇨🇳</a> ·
  <a href="README.pt-BR.md" title="Português (Brasil)" aria-label="Português (Brasil)">🇧🇷</a> ·
  <a href="README.ja.md" title="日本語" aria-label="日本語">🇯🇵</a> ·
  <a href="README.vi.md" title="Tiếng Việt" aria-label="Tiếng Việt">🇻🇳</a> ·
  <a href="README.ko.md" title="한국어" aria-label="한국어">🇰🇷</a> ·
  <strong title="ภาษาไทย" aria-label="ภาษาไทย">🇹🇭</strong>
</p>

<p align="center">
  <img src="../../assets/hero-banner.svg" alt="Obsession-AI Banner" width="600" />
</p>

## การติดตั้ง

🔗 [คำแนะนำการติดตั้ง](../install/INSTALL.th.md)

## คุณสมบัติ

ทักษะสำหรับตัวช่วยเขียนโค้ด ป้องกันไม่ให้ซ่อนคำตอบในข้อความยาวเหยียด**ลงมือทำก่อน เลขขั้นตอน เปิดโหมดสมาธิขั้นสูง**

<p align="center">
  <img src="../../assets/flow-diagram.svg" alt="ไดอะแกรมเวิร์กโฟลว์" width="500" />
</p>

## ตัวอย่างการเปลี่ยนแปลง

<p align="center">
  <img src="../../assets/before-after.svg" alt="เปรียบเทียบก่อนหลัง" width="600" />
</p>

<table>
<tr>
<td width="50%">

### ก่อน

> คำถามที่ดี! ให้ผมคิดหน่อย ไฟลว์การตรวจสอบสิทธิ์ของคุณมีหลายส่วน: middleware, การตรวจสอบโทเค็น และการจัดการ คุกกี้ หลังจากดู `src/auth.ts` ฟังก์ชัน `verifyToken` (ประมาณบรรทัด 42–58) ดูเหมือนใช้ API `jsonwebtoken` รุ่นเก่า วิธีหนึ่งคืออัปเกรดแพ็กเกจนี้และเขียนฟังก์ชันใหม่ หลังจากแก้ไขแล้ว คุณต้องรันเทสต์การตรวจสอบสิทธิ์เพื่อยืนยันว่าไม่ทำลายฟีเจอร์ใด ๆ โดยบังเอิญ ว่าแต่คุณอาจอยากตรวจสอบเวอร์ชันของ dependency ทั้งหมดด้วย หวังว่าจะช่วยได้! ถ้าต้องการให้สืบค้นเพิ่มเติม บอกผมได้เลย

</td>

<td width="50%">

### หลัง

> รัน `npm install jsonwebtoken@latest` แล้วแก้ไข `src/auth.ts:42`
>
> 1. เปิด `src/auth.ts`
> 2. แทนที่ `verifyToken` (บรรทัด 42–58) ด้วยโค้ดด้านล่าง
> 3. รัน `npm test -- auth.spec.ts`
>
> ขั้นตอนถัดไป: หากมีเทสต์ล้มเหลว ให้วางข้อความผิดพลาดบรรทัดแรก

</td>
</tr>
</table>

## 10 กฎของโหมดสมาธิขั้นสูง

มีทั้งหมด 10 กฎ ดูเนื้อหาเต็มได้ที่ [SKILL.md](../../skills/obsession-ai/SKILL.md)

<p align="center">
  <img src="../../assets/platform-grid.svg" alt="รองรับแพลตฟอร์ม" width="600" />
</p>

1. **บอกขั้นตอนถัดไปก่อน** - คำสั่ง/พาธ/สนิปเป็ตมาก่อน
2. **งานหลายขั้นตอนให้ใส่เลข** - หนึ่งขั้นตอนต่อหนึ่งการกระทำ
3. **จบด้วยขั้นตอนที่เป็นรูปธรรม** - งานที่ใช้เวลาไม่เกิน 2 นาที
4. **ไม่วกออกนอกเรื่อง** - ทำปัญหาปัจจุบันให้เสร็จก่อน
5. **ทบทวนสถานะทุกรอบ** - "ขั้นตอนที่ 3 จาก 5"
6. **ประมาณเวลาให้ชัดเจน** - "15 นาที" ไม่ใช่ "เดี๋ยวเดียว"
7. **ทำให้ผลลัพธ์มองเห็นได้** - แสดงว่าอะไรใช้งานได้ตอนนี้
8. **ข้อผิดพลาดพูดตามความจริง** - ระบุสาเหตุและวิธีแก้ไข
9. **รายการสูงสุด 5 ข้อ** - แบ่งเป็น "ทำตอนนี้" กับ "ทำทีหลัง"
10. **ไม่มีคำนำ/สรุป/คำปิด** - เริ่มด้วยคำตอบ

## แพลตฟอร์มที่รองรับ

| หมวดหมู่ | แพลตฟอร์ม |
|------|------|
| **ผู้ช่วย AI** | Claude Code, Cursor, Windsurf, GitHub Copilot, Codex, Pi, Qwen, Kimi, Gemini |
| **เอดิเตอร์** | VS Code, JetBrains IDEs, Vim/Neovim, Emacs, Zed |
| **ส่วนขยาย** | Continue.dev, Tabnine, Cody |

## การปรับแต่ง

Fork repository นี้ แก้ไข `skills/obsession-ai/SKILL.md` แล้วใช้สำเนาของคุณ:

```bash
claude plugin uninstall obsession-ai            # ลบต้นทางก่อน
claude plugin marketplace remove obsession-ai   # Fork ใช้ชื่อเดียวกับต้นทาง
claude plugin marketplace add <your-username>/obsession-ai
claude plugin install obsession-ai@obsession-ai
```

รีสตาร์ท Claude Code แล้วเรียก `/obsession-ai` อีกครั้ง

## การมีส่วนร่วม

ยินดีต้อนรับ Issue และ Pull Request! ดู [CONTRIBUTING.md](../../CONTRIBUTING.md) เพื่อเรียนรู้วิธีเข้าร่วม

## ใบอนุญาต

ใบอนุญาต MIT

---

<p align="center">
  <strong>หากมันช่วยลดการเลื่อนหน้าจอหนึ่งครั้ง ข้ามประโยค "คำถามที่ดี!" ได้ โปรดกด Star ⭐</strong>
</p>

<p align="center">
  <a href="https://github.com/ayghri/obsession-ai">ดูบน GitHub</a> · 
  <a href="https://www.npmjs.com/package/obsession-ai">ดูบน npm</a>
</p>
