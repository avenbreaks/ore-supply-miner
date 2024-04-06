# Pengaturan Mining Ore Bahasa Indonesia: 

Persyaratan Server Penambangan Bijih
| Model          | Direkomendasikan                                                                                     |
| -------------- | ---------------------------------------------------------------------------------------------------- |
| CPU            | 4 vCPU / 8 vCPU (Direkomendasikan)                                                                   |
| RAM            | 8 GB / 16 GB (Direkomendasikan)                                                                      |
| Disk           | 125GB / 250GB SSD / NVMe                                                                             |

#### Update Depedency
```sh
sudo apt update && sudo apt upgrade -y
sudo apt install curl wget libssl-dev gcc g++ ca-certificates
git clone https://github.com/avenbreaks/ore-supply-miner.git
cd ore-supply-miner
```

Install Rust:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env" 
source /root/.bashrc
```

Instal Solana CLI dan buat keypair Solana:
```bash
sh -c "$(curl -sSfL https://release.solana.com/v1.18.4/install)"
export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"
solana-keygen new
```

Output Saat Membuat Keypair Solana-Keygen: 
```bash
Menuliskan kunci baru ke /root/.config/solana/id.json
=========================================================================
pubkey: 2asjdn92jsdnaskTETrScZBDSB9AYnmaBBZMSh
=========================================================================
Simpan frasa seed ini dan kata sandi BIP39 Anda untuk memulihkan pasangan kunci baru Anda:
junk junk junk junk junk junk junk junk junk junk junk code
=========================================================================
```
Instal CLI Ore:
``` bash
cargo instal ore-cli
```

Setor 0.1 SOL ke pubkey Anda yang sudah kita buatnya sebelumnya. Contoh Pubkey: ```2asjdn92jsdnaskTETrScZBDSB9AYnmaBBZMSh```
CLI Ore menggunakan konfigurasi dan identitas CLI Solana default Anda.
```bash
ore \
--rpc https://api.mainnet-beta.solana.com \
--keypair ~/.config/solana/id.json \
--priority-fee 1 \
mine \
--threads 4
```

Punya RPC lain? 
Anda bisa mengganti RPC default dengan RPC milik anda sendiri, misalnya dari ```Quicknode atau Ankr.```

#### Install PM2
```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
## paste on your terminal or paste to your .bashrc .profile ##
## start ##
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
## end ##
source /root/.bashrc
nvm install --lts
nvm use --lts
npm install -g pm2@latest
```

#### Start Ore Miner
```bash
pm2 start --name miner miner.sh
pm2 start --name claimbalance claimbalance.sh
pm2 start --name checkbalance checkbal.sh
```

Ingin melihat log miner anda? 

```bash
pm2 list
Output:

┌────┬─────────────────┬─────────────┬─────────┬─────────┬──────────┬────────┬──────┬───────────┬──────────┬──────────┬──────────┬──────────┐
│ id │ name            │ namespace   │ version │ mode    │ pid      │ uptime │ ↺    │ status    │ cpu      │ mem      │ user     │ watching │
├────┼─────────────────┼─────────────┼─────────┼─────────┼──────────┼────────┼──────┼───────────┼──────────┼──────────┼──────────┼──────────┤
│ 2  │ claimbalance    │ default     │ N/A     │ fork    │ 1637239  │ 8h     │ 0    │ online    │ 0%       │ 3.2mb    │ root     │ disabled │
│ 0  │ miner           │ default     │ N/A     │ fork    │ 1634740  │ 8h     │ 0    │ online    │ 0%       │ 3.0mb    │ root     │ disabled │
│ 1  │ reward          │ default     │ N/A     │ fork    │ 1636533  │ 8h     │ 0    │ online    │ 0%       │ 3.3mb    │ root     │ disabled │
└────┴─────────────────┴─────────────┴─────────┴─────────┴──────────┴────────┴──────┴───────────┴──────────┴──────────┴──────────┴──────────┘
```

```bash
pm2 logs 0
Output:

0|miner  | Attempt: 4
0|miner  | 5MT7gHQRfJtfH9PqQ6xdv7sXFvHA8cVzAdn93aJofmSSyQF36wj529FbpyzzA3YJVHPCXfjS7Pj7a8fTub3p1QK6
0|miner  | Confirms: [None, None, None, None, None]
0|miner  | Confirms: [None, None, None, None, None]
0|miner  | Confirms: [None, None, None, None, None]
0|miner  | Confirms: [None, None, None, None, None]
0|miner  | Transaction did not land
0|miner  | Sending on bus 0 (0.018295274 ORE)
```