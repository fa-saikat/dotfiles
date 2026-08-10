#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'^[[D
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}     Hardware Driver Identification     ${NC}"
echo -e "${BLUE}========================================${NC}"

# Check for required tools
for tool in ethtool lspci lsusb; do
    if ! command -v $tool &> /dev/null; then
        echo -e "${RED}Error: Required tool '$tool' is not installed.${NC}"
        exit 1
    fi
done

echo ""

# --- NETWORK (Wired & Wireless) ---
echo -e "${GREEN}[*] Network Interfaces (Wired/Wireless)${NC}"
if ls /sys/class/net/* 1> /dev/null 2>&1; then
    for iface in /sys/class/net/*; do
        # Skip loopback
        if [[ "$(basename "$iface")" == "lo" ]]; then continue; fi
        
        driver=$(ethtool -i "$(basename "$iface")" 2>/dev/null | awk '/driver:/{print $2}')
        
        if [ ! -z "$driver" ]; then
            echo "  Interface: $(basename "$iface")"
            echo "    Driver  : $driver"
        else
            echo "  Interface: $(basename "$iface")"
            echo "    Driver  : (Unknown/Failed to retrieve)"
        fi
    done
else
    echo "  No network interfaces found."
fi
echo ""

# --- GPU ---
echo -e "${YELLOW}[*] Graphics (GPU)${NC}"
# Using lspci to find VGA controllers or 3D controllers and parsing the kernel driver
lspci -k | grep -A 3 -E "(VGA|3D)" | while read line; do
    if [[ "$line" == *"Kernel driver in use:"* ]]; then
        driver=$(echo "$line" | awk '{print $NF}')
        echo "  Driver: $driver"
    fi
done
echo ""

# --- AUDIO ---
echo -e "${YELLOW}[*] Audio${NC}"
lspci -k | grep -A 3 -i "audio" | while read line; do
    if [[ "$line" == *"Kernel driver in use:"* ]]; then
        driver=$(echo "$line" | awk '{print $NF}')
        echo "  Device Driver: $driver"
    fi
done
echo ""

# --- BLUETOOTH ---
echo -e "${YELLOW}[*] Bluetooth${NC}"
# Most Bluetooth adapters are USB or PCI devices. 
# We search for the string "Bluetooth" and check the driver.
found_bt=0

# Check PCI devices
lspci -k | grep -B 1 -A 3 "Bluetooth" | while read line; do
    if [[ "$line" == *"Kernel driver in use:"* ]]; then
        driver=$(echo "$line" | awk '{print $NF}')
        echo "  PCI Device Driver: $driver"
        found_bt=1
    fi
done

# Check USB devices
lsusb -v | grep -B 10 -A 2 "Bluetooth" | while read line; do
    # This is a bit noisy, so we rely mostly on checking modules or lspci. 
    # However, a simple way to list the module handling BT usually involves 'hciconfig' 
    # or checking loaded modules.
    :
done

# Fallback: Check active modules
echo "  Active Bluetooth Modules:"
lsmod | grep -E "^bt|^rfcomm|^bluetooth" | awk '{print "    " $1}'

echo ""
echo -e "${BLUE}========================================${NC}"
echo "Finished."
