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

