# Setup Mining Ore English Translate: 


Requirement Server Ore Mining

| Model          | Requirements                                                                                         |
| -------------- | ---------------------------------------------------------------------------------------------------- |
| CPU            | 4 vCPU / 8 vCPU (Recomended)                                                                         |
| RAM            | 8 GB / 16 GB (Recomended)                                                                            |
| Disk           | 125GB / 250GB SSD / NVMe                                                                             |

#### Update Depedency
```sh
sudo apt update && sudo apt upgrade -y
sudo apt install curl wget libssl-dev gcc g++ ca-certificates
git clone https://github.com/avenbreaks/ore-supply-miner.git
cd ore-supply-miner
```

#### Install Rust:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env" 
source /root/.bashrc
```

#### Install the Solana CLI and create a Solana keypair:
```bash
sh -c "$(curl -sSfL https://release.solana.com/v1.18.4/install)"
export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"

solana-keygen new
```

Output Solana-Keygen:
```bash
Wrote new keypair to /root/.config/solana/id.json
=========================================================================
pubkey: 2asjdn92jsdnaskTETrScZBDSB9AYnmaBBZMSh
=========================================================================
Save this seed phrase and your BIP39 passphrase to recover your new keypair:
junk junk junk junk junk junk junk junk junk junk junk code
=========================================================================
```

#### Install the Ore CLI:
```bash
cargo install ore-cli
```

Deposit 0.1 SOL to your pubkey before we make. Example Pubkeys : ```2asjdn92jsdnaskTETrScZBDSB9AYnmaBBZMSh```

The Ore CLI uses your default Solana CLI config and identity.
```bash
ore \
--rpc https://api.mainnet-beta.solana.com \
--keypair ~/.config/solana/id.json \
--priority-fee 1 \
mine \
--threads 4
```

Have Other RPCs? 
you can replace the default RPC with your own e.g. from ``` Quicknode or Ankr.```

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

Want to check your miner? 

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