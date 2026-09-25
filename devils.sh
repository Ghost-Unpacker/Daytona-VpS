#!/bin/bash

clear

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
MAGENTA='\033[0;95m'
ORANGE='\033[0;33m'
BOLD='\033[1m'
NC='\033[0m'

type_effect() {
    local text="$1"
    local delay="$2"
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        sleep "$delay"
    done
    echo ""
}

loading_bar() {
    local title="$1"
    echo -ne "${YELLOW}⏳ $title ${NC}[          ]"
    sleep 0.3
    echo -ne "\b\b\b\b\b\b\b\b\b\b\b[===       ]"
    sleep 0.3
    echo -ne "\b\b\b\b\b\b\b\b\b\b\b[======    ]"
    sleep 0.3
    echo -ne "\b\b\b\b\b\b\b\b\b\b\b[========= ]"
    sleep 0.3
    echo -ne "\b\b\b\b\b\b\b\b\b\b\b[==========]"
    echo -e " ${GREEN}DONE!${NC}"
}

if [ "$(id -u)" -eq 0 ]; then
    SUDO_CMD=""
else
    SUDO_CMD="sudo"
fi

show_menu() {
    clear

    echo ""
    echo -e "${MAGENTA}     ██████╗ ███████╗██╗   ██╗██╗██╗     ███████╗${NC}"
    echo -e "${MAGENTA}     ██╔══██╗██╔════╝██║   ██║██║██║     ██╔════╝${NC}"
    echo -e "${RED}     ██║  ██║█████╗  ██║   ██║██║██║     ███████╗${NC}"
    echo -e "${RED}     ██║  ██║██╔══╝  ╚██╗ ██╔╝██║██║     ╚════██║${NC}"
    echo -e "${PURPLE}     ██████╔╝███████╗ ╚████╔╝ ██║███████╗███████║${NC}"
    echo -e "${PURPLE}     ╚═════╝ ╚══════╝  ╚═══╝  ╚═╝╚══════╝╚══════╝${NC}"
    echo ""
    echo -e "${CYAN}                    ██╗    ██╗██╗██╗     ██╗     ${NC}"
    echo -e "${CYAN}                    ██║    ██║██║██║     ██║     ${NC}"
    echo -e "${BLUE}                    ██║ █╗ ██║██║██║     ██║     ${NC}"
    echo -e "${BLUE}                    ██║███╗██║██║██║     ██║     ${NC}"
    echo -e "${GREEN}                    ╚███╔███╔╝██║███████╗███████╗${NC}"
    echo -e "${GREEN}                     ╚══╝╚══╝ ╚═╝╚══════╝╚══════╝${NC}"
    echo ""
    echo -e "${RED}                    ██████╗ ██╗███████╗███████╗${NC}"
    echo -e "${RED}                    ██╔══██╗██║██╔════╝██╔════╝${NC}"
    echo -e "${YELLOW}                    ██████╔╝██║███████╗█████╗  ${NC}"
    echo -e "${YELLOW}                    ██╔══██╗██║╚════██║██╔══╝  ${NC}"
    echo -e "${ORANGE}                    ██║  ██║██║███████║███████╗${NC}"
    echo -e "${ORANGE}                    ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝${NC}"
    echo ""
    echo -e "${MAGENTA}     ══════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}                  ${BOLD}VPS CONTROL PANEL${NC}${WHITE}                    ${NC}"
    echo -e "${MAGENTA}     ══════════════════════════════════════════════════${NC}"
    echo ""

    echo -e "${RED}     ┌──────────────────────────────────────────────────┐${NC}"
    echo -e "${RED}     │  ${WHITE}SYSTEM STATUS${RED}                                    │${NC}"
    echo -e "${RED}     │                                                  │${NC}"
    echo -e "${RED}     │  ${GREEN}● ONLINE${RED}        ${CYAN}QEMU/KVM${RED}        ${YELLOW}TCP NETWORK${RED}     │${NC}"
    echo -e "${RED}     │                                                  │${NC}"
    echo -e "${RED}     └──────────────────────────────────────────────────┘${NC}"
    echo ""

    echo -e "${PURPLE}     ┌─────────────────── ${WHITE}MAIN MENU${PURPLE} ─────────────────────┐${NC}"
    echo -e "${PURPLE}     │                                                  │${NC}"

    echo -e "${PURPLE}     │   ${CYAN}01${PURPLE}  ›  ${WHITE}CREATE VPS${PURPLE}                              │${NC}"
    echo -e "${PURPLE}     │       ${WHITE}Deploy a new Ubuntu virtual machine${PURPLE}        │${NC}"
    echo -e "${PURPLE}     │                                                  │${NC}"

    echo -e "${PURPLE}     │   ${CYAN}02${PURPLE}  ›  ${WHITE}RESTART VPS${PURPLE}                             │${NC}"
    echo -e "${PURPLE}     │       ${WHITE}Start existing VPS instance${PURPLE}                │${NC}"
    echo -e "${PURPLE}     │                                                  │${NC}"

    echo -e "${PURPLE}     │   ${CYAN}03${PURPLE}  ›  ${WHITE}NETWORK${PURPLE}                                 │${NC}"
    echo -e "${PURPLE}     │       ${WHITE}Configure TCP port forwarding${PURPLE}              │${NC}"
    echo -e "${PURPLE}     │                                                  │${NC}"

    echo -e "${PURPLE}     │   ${CYAN}04${PURPLE}  ›  ${WHITE}CLEANUP${PURPLE}                                 │${NC}"
    echo -e "${PURPLE}     │       ${WHITE}Remove VPS files and cache${PURPLE}                 │${NC}"
    echo -e "${PURPLE}     │                                                  │${NC}"

    echo -e "${PURPLE}     │   ${CYAN}05${PURPLE}  ›  ${WHITE}EXIT${PURPLE}                                    │${NC}"
    echo -e "${PURPLE}     │       ${WHITE}Close control panel${PURPLE}                        │${NC}"

    echo -e "${PURPLE}     │                                                  │${NC}"
    echo -e "${PURPLE}     └──────────────────────────────────────────────────┘${NC}"
    echo ""

    echo -e "${MAGENTA}     ─────────────────────────────────────────────────────${NC}"
    echo -e "${WHITE}       DEVILS WILL RISE  •  VPS MANAGER  •  ${GREEN}READY${WHITE}${NC}"
    echo -e "${MAGENTA}     ─────────────────────────────────────────────────────${NC}"
    echo ""
    echo -e "${CYAN}     ${BOLD}Credits:${NC}"
    echo -e "${WHITE}     👤 Creator TG  : ${GREEN}@UnknownGuy9876${NC}"
    echo -e "${WHITE}     📸 Creator Insta: ${GREEN}@UnknownGuy_.01${NC}"
    echo -e "${WHITE}     📢 TG Channel  : ${GREEN}@SGCodexs${NC}"
    echo -e "${MAGENTA}     ─────────────────────────────────────────────────────${NC}"
    echo ""

    echo -ne "${CYAN}     Select option › [1-5]: ${NC}"
    read CHOICE

    case $CHOICE in
        1)
            create_vps
            ;;
        2)
            restart_vps
            ;;
        3)
            configure_tcp
            ;;
        4)
            clean_vps
            ;;
        5)
            clear
            echo ""
            echo -e "${MAGENTA}     DEVILS WILL RISE VPS Manager closed.${NC}"
            echo ""
            exit 0
            ;;
        *)
            echo ""
            echo -e "${RED}     ❌ Invalid choice! Please select 1-5.${NC}"
            sleep 2
            show_menu
            ;;
    esac
}

