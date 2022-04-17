#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'
# echo -e "${RED} ERRORMESAGE ${NC}"

echo

if [ ! -n "$dctoken" ]; then
	echo -e "${RED} Nie znaleziono zmiennej \$dctoken${NC}"
	echo Ustaw zmienną środowiskową dctoken na token za pomocą którego ma zostać wysłana wiadomość 
	echo 'Dla konta bota użyj "Bot XXXXXXXXX.XXX.XXXXxXXxXXX" a dla zwykłych użytkowników pomiń "Bot "'
	echo Jeśli używasz konta bota upewnij się że bot ma uprawnienia do widzenia kanałów i wysyłania wiadomość.
	echo Konta botów nie działają dla wiadomości prywatnych. #TODO Zrobić by działały przez pobranie ID usera i utwożenie z nim DM 
	echo 

fi

if [ -f ~/.local/bin/sendtodiscord ]; then
	echo -e "${RED} Plik ~/.local/bin/sendtodiscord istnieje ${NC}"
	echo -e "${RED} Uwaga! Zostanie on nadpisany ${NC}"
	echo
fi

################################################

if [ ! -d ~/.config/BetterDiscord/plugins/ ]; then
	echo -e "${RED} Nie znaleziono katalogu ~/.config/BetterDiscord/plugins/ ${NC}"
	echo Prawdopodobnie oznacza to że nie masz zainstalowanego BetterDiscord.
	echo Instrukcję znajdziesz tutaj 'https://github.com/BetterDiscord/BetterDiscord/blob/main/README.md#installation'
	echo 
	echo Wtyczka nie zostanie zainstalowana ale skrypt tak, przy uruchomieniu skryptu wtyczka zostanie zainstalowana
else
	echo Pobieranie wtyczki...
	curl https://raw.githubusercontent.com/koliwbr/DiscordFileFromCLI/master/FileFromCLI.plugin.js \
	-o ~/.config/BetterDiscord/plugins/FileFromCLI.plugin.js && echo Pobrano wtyczkę. || ( echo -e "${RED} Błąd pobierania wtyczki, przerywanie ${NC}";exit 1 )
fi


echo Pobieranie skryptu...
curl https://raw.githubusercontent.com/koliwbr/DiscordFileFromCLI/master/sendtodiscord.sh \
-o ~/.local/bin/sendtodiscord && echo Pobrano skrypt. || ( echo -e "${RED} Błąd pobierania skryptu, przerywanie ${NC}";exit 1 )

echo

if [ -n "$dctoken" ]; then
	echo -e "${GREEN}  Zainstalowno poprawne!${NC}"
else
	echo -e "${YELLOW}  Zainstalowno ale brak tokenu, bez niego skrypt nie zadziała!${NC}"
fi
echo
echo -e "${GREEN}Użyj ${BLUE}sendtodiscord NAZWAPLIKU${GREEN} aby uruchomić skrypt. Aha i nie zapomnij dać gwiazdki na GitHub'ie
\033[1m\033[4mhttps://github.com/koliwbr/DiscordFileFromCLI\033[0m\033[0;34m :-) ${NC}"
