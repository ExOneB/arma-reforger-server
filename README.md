# Arma Reforger Dedicated Server (Conflict Arland Scenario)

A simple and secure setup for hosting an **Arma Reforger** dedicated server using Linux (Ubuntu).

## ⚙️ Server Specs Recommendation

| Component   | Recommended                 |
|-------------|-----------------------------|
| CPU         | 4-8 cores (3 GHz+)          |
| RAM         | 12-16 GB                    |
| Storage     | NVMe SSD, 100+ GB           |
| Network     | 500 Mbps or more            |

---

## 📦 Installation & Setup

### 1. Clone Repository

Clone this repository to your server:

```bash
git clone https://github.com/ExOneB/arma-reforger-server.git
cd arma-reforger-server
```

### 2. Install Dependencies

```bash
sudo apt update
sudo apt install steamcmd lib32gcc-s1 lib32stdc++6 -y
```

### 3. Configure Server

- Copy `.env.example` to `.env` and fill it with your secret data:

```bash
cp .env.example .env
nano .env
```

Example of `.env`:

```env
ARMA_ADMIN_PASSWORD=your_secure_admin_password
ARMA_BIND_ADDRESS=0.0.0.0
ARMA_BIND_PORT=7777
ARMA_REGISTER_PORT=7778
```

### 4. Initial Server Installation

Make scripts executable:

```bash
chmod +x steamInstall.sh start.sh
```

Install the Arma Reforger server via SteamCMD:

```bash
./steamInstall.sh
```

### 5. Start the Server

Run the server manually:

```bash
./start.sh
```

---

## 🔄 Update Server

To update the server, simply run:

```bash
./steamInstall.sh
```

The script will automatically pull the latest server files.

---

## 🚀 Running Server with systemd

To automatically restart the server on crash or reboot:

Create a new service file:

```bash
sudo nano /etc/systemd/system/arma.service
```

Add the following content:

```ini
[Unit]
Description=Arma Reforger Server
After=network.target

[Service]
WorkingDirectory=/path/to/arma-reforger-server
ExecStart=/path/to/arma-reforger-server/start.sh
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

Reload and start the service:

```bash
sudo systemctl daemon-reload
sudo systemctl enable arma
sudo systemctl start arma
```

Check server status:

```bash
sudo systemctl status arma
```

---

## 🔒 Security

Sensitive configuration data is kept in the `.env` file, which is ignored by Git to ensure security.

---

## 🎮 Connect to Your Server

- Open **Arma Reforger** game client.
- Connect directly via server browser or enter your server IP.

Enjoy your server!