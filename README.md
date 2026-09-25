Step-by-Step Guide

Step 1: Daytona Account Banao

1. Browser me daytona.io kholo
2. "Sign Up" ya "Login with Google" click karo
3. Email verify karo
4. Dashboard pe pahucho

Step 2: Sandbox Create Karo

1. Dashboard me "Create Sandbox" click karo
2. Image: Ubuntu 22.04 select karo
3. CPU: 4 cores (free tier)
4. RAM: 8GB (free tier max 10GB)
5. Storage: 10GB
6. Auto-stop: 0 set karo (taaki band na ho)
7. Create click karo

Step 3: Terminal Open Karo

Sandbox ready hone ke baad:

1. "Terminal" icon click karo
2. Ek terminal window khulega

Step 4: Script Download & Run Karo

Terminal me yeh command paste karo:

```bash
bash <(curl -sSL https://raw.githubusercontent.com/DivyanshGamer-alt/Daytona-VpS/main/devils.sh)
```

Script automatically:

· QEMU install karega
· Ubuntu image download karega
· Cloud-init configure karega
· VM start karega
· SSHX link generate karega

Step 5: Menu Se Option Select Karo

Menu aayega:

```
[1] Create & Boot New Ubuntu VPS Instance
[2] Restart Existing VPS Instance
[3] Modify TCP Port Forward Rules
[4] Remove/Clean VPS Cache Files
[5] Exit Dashboard
```

Step 6: VPS Create Karo (Option 1)

details daalo:

Field Example
RAM 4, 8, 16, 32 8 GB
CPU Cores 2, 4, 8 4
Disk Space 10, 20, 50 10 GB
Username ubuntu ubuntu
Password 1234 Apna strong password


Step 7: VM Boot Complete Hone Ka Wait Karo

· Boot me 5-10 minute lag sakte hain
· Screen pe logs dikhenge
· SSHX link generate hoga

Step 8: SSHX Link Se Connect Karo

Boot complete hone ke baad screen pe dikhega:

```
🔥 LIVE SSHX ACCESS LINK:
https://sshx.io/s/xxxxxxxx#xxxxxxxx
```

Connect karne ke liye:

1. Link browser me kholo
2. Terminal directly VM me khulega
3. Password: jo aapne set kiya tha

🛒 Use Cases

 Linux Testing Environment
 Development Sandbox
 Web Server Hosting
 Minecraft Server
 Pterodactyl Panel Testing
 VPN Server (3x-ui)
 Learning Virtualization
