#!/bin/bash

#Infinite Loop
while true
do
  echo "Memulai pengecekan saldo Ore.."
  ore --keypair /root/.config/solana/id.json rewards

  echo "Memuat ulang..."
  # Opsional: melakukan delay sleep selama beberapa detik untuk menghindari spam
  sleep 15
done