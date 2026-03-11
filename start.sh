#!/bin/bash
set -e

echo "=== Memulai SwiftLead Backend (Offline Mode) ==="

# Load Docker Image if exists
if [ -f "swiftlead-backend-image.tar" ]; then
    echo "⚙️ Memuat image backend ke Docker..."
    docker load -i swiftlead-backend-image.tar
else
    echo "⚠️ Warning: File swiftlead-backend-image.tar tidak ditemukan!"
    echo "Pastikan pengembang telah menjalankan script export-offline.sh"
fi

# Ensure .env exists
if [ ! -f ".env" ]; then
    echo "⚙️ Membuat file .env dari template..."
    cp .env.example .env
fi

echo "🚀 Menjalankan semua service..."
docker compose -f docker-compose.local.yml up -d

echo ""
echo "✅ Berhasil! Backend dan service lainnya sedang bejalan."
echo "API dapat diakses di: http://localhost:8080"