create_vps() {
    clear

    echo ""
    echo -e "${MAGENTA}     ╔══════════════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}     ║              ${WHITE}CREATE NEW VPS${MAGENTA}                  ║${NC}"
    echo -e "${MAGENTA}     ╚══════════════════════════════════════════════════╝${NC}"
    echo ""

    echo -ne "${CYAN}     🔹 Enter RAM Size in GB (e.g., 4, 8, 16, 32): ${NC}"
    read RAM_GB

    echo -ne "${CYAN}     🔹 Enter CPU Cores (e.g., 2, 4, 8): ${NC}"
    read CPU_CORES

    echo -ne "${CYAN}     🔹 Enter Disk Space to ADD in GB (e.g., 10, 20): ${NC}"
    read DISK_ADD

    echo -ne "${CYAN}     🔹 Create Username (Default: ubuntu): ${NC}"
    read USER_NAME

    USER_NAME=${USER_NAME:-ubuntu}

    echo -ne "${CYAN}     🔹 Create Password (Default: 1234): ${NC}"
    read USER_PASS

    USER_PASS=${USER_PASS:-1234}

    TCP_HOST_PORT=${TCP_HOST_PORT:-2222}
    TCP_GUEST_PORT=22

    echo ""
    echo -e "${YELLOW}     ⏳ Installing core dependencies... Please wait.${NC}"
    echo ""

    $SUDO_CMD apt-get update -y > /dev/null 2>&1

    $SUDO_CMD apt-get install -y \
        qemu-system-x86 \
        qemu-utils \
        wget \
        cloud-image-utils \
        curl \
        lsof > /dev/null 2>&1

    $SUDO_CMD mkdir -p /home/daytona > /dev/null 2>&1

    if [ ! -f "/home/daytona/ubuntu22.qcow2" ]; then

        echo -e "${YELLOW}     📥 Downloading Ubuntu 22.04 Cloud Image...${NC}"

        $SUDO_CMD wget -q --show-progress \
            https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img \
            -O /home/daytona/ubuntu22.qcow2

        $SUDO_CMD chmod 666 /home/daytona/ubuntu22.qcow2

    else

        echo -e "${GREEN}     ✅ Existing Ubuntu Image Cache Detected.${NC}"

    fi

    loading_bar "Generating Cloud-Init Matrix"

    cat <<EOF > user-data
#cloud-config
ssh_pwauth: True
chpasswd:
  list: |
    ${USER_NAME}:${USER_PASS}
  expire: False
EOF

    cloud-localds seed.img user-data > /dev/null 2>&1

    loading_bar "Expanding Server Hard Disk Allocation"

    $SUDO_CMD qemu-img resize \
        /home/daytona/ubuntu22.qcow2 \
        +${DISK_ADD}G > /dev/null 2>&1

    save_env
    boot_qemu
}

