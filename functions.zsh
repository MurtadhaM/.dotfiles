#!/usr/bin/env zsh
# CUSTOM FUNCTION 

# FUNCTION TO INSTALL TSHARK (Debian-based systems)
install_tshark() {
    echo "Installing tshark..."
    sudo apt-get install tshark -y

}

# FUNCTION TO INSTALL net-tools (Debian-based systems)
install_net_tools() {
    echo "Installing net-tools..."
    sudo apt-get install net-tools -y

}

# FUNCTION TO INSTALL nmap (Debian-based systems)
install_nmap() {
    echo "Installing nmap..."
    sudo apt-get install nmap -y

}

# FUNCTION TO INSTALL htop (Debian-based systems)
install_htop() {
    echo "Installing htop..."
    sudo apt-get install htop -y

}



