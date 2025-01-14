#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'


set -u # Exit on undefined variable
trap 'echo -e "${RED}An error occurred. Exiting...${NC}"; exit 1' ERR

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to detect Linux distribution
get_distribution() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$NAME"
    elif [ -f /etc/redhat-release ]; then
        cat /etc/redhat-release
    else
        uname -s
    fi
}

# Function to print section headers
print_header() {
    echo -e "\n${BOLD}${BLUE}====== $1 ======${NC}\n"
}

# Function to print ASCII art based on distribution
print_os_logo() {
    local distro=$(get_distribution)
    echo -e "${YELLOW}"
    case $distro in
        *"Ubuntu"*)
    echo "                .:-=++******++=-:.                "
    echo "            .-+*##################*+-.            "
    echo "         .=*##########################*=.         "
    echo "       :+######################*=-=*#####+:       "
    echo "     .+#######################-     =######+.     "
    echo "    -##############+=-::::::-#.     :########-    "
    echo "   +###########*=**.         :*-...-*#########+   "
    echo "  +##########*=   +*: .::::.   :---=*##########+  "
    echo " -##########*.     *#########+-     .*##########- "
    echo ".##########+     =*############*=     +##########."
    echo "-######***#:    +################+    .##########-"
    echo "+####-    :*:  -##################-    +#########+  "
    echo "*###+      =+  =##################******#########*"
    echo "+####-    :*:  -##################-    +#########+  "
    echo "-######***#:    +################+    .##########-"
    echo ".##########+     =*############*=     +##########."
    echo " -##########*.     *#########+-     .*##########- "
    echo "  +##########*=   +*: .::::.   :---=*##########+  "
    echo "   +###########*=**.         :*-...-*#########+   "
    echo "    -##############+=-::::::-#.     :########-    "
    echo "     .+#######################-     =######+.     "
    echo "       :+######################*=-=*#####+:       "
    echo "         .=*##########################*=.         "
    echo "            .-+*##################*+-.            "
    echo "                .:-=++******++=-:.                " 

           ;;
        *"CentOS"*|*"Red Hat"*|*"Rocky"*)

    echo -e "\e[38;5;236m                        ::                        \e[0m"
    echo -e "\e[38;5;238m                      :====:                      \e[0m"
    echo -e "\e[38;5;240m                    .-======-.                    \e[0m"
    echo -e "\e[38;5;242m        .:::::::: .:::.:==:-+++-.=+++++++:        \e[0m"
    echo -e "\e[38;5;244m        .=====-::-====::==:=####*--*#####-        \e[0m"
    echo -e "\e[38;5;246m        .=====:.-=====::==:=#####*--#####-        \e[0m"
    echo -e "\e[38;5;248m        .=-:.:--::-===::==:=###*--**---*#-        \e[0m"
    echo -e "\e[38;5;250m        .::-=-::--::-=::==:=#*--**--*#*--:        \e[0m"
    echo -e "\e[38;5;252m         -=====-::--::::==:---**--*#####*:        \e[0m"
    echo -e "\e[38;5;254m      -+.========-::--..==.:**--*########-+-      \e[0m"
    echo -e "\e[38;5;256m    -*#*:-----------:.     .::===========-*#*-    \e[0m"
    echo -e "\e[38;5;258m   *#################+      *#################*   \e[0m"
    echo -e "\e[38;5;256m    -*#*:==========-::.    ..:-----------:*#*-    \e[0m"
    echo -e "\e[38;5;254m      -+:########*--##-.--..==::=========:+-      \e[0m"
    echo -e "\e[38;5;252m        .*#####*--##=-=:==::::==::=======.        \e[0m"
    echo -e "\e[38;5;250m        :--*#*--##=-*#+:==::==::==::===::.        \e[0m"
    echo -e "\e[38;5;248m        :##---##=-*###+:==::====::==:::==:        \e[0m"
    echo -e "\e[38;5;246m        :#####=-*#####+:==::======.:=====:        \e[0m"
    echo -e "\e[38;5;244m        :#####*-=#####+:==::=====::======:        \e[0m"
    echo -e "\e[38;5;242m        .+++++++=.-+++-:==:.---:.:-------.        \e[0m"
    echo -e "\e[38;5;240m                    .---==---.                    \e[0m"
    echo -e "\e[38;5;238m                      .-==-.                      \e[0m"
    echo -e "\e[38;5;236m                        ..                        \e[0m"
    echo -e "\e[0m"
 
           ;;
        *)

    cat << "EOF"
                    =#%@@@%#+:                    
                  :@@@@@@@@@@@%:                  
                  @@@@@@@@@@@@@@:                 
                 -@@%@@@@@##@@@@#                 
                 -@:=:@@#.+=:@@@@                 
                 :%=@+**=+@@.%@@@                 
                 .@++=------=@@@@:                
                 .@+=----==++@@@@#                
                 :@+-++++=-:.+@@@@*               
                -@* ..::..    =@@@@#.             
              :#@*             *@@@@@=            
             +@@@:.         ...:%@@@@@%:          
            =@@@-             ...#@@@@@@:         
           .@@@:                  @@@@@@%         
           #@@-                   +@@@@@@=        
         .%@@%                    =@@@@@@#        
         *@@@*                    =@@@@@@%        
         -+=*%-                 .:*@@@@@@=        
     :::-=---=#%+.              --*@@@@%+-        
    -=---------*@@#:            --=+**+=--:       
    :+----------+@@#           =+=-===------:.    
    -+-----------=-         :+@@*=----------=-    
    +==----------=+%#++++*%@@@@@+=------==-:.     
    .:--=+++=====+*@%####*####%@*=======:         
           :-=*#%%*.           .****+=.           