configure_tcp() {
    clear

    echo ""
    echo -e "${MAGENTA}     ╔══════════════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}     ║             ${WHITE}NETWORK CONFIGURATION${MAGENTA}             ║${NC}"
    echo -e "${MAGENTA}     ╚══════════════════════════════════════════════════╝${NC}"
    echo ""

    if [ -f ".vps_env" ]; then
        source .vps_env
    fi

    echo -e "     Current Target Host Port  : ${CYAN}${TCP_HOST_PORT:-2222}${NC}"
    echo -e "     Current Guest VM Port     : ${CYAN}${TCP_GUEST_PORT:-22}${NC}"
    echo ""

    echo -ne "${CYAN}     🔹 Enter NEW External Host Port (Default: 2222): ${NC}"
    read NEW_HOST_PORT

    TCP_HOST_PORT=${NEW_HOST_PORT:-2222}

    echo -ne "${CYAN}     🔹 Enter Internal Guest Port (Default SSH: 22): ${NC}"
    read NEW_GUEST_PORT

    TCP_GUEST_PORT=${NEW_GUEST_PORT:-22}

    save_env

    echo ""
    echo -e "${GREEN}     ✅ TCP Rule Updated Successfully!${NC}"

    sleep 2
    show_menu
}

save_env() {

    echo "RAM_GB=${RAM_GB:-32}" > .vps_env
    echo "CPU_CORES=${CPU_CORES:-4}" >> .vps_env
    echo "USER_NAME=${USER_NAME:-ubuntu}" >> .vps_env
    echo "USER_PASS=${USER_PASS:-1234}" >> .vps_env
    echo "TCP_HOST_PORT=${TCP_HOST_PORT:-2222}" >> .vps_env
    echo "TCP_GUEST_PORT=${TCP_GUEST_PORT:-22}" >> .vps_env
}

