# DiscordFileFromCLI
Skrypt powłoki umożliwiający wysyłanie plików na aktualnie wybrany kanał w aplikacji discorda.

Aktualnie wspierany jest tylko Linux i stabilna gałąź aplikacji discorda. 

# Instalacja
Jest skrypt instalacyjny, użycie tego polecenia powinno zainstalować skrypt oraz plugin.
```bash
bash -c "$(curl https://raw.githubusercontent.com/koliwbr/DiscordFileFromCLI/master/install.sh -s)" 
```
W razie problemów ręczna instalacja polega na dodaniu [sendtodiscord.sh](https://github.com/koliwbr/DiscordFileFromCLI/blob/master/sendtodiscord.sh) do PATH i zainstalowniu [FileFromCLI.plugin.js](https://github.com/koliwbr/DiscordFileFromCLI/blob/master/FileFromCLI.plugin.js) jako wtyczki do BeterDiscord
