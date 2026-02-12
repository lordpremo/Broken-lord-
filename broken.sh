#!/bin/bash

# ============================================
#   🌸 BROKEN LORD (VI) — Ultra Premium Bash UI
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
NC='\033[0m'

# -----------------------------
# Loading Animation
# -----------------------------
loading() {
    echo -ne "${YELLOW}🔄 Loading"
    for i in {1..5}; do
        echo -ne "."
        sleep 0.2
    done
    echo -e "${NC}"
}

# -----------------------------
# Detect User Location & Local Time
# -----------------------------
GEO=$(curl -s https://ipapi.co/json)

CITY=$(echo "$GEO" | grep -oP '"city":\s*"\K[^"]+')
COUNTRY=$(echo "$GEO" | grep -oP '"country_name":\s*"\K[^"]+')
TIMEZONE=$(echo "$GEO" | grep -oP '"timezone":\s*"\K[^"]+')

LOCAL_TIME=$(TZ="$TIMEZONE" date +"%d/%m/%Y @%H:%M:%S")

CITY=${CITY:-"Unknown City"}
COUNTRY=${COUNTRY:-"Unknown Country"}
TIMEZONE=${TIMEZONE:-"UTC"}
LOCAL_TIME=${LOCAL_TIME:-$(date +"%d/%m/%Y @%H:%M:%S")}

# -----------------------------
# Header
# -----------------------------
header() {
    clear
    echo -e "${PINK}╔════════════════════════════════════════╗"
    echo -e "║ 🌸🌼🌺  broken lord (VI)  🌺🌼🌸 ║"
    echo -e "╚════════════════════════════════════════╝${NC}"
    echo ""
}

# -----------------------------
# Footer
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
system -e "${CYAN}💻 System: $(uname -o)"
    echo -e "🧠 Kernel: $(uname -r)"
    echo -e "📦 Shell: $SHELL${NC}"
    echo ""
}

# -----------------------------
# Weather Feature
# -----------------------------
weather() {
    W=$(curl -s "https://wttr.in/$CITY?format=3")
    echo -e "${CYAN}🌦 Weather: $W${NC}"
}

# -----------------------------
# IP Feature
# -----------------------------
show_ip() {
    IP=$(curl -s https://api.ipify.org)
    echo -e "${GREEN}🌐 Your IP: $IP${NC}"
}

# -----------------------------
# Device Info
# -----------------------------
device_info() {
    echo -e "${YELLOW}📱 Device Info:"
    uname -a
}

# -----------------------------
# Random Joke
# -----------------------------
joke() {
    J=$(curl -s https://v2.jokeapi.dev/joke/Any?type=single | grep -oP '"joke":\s*"\K[^"]+')
    echo -e "${PINK}😂 Joke: $J${NC}"
}

# -----------------------------
# Random Quote
# -----------------------------
quote() {
    Q=$(curl -s https://api.quotable.io/random | grep -oP '"content":\s*"\K[^"]+')
    A=$(curl -s https://api.quotable.io/random | grep -oP '"author":\s*"\K[^"]+')
    echo -e "${CYAN}💬 Quote: \"$Q\" — $A${NC}"
}

# -----------------------------
# Hack Mode Animation
# -----------------------------
hackmode() {
    echo -e "${GREEN}Entering Hack Mode...${NC}"
    for i in {1..50}; do
        echo -e "${GREEN}$(openssl rand -hex 32)${NC}"
        sleep 0.05
    done
}

# -----------------------------
# Matrix Rain
# -----------------------------
matrix() {
    echo -e "${GREEN}"
    while true; do
        echo $RANDOM | md5sum | head -c 50
        sleep 0.05
    done
}

# -----------------------------
# Music Player (Your MP3)
# -----------------------------
music() {
    echo -e "${PINK}🎵 Playing Broken Lord Theme...${NC}"
    curl -s -L https://files.catbox.moe/aw7xf6.mp3 -o /tmp/brokenlord.mp3
    termux-media-player play /tmp/brokenlord.mp3 2>/dev/null || mpg123 /tmp/brokenlord.mp3
}

# -----------------------------
# Auto Update
# -----------------------------
update_script() {
    echo -e "${YELLOW}⬆ Updating script from GitHub...${NC}"
    curl -s -L https://raw.githubusercontent.com/lordpremo/brokenlord/main/brokenlord.sh -o $0
    echo -e "${GREEN}✔ Updated successfully! Restart script.${NC}"
}

# -----------------------------
# MAIN UI
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

# ASCII ART
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
⢸⣿⣿⣿⣿⣇⢹⢸⢁⣿⣿⣿⣿⣿⣿⡆⠄⠄
⢸⣿⣿⣿⣿⣿⣆⠄⣿⣿⣿⣿⣿⣿⣿⡇⠄⠄
⠸⣿⣿⣿⣿⣿⣿⠄⢿⣿⣿⣿⣿⣿⣿⡇⠄⠄
EOF

echo ""
echo -e "${YELLOW}📢 Commands: .help .weather .ip .device .joke .quote .hackmode .matrix .music .update .exit${NC}"
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
            echo "  .help"
            echo "  .weather"
            echo "  .ip"
            echo "  .device"
            echo "  .joke"
            echo "  .quote"
            echo "  .hackmode"
            echo "  .matrix"
            echo "  .music"
            echo "  .update"
            echo "  .exit${NC}"
        ;;
        .weather) weather ;;
        .ip) show_ip ;;
        .device) device_info ;;
        .joke) joke ;;
        .quote) quote ;;
        .hackmode) hackmode ;;
        .matrix) matrix ;;
        .music) music ;;
        .update) update_script ;;
        .exit)
            echo -e "${RED}👋 Exiting... Stay Broken, Stay Royal.${NC}"
            exit 0
        ;;
        *)
            echo -e "${RED}❌ Unknown command. Type .help${NC}"
        ;;
    esac
done
