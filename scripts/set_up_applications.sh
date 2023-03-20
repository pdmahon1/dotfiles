#! /bin/zsh

# this script ensures a baseline number of expected applications are
# installed
# use this script to check for the existence of some programs
# if they don't exist, download them

sudo apt update -y

# sets up Ubuntu's restricted extras plugins
sudo add-apt-repository multiverse

# sets up the Kazam screen recording tool
sudo add-apt-repository ppa:kazam-team/stable-series


failed_to_install=""
programs=(
	"build-essential" 
	"ubuntu-restricted-extras" 
 	"aptitude"
	"curl"
	"file"
	"flatpak"
	"git"
	"gnome-software-plugin-flatpak"
	"gnome-tweak-tool"
	"kazam"
 	"nmap" 
	"proxcps"
	"xsel"
	"zsh"
 )

package_installer() {
	if [[ ! -f /bin/$1 ]] ; then
		sudo apt-get install $1 -y > /dev/null 2>&1
		
		# package doesn't exist in apt-get; use apt instead
		if [[ $? -gt 0 ]]; then
			sudo apt install $1 -y > /dev/null 2>&1
		fi

		# package doesn't exist in either; add name to list of falures
		if [[ $? -gt 0 ]]; then
			failed_to_install="$failed_to_install:$1"
		fi
	fi
}

for program in ${programs[@]} ; do
	package_installer $program
done

echo "The following applications failed to install:"
for app in $(echo $failed_to_install | tr ":" "\n") ; do
	echo "    $app"
done



## oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## flatpak
# sudo apt install flatpak -y
# sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


# setup Homebrew
./brew_installer.sh
brew upgrade

# final housekeeping

sudo apt update && sudo apt upgrade
sudo apt autoremove -y

sudo apt-get update && sudo apt-get upgrade
sudo apt-get autoremove -y
