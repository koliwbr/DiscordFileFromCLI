/**
 * @name FileFromCLI
 * @version 1.0.0
 * @description Helper to bash script Send files from CLI
 * @author Koliw
 * @website https://github.com/koliwbr/DiscordFileFromCLI
 * @source https://raw.githubusercontent.com/koliwbr/DiscordFileFromCLI/master/FileFromCLI.plugin.js
 * @authorId 788020792566611971
*/

module.exports = class FileFromCLI {
    start() {
        BdApi.saveData('FileFromCLI', 'channelID', document.location.href.split('/')[5])
    }
    stop(){}
    onSwitch(){
        BdApi.saveData('FileFromCLI', 'channelID', document.location.href.split('/')[5])
        
    }
}
