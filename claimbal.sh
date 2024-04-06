#Infinite Loop
while true
do
  echo "Memulai Ore claim proses..."
  ore --keypair /root/.config/solana/id.json claim

  echo "Memulai ulang..."
  # Opsional: melakukan delay sleep selama beberapa detik untuk menghindari spam
  sleep 15
done