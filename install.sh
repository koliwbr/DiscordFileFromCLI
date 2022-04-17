#!/bin/bash

if [ ! -n "$dctoken" ]; then
	echo Ustaw zmienną środowiskową dctoken na token za pomocą którego ma zostać wysłana wiadomość 
	echo 'Dla konta bota użyj "Bot XXXXXXXXXXXXXXXXXXXXXXXX.XXXXXX.XXXXXXXXXXXXXXXXXXXXXXXXXXX" a dla zwykłych użytkowników pomiń "Bot "'
	echo Jeśli używasz konta bota upewnij się że bot ma uprawnienia do widzenia kanałów i wysyłania wiadomość.
	echo Konta botów nie działają dla wiadomości prywatnych. #TODO Zrobić by działały przez pobranie ID usera i utwożenie z nim DM 
fi

if [ -f ~/.local/bin/sendtodiscord ]; then
	echo Plik ~/.local/bin/sendtodiscord istnieje
	echo Uwaga! Zostanie on nadpisany
fi

################################################

if [ ! -d ~/.config/BetterDiscord/plugins/ ]; then
	echo Nie znaleźono katalogu ~/.config/BetterDiscord/plugins/ 
	echo Prawdopodobnie oznacza to że nie masz zainstalowanego BetterDiscord.
	echo Instrukcję znajdziesz tutaj 'https://github.com/BetterDiscord/BetterDiscord/blob/main/README.md#installation'
	exit 1
fi


echo Pobieranie wtyczki...
curl https://raw.githubusercontent.com/koliwbr/DiscordFileFromCLI/master/FileFromCLI.plugin.js \
-o ~/.config/BetterDiscord/plugins/FileFromCLI.plugin.js && echo Pobrano wtyczkę. || exit 1


echo Pobieranie skryptu...
curl https://raw.githubusercontent.com/koliwbr/DiscordFileFromCLI/master/sendtodiscord.sh \
-o ~/.local/bin/sendtodiscord && echo Pobrano skrypt. || exit 1



