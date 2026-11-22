# Deploy NEURAL VIDEO STUDIO (Render)

Vercel tidak bisa menjalankan backend ini (butuh proses Node yang jalan terus,
disk persisten, FFmpeg, dan Chromium). Deploy seluruh app (frontend + backend)
sebagai satu service Docker di Render.

1. Push folder ini ke repo GitHub.
2. Di Render: New → Blueprint → pilih repo. Render membaca `render.yaml`.
3. Isi `MOONSHOT_API_KEY` kalau mau fitur AI (boleh dikosongkan).
4. Deploy. Setelah status "Live", buka URL yang diberikan Render.
5. Cek `https://<nama-app>.onrender.com/api/health` → harus muncul `{"ok":true}`.

Catatan:
- Disk persisten (`/app/storage`) butuh plan berbayar (starter). Tanpa disk, akun dan video hilang setiap redeploy.
- `JWT_SECRET` dibuat otomatis oleh Render dan disimpan di environment.
