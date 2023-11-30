

# Github Copilot CLI

## Install

```bash
# OS Check
uname -a
# Download
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get update
    apt-get install nodejs -y 
    apt-get install npm -y

elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install node
    brew install npm
elif [[ "$OSTYPE" == "win32" ]]; then
    echo "OS not supported"
else
    echo "Unknown OS"
    exit 1
fi

# Check if node is installed
npm install -g @github-copilot/cli
# AUTHENTICATE
github-copilot auth
# SETUP ALIAS
echo 'eval "$(github-copilot-cli alias -- "$0")"' >> ~/.zshrc

## USAGE
# github-copilot-cli --help
# Example: wts show date and time
wts -h
```
