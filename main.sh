#!/bin/bash
# Raşit ÇANKAYA
# Öğrenci Numarası: 2420191006
# Docker Temelleri Sertifika : https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=mKEhkMVpBA
# Siber Güvenlikte Linux İşletim Sistemleri Sertifika : https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=XV1hBlpNPx
# Linux Bash Script Eğitimi Sertifika : https://credsverse.com/credentials/d7ee7a97-06c2-43cf-8ec9-161b49dce0a3

# 1
date -Iseconds > report.log

# 2
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

# 3
echo -n "Lütfen parolayı giriniz: "
read PAROLA

# 4
gpg --batch --yes --passphrase "$PAROLA" --symmetric --cipher-algo AES256 -o report.log.gpg report.log

# 5
rm report.log

echo "Islem tamamlandi. Log dosyasi sifrelendi ve orijinal dosya silindi."
