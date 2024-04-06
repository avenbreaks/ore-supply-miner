#!/bin/bash

# Infinite loop
while true
do
  echo "Memulai proses menambang..."
  ore \
    --rpc https://wider-maximum-log.solana-mainnet.quiknode.pro/mktp-f6a2093b42b36d48a08ede7587340653c0407706 \
    --keypair /root/.config/solana/id.json \
    --priority-fee 5000000 \
    mine \
    --threads 8 # ubah sesuai prosesor server kamu.
  echo "Proses mining dimuat ulang..."
  #  Opsional: melakukan delay sleep selama beberapa detik untuk menghindari spam
  sleep 1
done