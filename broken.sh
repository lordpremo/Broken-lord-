#!/bin/bash

# ============================================
#   🌸 BROKEN LORD (VI) — Premium Bash UI
#   Developer: broken lord
#   GitHub: github.com/lordpremo
# ============================================

clear

# -----------------------------
# Colors
# -----------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
PINK='\033[1;35m'
NC='\033[0m' # No Color

# -----------------------------
# Loading Animation
# -----------------------------
loading() {
    echo -ne "${YELLOW}🔄 Loading"
    for i in {1..5}; do
        echo -ne "."
        sleep 0.3
    done
    echo -e "${NC}"
}

# -----------------------------
# Detect User Location & Local Time
# -----------------------------
GEO=$(curl -s https://ipapi.co/json)

CITY=$(echo $GEO | grep -oP '"city":\s*"\K[^"]+')
COUNTRY=$(echo $GEO | grep -oP '"country_name":\s*"\K[^"]+')
TIMEZONE=$(echo $GEO | grep -oP '"timezone":\s*"\K[^"]+')

LOCAL_TIME=$(TZ="$TIMEZONE" date +"%d/%m/%Y @%H:%M:%S")

CITY=${CITY:-"Unknown City"}
COUNTRY=${COUNTRY:-"Unknown Country"}
TIMEZONE=${TIMEZONE:-"UTC"}
LOCAL_TIME=${LOCAL_TIME:-$(date +"%d/%m/%Y @%H:%M:%S")}

# -----------------------------
# Header Function
# -----------------------------
header() {
    clear
    echo -e "${PINK}╔════════════════════════════════════════╗"
    echo -e "║ 🌸🌼🌺  broken lord (VI)  🌺🌼🌸 ║"
    echo -e "╚════════════════════════════════════════╝${NC}"
    echo ""
}

# -----------------------------
# Footer Function
# -----------------------------
footer() {
    YEAR=$(date +"%Y")
    echo ""
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "🌸 ©2025–$YEAR | Made by broken lord"
    echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# -----------------------------
# System Info
# -----------------------------
system_info() {
    echo -e "${CYAN}💻 System: $(uname -o)"
    echo -e "🧠 Kernel: $(uname -r)"
    echo -e "📦 Shell: $SHELL${NC}"
    echo ""
}

# -----------------------------
# Main UI
# -----------------------------
header
loading

echo -e "${GREEN}🌷 Hello 👋 and welcome!"
echo -e "I'm broken lord 😁${NC}"
echo ""

echo -e "${PINK}🌹 Do you have a girlfriend,"
echo -e "or should I be one 🥺😩?${NC}"
echo ""

echo -e "${CYAN}🌼 I'm here to help you out"
echo -e "with my abilities below ✨${NC}"
echo ""

echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

echo -e "📍 Location: $CITY, $COUNTRY"
echo -e "⏰ Local Time: $LOCAL_TIME"
echo -e "🕒 Timezone: $TIMEZONE"
echo ""

echo -e "👨‍💻 Dev: broken lord"
echo -e "🔗 GitHub: github.com/lordpremo"
echo ""

system_info

echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# ASCII Art
cat << "EOF"
⠄⠄⠄⠄⠄⠄⠄⠄⣀⣠⣤⣤⣤⣄⡀⠄⠄⠄
⠄⠄⠄⠄⠄⠄⣴⣿⣿⣿⡿⣿⡿⣗⢌⢳⡀⠄
⠄⠄⠄⠄⠄⣼⣿⡇⣿⠹⡸⡹⣷⡹⡎⣧⢳⠄
⠄⠄⠄⠄⠄⣿⣿⠱⡙⠰⣢⡱⢹⡇⡷⢸⢸⠄
⠄⠄⠄⠄⠄⢿⢸⡈⣉⣤⠠⣴⡄⡇⠁⠄⢸⠄
⠄⠄⠄⠄⠄⠸⡆⡃⡙⢍⣹⡿⢓⠄⠤⣐⡟⠄
⠄⠄⠄⠄⠄⠄⠙⠾⠾⠮⣵⢸⡔⢷⣍⠉⠄⠄
⠄⠄⠄⠄⢀⣴⣾⣿⣷⡺⡋⢞⣎⣚⣛⣳⣴⣶
⠄⠄⠄⠄⢘⣛⣩⣾⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿
⠄⠄⣀⠺⣿⣿⣿⠟⣡⣾⠿⢿⣿⣿⡎⢋⠻⣿
⠄⠄⣉⣠⣿⣿⡏⣼⣿⠁⠶⠄⣿⣿⡇⡼⠄⠈
⠄⠄⣈⠻⠿⠟⢁⠘⢿⣷⣶⣾⣿⠟⡰⠃⠄⠄
⠄⣴⣿⣧⢻⣿⣿⣷⣦⣬⣉⣩⣴⠞⠁⠄⠄⠄
⠄⠘⠿⠿⢸⣿⣿⣿⣿⣿⣿⣿⠁⠄⠄⠄⠄⠄
⠄⢤⡝⣧⢸⣿⣿⣿⣿⣿⣿⠟⠄⠄⠄⠄⠄⠄
⣜⢧⠻⣀⢿⣿⣿⣿⣿⣿⠏⣾⣧⡀⠄⠄⠄⠄
⠹⢂⣾⣿⠸⣿⣿⣿⣿⡏⣼⣿⣿⣷⠄⠄⠄⠄
⠄⣿⣿⣿⣧⠹⣿⢻⡿⢰⣿⣿⣿⣿⣇⠄⠄⠄
⢸⣿⣿⣿⣿⣇⢹😍⢸⢁⣿⣿⣿⣿⣿⣿⡆⠄⠄
⢸⣿⣿⣿⣿⣿⣆⠄⣿⣿⣿⣿⣿⣿⣿⡇⠄⠄
⠸⣿⣿⣿⣿⣿⣿⠄⢿⣿⣿⣿⣿⣿⣿⡇⠄⠄
EOF

echo ""
echo -e "${YELLOW}📢 Reply with .help for command list"
echo -e "📲 https://whatsapp.com/channel/0029VbCHdGo7j6g5YVppfd2J${NC}"
echo ""

footer

# -----------------------------
# Command Handler
# -----------------------------
while true; do
    echo ""
    read -p "👉 Enter command: " cmd

    case $cmd in
        .help)
            echo -e "${GREEN}📜 Commands:"
            echo "  .help  - Show this menu"
            echo "  .about - About Broken Lord"
            echo "  .exit  - Quit program${NC}"
        ;;
        .about)
            echo -e "${PINK}👑 KING LORD BROKEN — Developer, Designer, Visionary${NC}"
        ;;
        .exit)
            echo -e "${RED}👋 Exiting... Stay Broken, Stay Royal.${NC}"
            exit 0
        ;;
        *)
            echo -e "${RED}❌ Unknown command. Type .help${NC}"
        ;;
    esac
done
