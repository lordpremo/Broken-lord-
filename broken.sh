#!/bin/bash

# ============================================
#   🌸 BROKEN LORD (VI) — GOD MODE++ Bash UI
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
LAT=$(echo "$GEO" | grep -oP '"latitude":\s*"\K[^"]+' || echo "")
LON=$(echo "$GEO" | grep -oP '"longitude":\s*"\K[^"]+' || echo "")
REGION=$(echo "$GEO" | grep -oP '"region":\s*"\K[^"]+' || echo "")
POSTAL=$(echo "$GEO" | grep -oP '"postal":\s*"\K[^"]+' || echo "")

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
system_info() {
    echo -e "${CYAN}💻 System: $(uname -o)"
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
    echo -e "${YELLOW}📱 Device Info:${NC}"
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
    DATA=$(curl -s https://api.quotable.io/random)
    Q=$(echo "$DATA" | grep -oP '"content":\s*"\K[^"]+')
    A=$(echo "$DATA" | grep -oP '"author":\s*"\K[^"]+')
    echo -e "${CYAN}💬 \"$Q\" — $A${NC}"
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
        echo ""
        sleep 0.05
    done
}

# -----------------------------
# Music Player (Playlist Ready)
# -----------------------------
music() {
    echo -e "${PINK}🎵 Loading Broken Lord Theme...${NC}"

    if [ ! -d /sdcard ]; then
        echo -e "${RED}⚠ Storage not accessible. Run: termux-setup-storage${NC}"
        return
    fi

    if [ ! -f /sdcard/brokenlord.mp3 ]; then
        echo -e "${YELLOW}⬇ Downloading audio...${NC}"
        curl -L -o /sdcard/brokenlord.mp3 https://files.catbox.moe/aw7xf6.mp3
    fi

    if command -v termux-media-player >/dev/null 2>&1; then
        termux-media-player play /sdcard/brokenlord.mp3
        return
    fi

    if command -v mpg123 >/dev/null 2>&1; then
        mpg123 /sdcard/brokenlord.mp3
        return
    fi

    echo -e "${RED}❌ No audio player found.${NC}"
    echo -e "${YELLOW}Install one of these:${NC}"
    echo "pkg install termux-api"
    echo "pkg install mpg123"
}

playlist() {
    echo -e "${PINK}🎶 Broken Lord Playlist:${NC}"
    echo "1) Main Theme"
    read -p "Choose track [1]: " choice
    choice=${choice:-1}
    case $choice in
        1) music ;;
        *) echo -e "${RED}Invalid choice.${NC}" ;;
    esac
}

# -----------------------------
# Auto Update
# -----------------------------
update_script() {
    echo -e "${YELLOW}⬆ Updating script from GitHub...${NC}"
    curl -s -L https://raw.githubusercontent.com/lordpremo/brokenlord/main/broken.sh -o "$0"
    echo -e "${GREEN}✔ Updated successfully! Restart script.${NC}"
}

