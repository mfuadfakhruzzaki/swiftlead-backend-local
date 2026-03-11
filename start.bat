@echo off
echo === Memulai SwiftLead Backend (Offline Mode) ===

REM Load Docker Image if exists
if exist "swiftlead-backend-image.tar" (
    echo [1/3] Memuat image backend ke Docker...
    docker load -i swiftlead-backend-image.tar
) else (
    echo Warning: File swiftlead-backend-image.tar tidak ditemukan!
    echo Pastikan pengembang telah menjalankan script export-offline.sh
)

REM Ensure .env exists
if not exist ".env" (
    echo [2/3] Membuat file .env dari template...
    copy .env.example .env
)

echo [3/3] Menjalankan semua service...
docker compose -f docker-compose.local.yml up -d

echo.
echo Berhasil! Backend dan service lainnya sedang bejalan.
echo API dapat diakses di: http://localhost:8080
pause
