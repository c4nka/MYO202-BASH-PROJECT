#!/bin/bash
# Raşit ÇANKAYA
# Öğrenci Numarası: 2420191006
# Sertifika 1:
# Sertifika 2:
# Sertifika 3:

# 1. ISO formatında tarih ve saat ile report.log dosyasını oluşturma
date -Iseconds > report.log

# 2. Windows donanım bilgilerini report.log dosyasına ekleme
echo "" >> report.log
echo "=== DONANIM BILGILERI ===" >> report.log

echo "--- Islemci ---" >> report.log
wmic cpu get name >> report.log

echo "--- RAM ---" >> report.log
wmic memorychip get capacity >> report.log

echo "--- Anakart ---" >> report.log
wmic baseboard get product,Manufacturer >> report.log

echo "--- UUID ---" >> report.log
wmic csproduct get uuid >> report.log

echo "--- MAC Adresi ---" >> report.log
getmac >> report.log
echo "=========================" >> report.log

# 3. Kullanıcıdan parola alma
echo -n "Lütfen parolayı giriniz: "
read PAROLA

# 4. GPG ile AES256 formatında şifreleme
gpg --batch --yes --passphrase "$PAROLA" --symmetric --cipher-algo AES256 -o report.log.gpg report.log

# 5. Orijinal şifresiz dosyayı silme
rm report.log

echo "Islem tamamlandi. Log dosyasi sifrelendi ve orijinal dosya silindi."
