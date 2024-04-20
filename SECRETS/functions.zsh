# Use id_rsa & id_rsa.pub from ~/.ssh to encrypt/decrypt text and files

# Usage:
# ssh_vault <command> <parameters> 
# Commands:
# - convert_private_key_to_public_key
# - encrypt_text <text>
# - decrypt_text <encrypted_text> <passphrase>
# - encrypt_file <file>
# - decrypt_file <file>

# Example:
# ssh_vault encrypt_text "Hello World"
# ssh_vault decrypt_text "encrypted text" "passphrase"

# Add the following to your .zshrc or .bashrc
# source ~/path/to/functions.zsh

function print_usage() {
    echo "Usage: ssh_vault <command> <parameters>"
    echo "Commands:"
    echo "- convert_private_key_to_public_key"
    echo "- encrypt_text <text>"
    echo "- decrypt_text <encrypted_text> <passphrase>"
    echo "- encrypt_file <file>"
    echo "- decrypt_file <file>"
}

function ssh_vault() {
    if [ -z "$1" ]; then
        print_usage
        return 1
    fi

    case $1 in
        convert_private_key_to_public_key)
            convert_private_key_to_public_key
            ;;
        encrypt_text)
            encrypt_text "$2"
            ;;
        decrypt_text)
            decrypt_text "$2" "$3"
            ;;
        encrypt_file)
            encrypt_file "$2"
            ;;
        decrypt_file)
            decrypt_file "$2" "$3" "$4"
            ;;
        *)
            print_usage
            return 1
            ;;
    esac
}



# Conver id_rsa to id_rsa.pub
function convert_private_key_to_public_key() {
    if [ -f ~/.ssh/id_rsa ]; then
        openssl rsa -in ~/.ssh/id_rsa -pubout -out ~/.ssh/id_rsa.pub
    else
        echo "Private key not found"
    fi
}

# Encrypt text
function encrypt_text() {    
# check if the input is empty
    if [ -z "$1" ]; then
        echo "Please provide a text to encrypt"
        return 1
    fi
    #check if the public key exists
    if [ ! -f ~/.ssh/id_rsa.pub ]; then
        echo "Public key not found"
        return 1
    fi
  #encrypt the text
  OUTPUT=`echo "$1" | openssl rsautl -encrypt -pubin -inkey ~/.ssh/id_rsa.pub | base64 -w 0`
  # print the encrypted text if the output is not empty
    if [ -n "$OUTPUT" ]; then
        echo "$OUTPUT"
    fi
}

# Decrypt text
function decrypt_text() {
    # parameters: encrypted text and passphrase (optional)
    encrypted_text=$1
    passphrase=$2

# check if the input is empty
    if [ -z "$1" ]; then
        echo "Please provide a text to decrypt "
        return 1
    fi
    
    #check if the private key exists
    if [ ! -f ~/.ssh/id_rsa ]; then
        echo "Private key not found"
        return 1
    fi
    #decrypt the text
    if [ -n "$passphrase" ]; then
    OUTPUT=`echo "$1" | base64 -d | openssl rsautl -decrypt -inkey ~/.ssh/id_rsa -passin pass:$passphrase`  2>/dev/null
    elif [ -z "$passphrase" ]; then
    OUTPUT=`echo "$1" | base64 -d | openssl rsautl -decrypt -inkey ~/.ssh/id_rsa` 2>/dev/null
    fi
    # print the decrypted text if the output is not empty
    if [ -n "$OUTPUT" ]; then
            echo "$OUTPUT"
    else
        echo "Decryption failed or incorrect passphrase"
    fi
}

# Encrypt file
function encrypt_file() {
    # check if the input is empty
    if [ -z "$1" ]; then
        echo "Please provide a file to encrypt"
        return 1
    fi
    # check if the file exists
    if [ ! -f "$1" ]; then
        echo "File not found"
        return 1
    fi
    # encrypt the file
  OUTPUT=`openssl rsautl -encrypt -pubin -inkey ~/.ssh/id_rsa.pub -in "$1" |base64 |tee "$1.enc" 2>/dev/null`
    # print the encrypted file if the output is not empty
        if [ -n "$OUTPUT" ]; then
            echo "File encrypted: $1.enc"
        else
            echo "Encryption failed"
        
        fi


}

# Decrypt file
function decrypt_file() {
    #PARAMETERS: encrypted file and passphrase (optional)
    PASSPHRASE=$2
    # check if the input is empty
    if [ -z "$1" ]; then
        echo "Please provide a file to decrypt"
        return 1
    fi
    # check if the file exists
    if [ ! -f "$1" ]; then
        echo "File not found"
        return 1
    fi
    # check if passphrase is provided
    if [ `echo $2 |wc --bytes ` -gt 2 ]; then
        PASSPHRASE=$2
        echo "Passphrase provided for decryption with value: $PASSPHRASE"
        OUTPUT=`base64 -d "$1" | openssl rsautl -decrypt -inkey ~/.ssh/id_rsa -passin pass:$PASSPHRASE |tee "${1%.enc}" `
    else
        OUTPUT=`base64 -d "$1" | openssl rsautl -decrypt -inkey ~/.ssh/id_rsa |tee "${1%.enc}" ` 
    fi
    # print the decrypted file if the output is not empty
    if [ -n "$OUTPUT" ]; then
        echo "File decrypted: ${1%.enc}"
    else
        
        echo "Decryption failed or incorrect passphrase"
    fi

}
