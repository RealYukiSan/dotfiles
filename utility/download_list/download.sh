#!/bin/bash

# Tentukan nama file yang berisi daftar URL (dengan satu URL per baris)
file_path="list.txt"

# Periksa apakah file ada
if [ ! -f "$file_path" ]; then
  echo "File tidak ditemukan: $file_path"
  exit 1
fi

# Baca file line by line dan lakukan loop
while IFS= read -r url; do
  # Periksa apakah URL tidak kosong
  if [ -n "$url" ]; then
    # Jalankan perintah curl untuk URL saat ini
    curl -vJO "$url"
    echo -e "\n\n"
  fi
done < "$file_path"