boot_qemu() {

    if [ -f ".vps_env" ]; then
        source .vps_env
    fi

    TCP_HOST_PORT=${TCP_HOST_PORT:-2222}
    TCP_GUEST_PORT=${TCP_GUEST_PORT:-22}

    RAM_VALUE="${RAM_GB:-32}G"

    clear

    echo ""
    echo -e "${MAGENTA}     ╔══════════════════════════════════════════════════╗${NC}"

    type_effect \
        "     🚀 DEVILS WILL RISE SYSTEM SYNCHRONIZED! STARTING VM..." \
        0.02

    echo -e "${MAGENTA}     ╚══════════════════════════════════════════════════╝${NC}"
    echo ""

    sshx_log=$(mktemp)

    curl -sSf https://sshx.io/get | sh -s run \
        > "$sshx_log" 2>&1 &

    sleep 5

    SSHX_URL=$(grep -o \
        'https://sshx.io/s/[a-zA-Z0-9]*' \
        "$sshx_log" | head -n 1)

    rm -f "$sshx_log"

    clear

    echo ""
    echo -e "${MAGENTA}     ╔══════════════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}     ║              ${GREEN}✓ VM NETWORK ACTIVE${MAGENTA}                ║${NC}"
    echo -e "${MAGENTA}     ╠══════════════════════════════════════════════════╣${NC}"
    echo -e "${MAGENTA}     ║ ${WHITE}👤 Username : ${CYAN}${USER_NAME:-ubuntu}${MAGENTA}                         ║${NC}"
    echo -e "${MAGENTA}     ║ ${WHITE}🔑 Password : ${CYAN}${USER_PASS:-1234}${MAGENTA}                           ║${NC}"
    echo -e "${MAGENTA}     ║ ${WHITE}⚙️  Resources: ${CYAN}${RAM_VALUE} RAM | ${CPU_CORES:-4} Cores${MAGENTA}       ║${NC}"
    echo -e "${MAGENTA}     ║ ${WHITE}🚀 Port Rule : ${YELLOW}${TCP_HOST_PORT} → ${TCP_GUEST_PORT}${MAGENTA}                  ║${NC}"
    echo -e "${MAGENTA}     ╠══════════════════════════════════════════════════╣${NC}"

    if [ ! -z "$SSHX_URL" ]; then

        echo -e "${MAGENTA}     ║ ${YELLOW}🔥 LIVE SSHX ACCESS LINK:${MAGENTA}                         ║${NC}"
        echo -e "${MAGENTA}     ║ ${GREEN}$SSHX_URL${MAGENTA}                                      ║${NC}"

    else

        echo -e "${MAGENTA}     ║ ${RED}⚠️ SSHX tunnel loading slow.${MAGENTA}                      ║${NC}"
        echo -e "${MAGENTA}     ║ ${WHITE}Direct local network port is listening.${MAGENTA}         ║${NC}"

    fi

    echo -e "${MAGENTA}     ╠══════════════════════════════════════════════════╣${NC}"
    echo -e "${MAGENTA}     ║ ${WHITE}👉 Connection Command:${MAGENTA}                           ║${NC}"
    echo -e "${MAGENTA}     ║ ${CYAN}ssh ${USER_NAME:-ubuntu}@localhost -p ${TCP_HOST_PORT}${MAGENTA}             ║${NC}"
    echo -e "${MAGENTA}     ╚══════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${CYAN}     ${BOLD}Powered by DEVILS WILL RISE${NC}"
    echo -e "${WHITE}     TG  : ${GREEN}@UnknownGuy9876${NC}"
    echo -e "${WHITE}     Insta: ${GREEN}@UnknownGuy_.01${NC}"
    echo -e "${WHITE}     Chnl : ${GREEN}@SGCodexs${NC}"
    echo ""

    qemu-system-x86_64 \
        -hda /home/daytona/ubuntu22.qcow2 \
        -m $RAM_VALUE \
        -smp ${CPU_CORES:-4} \
        -drive file=seed.img,format=raw \
        -nographic \
        -netdev user,id=net0,hostfwd=tcp::${TCP_HOST_PORT}-:${TCP_GUEST_PORT} \
        -device e1000,netdev=net0
}

restart_vps() {

    clear

    if [ -f "/home/daytona/ubuntu22.qcow2" ] && [ -f "seed.img" ]; then

        echo ""
        echo -e "${MAGENTA}     ╔══════════════════════════════════════════════════╗${NC}"
        echo -e "${MAGENTA}     ║        ${GREEN}🔄 RESTARTING DEVILS WILL RISE VPS${MAGENTA}       ║${NC}"
        echo -e "${MAGENTA}     ╚══════════════════════════════════════════════════╝${NC}"

        sleep 1

        boot_qemu

    else

        echo ""
        echo -e "${MAGENTA}     ╔══════════════════════════════════════════════════╗${NC}"
        echo -e "${MAGENTA}     ║ ${RED}❌ No active VPS configuration found.${MAGENTA}            ║${NC}"
        echo -e "${MAGENTA}     ║ ${WHITE}Build the VPS using Option 1.${MAGENTA}                    ║${NC}"
        echo -e "${MAGENTA}     ╚══════════════════════════════════════════════════╝${NC}"

        sleep 3

        show_menu
    fi
}

clean_vps() {

    clear

    echo ""
    echo -e "${MAGENTA}     ╔══════════════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}     ║              ${YELLOW}⚠ CLEAN WORKSPACE${MAGENTA}                 ║${NC}"
    echo -e "${MAGENTA}     ╚══════════════════════════════════════════════════╝${NC}"
    echo ""

    echo -e "${YELLOW}     ⚠️ Purging VPS storage components and configurations...${NC}"

    $SUDO_CMD rm -rf \
        user-data \
        seed.img \
        /home/daytona/ubuntu22.qcow2 \
        .vps_env

    pkill sshx > /dev/null 2>&1
    pkill sh > /dev/null 2>&1

    sleep 1

    echo -e "${GREEN}     ✅ DEVILS WILL RISE workspace successfully cleaned!${NC}"

    sleep 2

    show_menu
}

show_menu