EOF

            ;;
    esac
    echo -e "${NC}"
}

# Function to get CPU information
get_cpu_info() {
    print_header "CPU Information"
    if [ -f /proc/cpuinfo ]; then
        echo -e "${CYAN}Model:${NC} $(grep "model name" /proc/cpuinfo | head -n1 | cut -d: -f2 | sed 's/^[ \t]*//')"
        echo -e "${CYAN}Cores:${NC} $(nproc 2>/dev/null || grep -c ^processor /proc/cpuinfo)"
    else
        echo -e "${CYAN}CPU Info:${NC} $(sysctl -n machdep.cpu.brand_string 2>/dev/null || echo "Not available")"
    fi
    
    if command_exists mpstat; then
        echo -e "${CYAN}CPU Usage:${NC} $(mpstat 1 1 | tail -n 1 | awk '{print 100-$NF"%"}')"
    elif command_exists top; then
        echo -e "${CYAN}CPU Usage:${NC} $(top -bn1 | grep "Cpu(s)" | awk '{print $2}')%"
    else
        echo -e "${CYAN}CPU Usage:${NC} Not available"
    fi
}

# Function to get memory information
get_memory_info() {
    print_header "Memory Information"
    if command_exists free; then
	echo -e "${MAGENTA}Total Memory\t: $(free -h --giga | awk '/Mem:/ { print " ", $2;}')"
	echo -e "${MAGENTA}Used Memory\t: $(free -h --giga | awk '/Mem:/ { print " ", $3;}')"
	echo -e "${MAGENTA}Free Memory\t: $(free -h --giga | awk '/Mem:/ { print " ", $4 }')"
    else
        echo -e "${MAGENTA}Total Memory:${NC} $(awk '/MemTotal/ {print $2/1024/1024 " GB"}' /proc/meminfo)"
        echo -e "${MAGENTA}Free Memory:${NC} $(awk '/MemFree/ {print $2/1024/1024 " GB"}' /proc/meminfo)"
    fi
}

# Function to get disk information
get_disk_info() {
    print_header "Disk Information"
    if command_exists df; then
        echo -e "${GREEN}$(df -h)${NC}"
    else
        echo -e "${GREEN}Disk information not available${NC}"
    fi
}

# Function to get network information
get_network_info() {
    print_header "Network Information"
    echo -e "${CYAN}Hostname:${NC} $(hostname)"
    
    # Try different methods to get IP address
    if command_exists ip; then
        echo -e "${CYAN}IP Address:${NC} $(ip addr show | grep "inet " | awk -F" " '{print ""$2}' | cut -d/ -f1 | sed -n '2p')"
	echo -e "${CYAN}MAC Address:${NC} $(ip addr show | awk '/link\/ether/ { print "",$2;}' | sed -n '1p')"
    elif command_exists ifconfig; then
        echo -e "${CYAN}IP Address:${NC} $(ifconfig | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}')"
    else
        echo -e "${CYAN}IP Address:${NC} Not available"
    fi
    
    echo -e "\n${CYAN}Open Ports:${NC}"
    if command_exists ss; then
#        ss -tuln | grep LISTEN
	sudo ss -tuln 2>/dev/null | awk 'NR>1 {print $5 " - " $1 }' | sed 's/.*://'
#	netstat -tuln 2>/dev/null | awk 'NR>2 {print $4 " - " $1}' | sed 's/.*://'
    elif command_exists netstat; then
#        netstat -tuln | grep LISTEN
	netstat -tuln 2>/dev/null | awk 'NR>2 {print $4 " - " $1}' | sed 's/.*://'
    else
        echo "No tool available to check open ports"
    fi
}

# Function to get system information
get_system_info() {
    print_header "System Information"
    echo -e "${YELLOW}Distribution:${NC} $(get_distribution)"
    echo -e "${YELLOW}Kernel:${NC} $(uname -r)"
    echo -e "${YELLOW}Architecture:${NC} $(uname -m)"
    if command_exists uptime; then
        echo -e "${YELLOW}Uptime:${NC} $(uptime -p 2>/dev/null || uptime)"
    fi
}

# Function to get GPU information
get_gpu_info() {
    print_header "GPU Information"
    if command_exists lspci; then
        echo -e "${RED}$(lspci | grep -i 'vga\|3d\|2d')${NC}"
    elif [ -d "/proc/driver/nvidia" ]; then
        echo -e "${RED}NVIDIA GPU detected${NC}"
    elif [ -d "/sys/class/drm" ]; then
        echo -e "${RED}$(ls -1 /sys/class/drm/card*)${NC}"
    else
        echo -e "${RED}GPU information not available${NC}"
    fi
}

# Check for root privileges
check_root() {
    if [ "$(id -u)" -eq 0 ]; then
        echo -e "${GREEN}Running with root privileges - full system information will be available${NC}"
    else
        echo -e "${YELLOW}Note: Some information may be limited without root privileges${NC}"
    fi
}

show_sys_info() {
    cat << "EOF"
  _________              .___        _____       
 /   _____/__.__. ______ |   | _____/ ____\____  
 \_____  <   |  |/  ___/ |   |/    \   __\/  _ \ 
 /        \___  |\___ \  |   |   |  \  | (  <_> )
/_______  / ____/____  > |___|___|  /__|  \____/ 
        \/\/         \/           \/             
EOF
}


# Main execution
clear
check_root
show_sys_info
print_os_logo
get_system_info
get_cpu_info
get_memory_info
get_disk_info
get_network_info
get_gpu_info