# -----------------------------
# AI Chat (.ai) – OpenAI style (optional)
# -----------------------------
ai_chat() {
    if [ -z "$AI_API_KEY" ]; then
        echo -e "${RED}⚠ Set AI_API_KEY environment variable first.${NC}"
        return
    fi

    PROMPT="$*"
    [ -z "$PROMPT" ] && { echo -e "${YELLOW}Usage: .ai your message here${NC}"; return; }

    echo -e "${CYAN}🤖 Thinking...${NC}"

    RESP=$(curl -s -H "Content-Type: application/json" \
        -H "Authorization: Bearer $AI_API_KEY" \
        -d "{\"model\":\"gpt-4o-mini\",\"messages\":[{\"role\":\"user\",\"content\":\"$PROMPT\"}]}" \
        https://api.openai.com/v1/chat/completions)

    MSG=$(echo "$RESP" | grep -oP '"content":\s*"\K[^"]+')
    echo -e "${GREEN}AI:${NC} $MSG"
}

# -----------------------------
# Nexray AI (.ai2 / .ai3 / helpers)
# -----------------------------
ai2() {
    TEXT="$*"
    [ -z "$TEXT" ] && { echo -e "${YELLOW}Usage: .ai2 Hello${NC}"; return; }
    RESP=$(curl -s "https://api.nexray.web.id/ai/copilot?text=$(echo "$TEXT" | sed 's/ /%20/g')")
    echo -e "${CYAN}🤖 AI2:${NC} $RESP"
}

ai3() {
    TEXT="$*"
    [ -z "$TEXT" ] && { echo -e "${YELLOW}Usage: .ai3 your prompt${NC}"; return; }
    RESP=$(curl -s "https://api.nexray.web.id/ai/copilot?text=$(echo "$TEXT" | sed 's/ /%20/g')")
    echo -e "${GREEN}🤖 AI3:${NC} $RESP"
}

summarize_text() {
    TEXT="$*"
    [ -z "$TEXT" ] && { echo -e "${YELLOW}Usage: .summarize long text${NC}"; return; }
    PROMPT="Summarize this in short points: $TEXT"
    RESP=$(curl -s "https://api.nexray.web.id/ai/copilot?text=$(echo "$PROMPT" | sed 's/ /%20/g')")
    echo -e "${CYAN}📝 Summary:${NC} $RESP"
}

rewrite_text() {
    TEXT="$*"
    [ -z "$TEXT" ] && { echo -e "${YELLOW}Usage: .rewrite text${NC}"; return; }
    PROMPT="Rewrite this in a cooler style: $TEXT"
    RESP=$(curl -s "https://api.nexray.web.id/ai/copilot?text=$(echo "$PROMPT" | sed 's/ /%20/g')")
    echo -e "${PINK}✍ Rewrite:${NC} $RESP"
}

translate2() {
    LANG="$1"
    shift
    TEXT="$*"
    if [ -z "$LANG" ] || [ -z "$TEXT" ]; then
        echo -e "${YELLOW}Usage: .translate2 sw Hello there${NC}"
        return
    fi
    PROMPT="Translate this to $LANG: $TEXT"
    RESP=$(curl -s "https://api.nexray.web.id/ai/copilot?text=$(echo "$PROMPT" | sed 's/ /%20/g')")
    echo -e "${CYAN}🌍 Translation:${NC} $RESP"
}

# -----------------------------
# Translate (.translate)
# -----------------------------
translate_text() {
    FROM="$1"
    TO="$2"
    shift 2
    TEXT="$*"

    if [ -z "$FROM" ] || [ -z "$TO" ] || [ -z "$TEXT" ]; then
        echo -e "${YELLOW}Usage: .translate en sw Hello world${NC}"
        return
    fi

    RESP=$(curl -s -X POST https://libretranslate.de/translate \
        -H 'Content-Type: application/json' \
        -d "{\"q\":\"$TEXT\",\"source\":\"$FROM\",\"target\":\"$TO\",\"format\":\"text\"}")

    OUT=$(echo "$RESP" | grep -oP '"translatedText":\s*"\K[^"]+')
    echo -e "${CYAN}🌐 $OUT${NC}"
}

# -----------------------------
# Package Scanner (.scanpkg)
# -----------------------------
scanpkg() {
    PKG="$1"
    if [ -z "$PKG" ]; then
        echo -e "${YELLOW}Usage: .scanpkg curl${NC}"
        return
    fi

    if command -v "$PKG" >/dev/null 2>&1; then
        echo -e "${GREEN}✔ Package '$PKG' is installed.${NC}"
    else
        echo -e "${RED}✖ Package '$PKG' is NOT installed.${NC}"
    fi
}

# -----------------------------
# Website Status (.status)
# -----------------------------
status_check() {
    URL="$1"
    if [ -z "$URL" ]; then
        echo -e "${YELLOW}Usage: .status https://example.com${NC}"
        return
    fi

    CODE=$(curl -o /dev/null -s -w "%{http_code}" "$URL")
    echo -e "${CYAN}🔎 Status code for $URL: $CODE${NC}"
}

# -----------------------------
# IP Lookup (.lookup)
# -----------------------------
ip_lookup() {
    IP="$1"
    if [ -z "$IP" ]; then
        echo -e "${YELLOW}Usage: .lookup 8.8.8.8${NC}"
        return
    fi

    DATA=$(curl -s "https://ipapi.co/$IP/json")
    C=$(echo "$DATA" | grep -oP '"country_name":\s*"\K[^"]+')
    CI=$(echo "$DATA" | grep -oP '"city":\s*"\K[^"]+')
    TZ=$(echo "$DATA" | grep -oP '"timezone":\s*"\K[^"]+')
    ISP=$(echo "$DATA" | grep -oP '"org":\s*"\K[^"]+')

    echo -e "${CYAN}🌍 IP Lookup for $IP${NC}"
    echo -e "Country: $C"
    echo -e "City: $CI"
    echo -e "Timezone: $TZ"
    echo -e "ISP: $ISP"
}

# -----------------------------
# Password Generator (.pass)
# -----------------------------
gen_pass() {
    LEN="$1"
    [ -z "$LEN" ] && LEN=16
    PASS=$(tr -dc 'A-Za-z0-9!@#$%^&*()_+=' </dev/urandom | head -c "$LEN")
    echo -e "${GREEN}🔐 Password: $PASS${NC}"
}

# -----------------------------
# Hash Generator (.hash)
# -----------------------------
hash_gen() {
    TEXT="$*"
    if [ -z "$TEXT" ]; then
        echo -e "${YELLOW}Usage: .hash your_text_here${NC}"
        return
    fi
    echo -e "${CYAN}MD5:    $(echo -n "$TEXT" | md5sum | awk '{print $1}')${NC}"
    echo -e "${CYAN}SHA1:   $(echo -n "$TEXT" | sha1sum | awk '{print $1}')${NC}"
    echo -e "${CYAN}SHA256: $(echo -n "$TEXT" | sha256sum | awk '{print $1}')${NC}"
}

# -----------------------------
# Banner (.banner)
# -----------------------------
banner() {
    TEXT="$*"
    if [ -z "$TEXT" ]; then
        echo -e "${YELLOW}Usage: .banner BROKEN LORD${NC}"
        return
    fi

    if command -v figlet >/dev/null 2>&1; then
        echo -e "${PINK}"
        figlet "$TEXT"
        echo -e "${NC}"
    else
        echo -e "${RED}figlet not installed. Run: pkg install figlet${NC}"
    fi
}

# -----------------------------
# Speed Test (.speed)
# -----------------------------
speed_test() {
    if command -v speedtest-cli >/dev/null 2>&1; then
        speedtest-cli
    else
        echo -e "${RED}speedtest-cli not installed.${NC}"
        echo -e "${YELLOW}Run: pip install speedtest-cli${NC}"
    fi
}

# -----------------------------
# Fun: 8ball (.8ball)
# -----------------------------
eight_ball() {
    MSGS=("Yes" "No" "Maybe" "Ask again later" "Definitely" "Never" "50/50" "Trust your gut")
    IDX=$((RANDOM % ${#MSGS[@]}))
    echo -e "${PINK}🎱 ${MSGS[$IDX]}${NC}"
}

# -----------------------------
# Fun: Love Calculator (.love)
# -----------------------------
love_calc() {
    A="$1"
    B="$2"
    if [ -z "$A" ] || [ -z "$B" ]; then
        echo -e "${YELLOW}Usage: .love name1 name2${NC}"
        return
    fi
    P=$(( ( $(echo -n "$A$B" | md5sum | tr -dc '0-9' | head -c 2) % 100 ) + 1 ))
    echo -e "${PINK}❤️ Love between $A and $B: $P%${NC}"
}

# -----------------------------
# Fun: Random Fact (.fact)
# -----------------------------
fact() {
    F=$(curl -s https://uselessfacts.jsph.pl/api/v2/facts/random | grep -oP '"text":\s*"\K[^"]+')
    echo -e "${CYAN}📘 Fact: $F${NC}"
}

# -----------------------------
# Termux Tools (.battery, .vibrate, .torch, .notify)
# -----------------------------
battery() {
    if command -v termux-battery-status >/dev/null 2>&1; then
        termux-battery-status
    else
        echo -e "${RED}termux-api not installed or Termux:API app missing.${NC}"
    fi
}

vibrate() {
    if command -v termux-vibrate >/dev/null 2>&1; then
        termux-vibrate -d 500
    else
        echo -e "${RED}termux-vibrate not available.${NC}"
    fi
}

torch() {
    STATE="$1"
    if [ -z "$STATE" ]; then
        echo -e "${YELLOW}Usage: .torch on|off${NC}"
        return
    fi
    if command -v termux-torch >/dev/null 2>&1; then
        termux-torch "$STATE"
    else
        echo -e "${RED}termux-torch not available.${NC}"
    fi
}

notify() {
    MSG="$*"
    if [ -z "$MSG" ]; then
        echo -e "${YELLOW}Usage: .notify your message${NC}"
        return
    fi
    if command -v termux-notification >/dev/null 2>&1; then
        termux-notification -t "BROKEN LORD" -c "$MSG"
    else
        echo -e "${RED}termux-notification not available.${NC}"
    fi
}

# -----------------------------
# Geo Info (.geo)
# -----------------------------
geo_info() {
    echo -e "${CYAN}📍 Geo Info:${NC}"
    echo "City:    $CITY"
    echo "Country: $COUNTRY"
    echo "Region:  $REGION"
    echo "Postal:  $POSTAL"
    echo "Lat:     $LAT"
    echo "Lon:     $LON"
    echo "TZ:      $TIMEZONE"
}

# -----------------------------
# Username OSINT (.usersearch)
# -----------------------------
usersearch() {
    U="$1"
    if [ -z "$U" ]; then
        echo -e "${YELLOW}Usage: .usersearch username${NC}"
        return
    fi

    echo -e "${CYAN}🔎 Checking username '$U' on platforms...${NC}"

    for site in "https://github.com/$U" \
                "https://twitter.com/$U" \
                "https://www.instagram.com/$U" \
                "https://www.reddit.com/user/$U" \
                "https://tiktok.com/@$U"; do
        CODE=$(curl -o /dev/null -s -w "%{http_code}" "$site")
        if [ "$CODE" = "200" ]; then
            echo -e "${GREEN}✔ Found: $site${NC}"
        else
            echo -e "${RED}✖ Not found: $site${NC}"
        fi
    done
}

# -----------------------------
# QR Code (.qr)
# -----------------------------
qr_gen() {
    TEXT="$*"
    if [ -z "$TEXT" ]; then
        echo -e "${YELLOW}Usage: .qr https://example.com${NC}"
        return
    fi

    if command -v qrencode >/dev/null 2>&1; then
        echo -e "${GREEN}"
        qrencode -t ANSIUTF8 "$TEXT"
        echo -e "${NC}"
    else
        echo -e "${RED}qrencode not installed. Run: pkg install qrencode${NC}"
    fi
}

# -----------------------------
# Nexray TikTok Photo (.tiktok)
# -----------------------------
tiktok_photo() {
    Q="$*"
    [ -z "$Q" ] && { echo -e "${YELLOW}Usage: .tiktok Zuchu${NC}"; return; }

    RESP=$(curl -s "https://api.nexray.web.id/search/tiktokphoto?q=$(echo "$Q" | sed 's/ /%20/g')")
    echo -e "${PINK}📸 TikTok Photos:${NC}"
    echo "$RESP"
}

# -----------------------------
# Nexray YouTube Search (.youtube)
# -----------------------------
youtube_search() {
    Q="$*"
    [ -z "$Q" ] && { echo -e "${YELLOW}Usage: .youtube Zuchu${NC}"; return; }

    RESP=$(curl -s "https://api.nexray.web.id/search/youtube?q=$(echo "$Q" | sed 's/ /%20/g')")
    echo -e "${GREEN}🎬 YouTube Results:${NC}"
    echo "$RESP"
}

# -----------------------------
# Nexray Wikipedia Search (.wiki)
# -----------------------------
wiki_search() {
    Q="$*"
    [ -z "$Q" ] && { echo -e "${YELLOW}Usage: .wiki Zuchu${NC}"; return; }

    RESP=$(curl -s "https://api.nexray.web.id/search/wikipedia?q=$(echo "$Q" | sed 's/ /%20/g')")
    echo -e "${CYAN}📚 Wikipedia Info:${NC}"
    echo "$RESP"
}

# -----------------------------
# Nexray YouTube MP4 Downloader (.ytmp4)
# -----------------------------
ytmp4() {
    URL="$*"
    [ -z "$URL" ] && { echo -e "${YELLOW}Usage: .ytmp4 https://youtube.com/watch?v=...${NC}"; return; }

    ENCODED=$(printf '%s' "$URL" | sed 's/:/%3A/g; s/\//%2F/g; s/?/%3F/g; s/=/%3D/g; s/&/%26/g')

    RESP=$(curl -s "https://api.nexray.web.id/downloader/ytmp4?url=$ENCODED&resolusi=2160")

    echo -e "${GREEN}🎥 Download Info:${NC}"
    echo "$RESP"
}

# -----------------------------
# EXTRA SYSTEM COMMANDS
# -----------------------------
ram_info() {
    echo -e "${CYAN}📦 RAM Usage:${NC}"
    free -h
}

cpu_info() {
    echo -e "${CYAN}🧠 CPU Info:${NC}"
    lscpu 2>/dev/null || cat /proc/cpuinfo
}

storage_info() {
    echo -e "${CYAN}💾 Storage:${NC}"
    df -h
}

process_list() {
    echo -e "${CYAN}📋 Top Processes:${NC}"
    ps aux | head -n 15
}

kill_process() {
    PID="$1"
    if [ -z "$PID" ]; then
        echo -e "${YELLOW}Usage: .kill PID${NC}"
        return
    fi
    kill "$PID" && echo -e "${GREEN}✔ Killed process $PID${NC}" || echo -e "${RED}❌ Failed to kill $PID${NC}"
}

wifi_info() {
    echo -e "${YELLOW}⚠ WiFi info not directly accessible on Termux.${NC}"
    echo -e "${CYAN}Tip:${NC} Tumia app ya system kuangalia WiFi details."
}

# -----------------------------
# FUN EXTRAS
# -----------------------------
horoscope() {
    SIGN="$1"
    [ -z "$SIGN" ] && { echo -e "${YELLOW}Usage: .horoscope aries${NC}"; return; }
    echo -e "${CYAN}🔮 Horoscope for $SIGN:${NC}"
    curl -s "https://aztro.sameerkumar.website/?sign=$SIGN&day=today" -X POST
}

roast() {
    TARGET="$*"
    [ -z "$TARGET" ] && TARGET="you"
    MSGS=("You're like a bug in production: nobody knows why you're here."
          "If laziness was a sport, you'd still come late to the game."
          "You're the human version of 'low battery'.")
    IDX=$((RANDOM % ${#MSGS[@]}))
    echo -e "${PINK}🔥 Roast for $TARGET:${NC} ${MSGS[$IDX]}"
}

pickup() {
    MSGS=("Are you WiFi? Because I'm feeling a strong connection."
          "Do you debug? Because you just fixed my bad day."
          "Are you a terminal? Because I can't stop typing your name.")
    IDX=$((RANDOM % ${#MSGS[@]}))
    echo -e "${PINK}💘 Pickup line:${NC} ${MSGS[$IDX]}"
}

truth_cmd() {
    MSGS=("What is your biggest fear?"
          "Who was your last crush?"
          "What is one thing you regret?")
    IDX=$((RANDOM % ${#MSGS[@]}))
    echo -e "${CYAN}🧠 TRUTH:${NC} ${MSGS[$IDX]}"
}

dare_cmd() {
    MSGS=("Text your friend 'I have a secret 👀'."
          "Change your WhatsApp status to 'BROKEN LORD OWNS ME' for 10 minutes."
          "Send a voice note laughing for 10 seconds straight.")
    IDX=$((RANDOM % ${#MSGS[@]}))
    echo -e "${CYAN}🎲 DARE:${NC} ${MSGS[$IDX]}"
}

insult() {
    MSGS=("You're not stupid; you just have bad luck thinking."
          "If brains were RAM, you'd be 128MB."
          "You're like a semicolon in Bash: mostly unnecessary.")
    IDX=$((RANDOM % ${#MSGS[@]}))
    echo -e "${RED}💢 Insult:${NC} ${MSGS[$IDX]}"
}

compliment() {
    MSGS=("Your vibe is premium, like a paid tool in a world of trials."
          "You debug life better than most debug code."
          "If confidence was a script, you'd be GOD MODE.")
    IDX=$((RANDOM % ${#MSGS[@]}))
    echo -e "${GREEN}🌟 Compliment:${NC} ${MSGS[$IDX]}"
}

# -----------------------------
# Nexray / API EXTRA
# -----------------------------
lyrics_search() {
    Q="$*"
    [ -z "$Q" ] && { echo -e "${YELLOW}Usage: .lyrics song name${NC}"; return; }
    RESP=$(curl -s "https://api.nexray.web.id/search/lyrics?q=$(echo "$Q" | sed 's/ /%20/g')")
    echo -e "${CYAN}🎵 Lyrics Result:${NC}"
    echo "$RESP"
}

movie_search() {
    Q="$*"
    [ -z "$Q" ] && { echo -e "${YELLOW}Usage: .movie movie name${NC}"; return; }
    RESP=$(curl -s "https://api.nexray.web.id/search/movie?q=$(echo "$Q" | sed 's/ /%20/g')")
    echo -e "${GREEN}🎬 Movie Result:${NC}"
    echo "$RESP"
}

news_search() {
    Q="$*"
    [ -z "$Q" ] && Q="technology"
    RESP=$(curl -s "https://api.nexray.web.id/search/news?q=$(echo "$Q" | sed 's/ /%20/g')")
    echo -e "${CYAN}📰 News:${NC}"
    echo "$RESP"
}

anime_search() {
    Q="$*"
    [ -z "$Q" ] && { echo -e "${YELLOW}Usage: .anime name${NC}"; return; }
    RESP=$(curl -s "https://api.nexray.web.id/search/anime?q=$(echo "$Q" | sed 's/ /%20/g')")
    echo -e "${PINK}🎌 Anime:${NC}"
    echo "$RESP"
}

currency_convert() {
    FROM="$1"
    TO="$2"
    AMOUNT="$3"
    if [ -z "$FROM" ] || [ -z "$TO" ] || [ -z "$AMOUNT" ]; then
        echo -e "${YELLOW}Usage: .currency USD TZS 10${NC}"
        return
    fi
    RESP=$(curl -s "https://api.exchangerate.host/convert?from=$FROM&to=$TO&amount=$AMOUNT")
    RES=$(echo "$RESP" | grep -oP '"result":\s*\K[0-9.]+')
    echo -e "${CYAN}💱 $AMOUNT $FROM = $RES $TO${NC}"
}

dictionary_lookup() {
    WORD="$1"
    [ -z "$WORD" ] && { echo -e "${YELLOW}Usage: .dict word${NC}"; return; }
    RESP=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en/$WORD")
    echo -e "${CYAN}📖 Dictionary for '$WORD':${NC}"
    echo "$RESP"
}

weather2() {
    CITYQ="$*"
    [ -z "$CITYQ" ] && CITYQ="$CITY"
    W=$(curl -s "https://wttr.in/$CITYQ?format=3")
    echo -e "${CYAN}🌦 Weather: $W${NC}"
}

# -----------------------------
# Downloaders EXTRA
# -----------------------------
ytmp3() {
    URL="$*"
    [ -z "$URL" ] && { echo -e "${YELLOW}Usage: .ytmp3 https://youtube.com/watch?v=...${NC}"; return; }
    ENCODED=$(printf '%s' "$URL" | sed 's/:/%3A/g; s/\//%2F/g; s/?/%3F/g; s/=/%3D/g; s/&/%26/g')
    RESP=$(curl -s "https://api.nexray.web.id/downloader/ytmp3?url=$ENCODED")
    echo -e "${GREEN}🎧 YTMP3:${NC}"
    echo "$RESP"
}

tiktokdl() {
    URL="$*"
    [ -z "$URL" ] && { echo -e "${YELLOW}Usage: .tiktokdl url${NC}"; return; }
    RESP=$(curl -s "https://api.nexray.web.id/downloader/tiktok?url=$(echo "$URL" | sed 's/ /%20/g')")
    echo -e "${PINK}🎥 TikTok Download:${NC}"
    echo "$RESP"
}

instadl() {
    URL="$*"
    [ -z "$URL" ] && { echo -e "${YELLOW}Usage: .instadl url${NC}"; return; }
    RESP=$(curl -s "https://api.nexray.web.id/downloader/instagram?url=$(echo "$URL" | sed 's/ /%20/g')")
    echo -e "${CYAN}📸 Instagram Download:${NC}"
    echo "$RESP"
}

fbdl() {
    URL="$*"
    [ -z "$URL" ] && { echo -e "${YELLOW}Usage: .fbdl url${NC}"; return; }
    RESP=$(curl -s "https://api.nexray.web.id/downloader/facebook?url=$(echo "$URL" | sed 's/ /%20/g')")
    echo -e "${BLUE}📘 Facebook Download:${NC}"
    echo "$RESP"
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
echo -e "${YELLOW}📢 Commands (main):${NC}"
echo -e "${GREEN}.help .weather .weather2 .ip .device .joke .quote .hackmode .matrix .music .playlist .update"
echo -e ".ai .ai2 .ai3 .summarize .rewrite .translate .translate2"
echo -e ".scanpkg .status .lookup .pass .hash .banner .speed"
echo -e ".8ball .love .fact .battery .vibrate .torch .notify .geo .usersearch .qr"
echo -e ".tiktok .youtube .wiki .ytmp4 .ytmp3 .tiktokdl .instadl .fbdl"
echo -e ".ram .cpu .storage .ps .kill .wifi"
echo -e ".horoscope .roast .pickup .truth .dare .insult .compliment"
echo -e ".lyrics .movie .news .anime .currency .dict${NC}"
echo ""

footer

# -----------------------------
# Command Handler
# -----------------------------
while true; do
    echo ""
    read -p "👉 Enter command: " cmd args

    case $cmd in
        .help)
            echo -e "${GREEN}📜 Commands:"
            echo ".help"
            echo ".weather  | .weather2 [city] | .ip | .device"
            echo ".joke     | .quote    | .hackmode | .matrix"
            echo ".music    | .playlist | .update"
            echo ".ai       | .ai2      | .ai3"
            echo ".summarize text | .rewrite text"
            echo ".translate from to text | .translate2 lang text"
            echo ".scanpkg  | .status url | .lookup ip"
            echo ".pass len | .hash text | .banner text"
            echo ".speed    | .8ball    | .love a b | .fact"
            echo ".battery  | .vibrate  | .torch on/off | .notify msg"
            echo ".geo      | .usersearch name | .qr text"
            echo ".tiktok q | .youtube q | .wiki q"
            echo ".ytmp4 url | .ytmp3 url | .tiktokdl url | .instadl url | .fbdl url"
            echo ".ram | .cpu | .storage | .ps | .kill PID | .wifi"
            echo ".horoscope sign | .roast [name] | .pickup"
            echo ".truth | .dare | .insult | .compliment"
            echo ".lyrics q | .movie q | .news [q] | .anime q | .currency FROM TO AMOUNT | .dict word"
            echo ".exit${NC}"
        ;;
        .weather)      weather ;;
        .weather2)     weather2 $args ;;
        .ip)           show_ip ;;
        .device)       device_info ;;
        .joke)         joke ;;
        .quote)        quote ;;
        .hackmode)     hackmode ;;
        .matrix)       matrix ;;
        .music)        music ;;
        .playlist)     playlist ;;
        .update)       update_script ;;

        .ai)           ai_chat $args ;;
        .ai2)          ai2 $args ;;
        .ai3)          ai3 $args ;;
        .summarize)    summarize_text $args ;;
        .rewrite)      rewrite_text $args ;;
        .translate)    translate_text $args ;;
        .translate2)   translate2 $args ;;

        .scanpkg)      scanpkg $args ;;
        .status)       status_check $args ;;
        .lookup)       ip_lookup $args ;;
        .pass)         gen_pass $args ;;
        .hash)         hash_gen $args ;;
        .banner)       banner $args ;;
        .speed)        speed_test ;;

        .8ball)        eight_ball ;;
        .love)         love_calc $args ;;
        .fact)         fact ;;

        .battery)      battery ;;
        .vibrate)      vibrate ;;
        .torch)        torch $args ;;
        .notify)       notify $args ;;
        .geo)          geo_info ;;
        .usersearch)   usersearch $args ;;
        .qr)           qr_gen $args ;;

        .tiktok)       tiktok_photo $args ;;
        .youtube)      youtube_search $args ;;
        .wiki)         wiki_search $args ;;
        .ytmp4)        ytmp4 $args ;;
        .ytmp3)        ytmp3 $args ;;
        .tiktokdl)     tiktokdl $args ;;
        .instadl)      instadl $args ;;
        .fbdl)         fbdl $args ;;

        .ram)          ram_info ;;
        .cpu)          cpu_info ;;
        .storage)      storage_info ;;
        .ps)           process_list ;;
        .kill)         kill_process $args ;;
        .wifi)         wifi_info ;;

        .horoscope)    horoscope $args ;;
        .roast)        roast $args ;;
        .pickup)       pickup ;;
        .truth)        truth_cmd ;;
        .dare)         dare_cmd ;;
        .insult)       insult ;;
        .compliment)   compliment ;;

        .lyrics)       lyrics_search $args ;;
        .movie)        movie_search $args ;;
        .news)         news_search $args ;;
        .anime)        anime_search $args ;;
        .currency)     currency_convert $args ;;
        .dict)         dictionary_lookup $args ;;

        .exit)
            echo -e "${RED}👋 Exiting... Stay Broken, Stay Royal.${NC}"
            exit 0
        ;;
        *)
            echo -e "${RED}❌ Unknown command. Type .help${NC}"
        ;;
    esac
done
