#! /bin/bash

token=$(printenv dctoken) #just work. Use: export dctoken=mfa.XXXXXXX.XXXXXX

if [ ! -e ~/.config/BetterDiscord/plugins/FileFromCLI.plugin.js ]; then
	echo Plik ~/.config/BetterDiscord/plugins/FileFromCLI.plugin.js nie istnieje. 
	exit 64
fi

if [ ! -e ~/.config/BetterDiscord/plugins/FileFromCLI.config.json ]; then
	echo Plik ~/.config/BetterDiscord/plugins/FileFromCLI.config.json nie istnieje. 
	exit 64
fi

channelid=$(cat ~/.config/BetterDiscord/plugins/FileFromCLI.config.json | jq .channelID -r)
channel=$(curl https://discord.com/api/v9/channels/$channelid -H 'authorization: '$token -s)
channeltype=$(echo $channel | jq .type -r)

if [[ "$channeltype" == "null" ]]; then
	echo Sprawdź poprawność tokenu, połączenia internetowego oraz statusu serwerów
	exit 3
fi

if [ ! -n "$1" ]; then
	echo Nie podano pliku do wysłania. Użyj $0 NAZWAPLIKU
	exit 1
fi

if [ ! -e "$1" ]; then
	echo Podany plik nie istnieje
	exit 2
fi

# Jak zapytać usera o kanał (jednocześnie dając info o tym jaki to typ kanału)
# 0, 5, 10, 11, 12 - "Wysłać na kanał #%"
# 1 - "Wysłać do @%"
# 3 - "Wysłać na grupę %"

if [[ "0" == "$channeltype" || "5" == $channeltype || "10" == $channeltype || "11" == $channeltype || "12" == $channeltype ]]; then
	echo -n Wysłać $1 na kanał \#$(echo $channel | jq .name -r)\? \[N/y\]\ ;fi

if [[ "1" == $channeltype ]]; then echo -n Wysłać $1 do \@$(echo $channel | jq .recipients[0].username -r)\? \[N/y\]\ ;fi
if [[ "3" == $channeltype ]]; then echo -n Wysłać $1 na grupie $(echo $channel | jq .name -r)\? \[N/y\]\ ;fi

read; if [ "$REPLY" = "y" ]; then
	curl -s -X POST -H 'Content-Type:multipart/form-data' --form 'file=@'$1 -H 'authorization: '$token https://discord.com/api/v9/channels/$channelid/messages | jq
else
	echo Anulowano
fi

# From https://discord.com/developers/docs/resources/channel#channel-object-channel-types
#  TYPE					ID	DESCRIPTION
#
# *	GUILD_TEXT				0	a text channel within a server
# *	DM						1	a direct message between users
# 	GUILD_VOICE				2	a voice channel within a server
# *	GROUP_DM				3	a direct message between multiple users
# 	GUILD_CATEGORY			4	an organizational category that contains up to 50 channels
# *	GUILD_NEWS				5	a channel that users can follow and crosspost into their own server
# *	GUILD_NEWS_THREAD		10	a temporary sub-channel within a GUILD_NEWS channel
# *	GUILD_PUBLIC_THREAD 	11	a temporary sub-channel within a GUILD_TEXT channel
# *	GUILD_PRIVATE_THREAD 	12	a temporary sub-channel within a GUILD_TEXT channel that is only viewable by those invited and those with the MANAGE_THREADS permission
# 	GUILD_STAGE_VOICE		13	a voice channel for hosting events with an audience
# 	GUILD_DIRECTORY			14	the channel in a hub containing the listed servers
# 	GUILD_FORUM 			15	(still in development) a channel that can only contain threads
# * - kanały na które można coś wysłać
