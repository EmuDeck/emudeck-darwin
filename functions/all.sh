#!/bin/bash
appleChip=$(uname -m)
if [ $(uname) != "Linux" ]; then
    system="darwin"
    if [ $appleChip = 'arm64' ]; then
        PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
    else
        PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    fi
fi

if [[ "$EMUDECKGIT" == "" ]]; then
    EMUDECKGIT="$HOME/.config/EmuDeck/backend"
fi

#load helpers first, just in case
source "$EMUDECKGIT"/functions/helperFunctions.sh



SETTINGSFILE="$HOME/emudeck/settings.sh"
if [ -f "$SETTINGSFILE" ]; then
    # shellcheck source=./settings.sh
    source "$SETTINGSFILE"
fi

if [ "$system" != "darwin" ]; then
    export PATH="${EMUDECKGIT}/tools/binaries/:$PATH"
    chmod +x "${EMUDECKGIT}/tools/binaries/xmlstarlet"
fi

source "$EMUDECKGIT"/functions/checkBIOS.sh
source "$EMUDECKGIT"/functions/checkInstalledEmus.sh
#source "$EMUDECKGIT"/functions/cloudServicesManager.sh
source "$EMUDECKGIT"/functions/configEmuAI.sh
source "$EMUDECKGIT"/functions/configEmuFP.sh
source "$EMUDECKGIT"/functions/createDesktopIcons.sh
source "$EMUDECKGIT"/functions/installEmuFP.sh
source "$EMUDECKGIT"/functions/uninstallEmuFP.sh
source "$EMUDECKGIT"/functions/setMSG.sh
source "$EMUDECKGIT"/functions/emuDeckPrereqs.sh
source "$EMUDECKGIT"/functions/installEmuAI.sh
source "$EMUDECKGIT"/functions/uninstallEmuAI.sh
source "$EMUDECKGIT"/functions/installEmuBI.sh
source "$EMUDECKGIT"/functions/uninstallGeneric.sh
source "$EMUDECKGIT"/functions/installToolAI.sh
source "$EMUDECKGIT"/functions/migrateAndLinkConfig.sh
source "$EMUDECKGIT"/functions/nonDeck.sh
source "$EMUDECKGIT"/functions/dialogBox.sh
source "$EMUDECKGIT"/functions/updateEmuFP.sh
source "$EMUDECKGIT"/functions/createFolders.sh
source "$EMUDECKGIT"/functions/runSRM.sh
source "$EMUDECKGIT"/functions/appImageInit.sh
source "$EMUDECKGIT"/functions/autofix.sh
source "$EMUDECKGIT"/functions/generateGameLists.sh
source "$EMUDECKGIT"/functions/jsonToBashVars.sh

#toolScripts
source "$EMUDECKGIT"/functions/ToolScripts/emuDeckESDE.sh
source "$EMUDECKGIT"/functions/ToolScripts/emuDeckPegasus.sh
source "$EMUDECKGIT"/functions/ToolScripts/emuDeckSRM.sh
source "$EMUDECKGIT"/functions/ToolScripts/emuDeckCloudSync.sh
source "$EMUDECKGIT"/functions/ToolScripts/emuDeckNetPlay.sh


#emuscripts
source "$EMUDECKGIT"/functions/EmuScripts/emuDeckRetroArch.sh



#remoteplayclientscripts
source "$EMUDECKGIT"/functions/RemotePlayClientScripts/remotePlayChiaki.sh
source "$EMUDECKGIT"/functions/RemotePlayClientScripts/remotePlayChiaking.sh
source "$EMUDECKGIT"/functions/RemotePlayClientScripts/remotePlayGreenlight.sh
source "$EMUDECKGIT"/functions/RemotePlayClientScripts/remotePlayMoonlight.sh
source "$EMUDECKGIT"/functions/RemotePlayClientScripts/remotePlayParsec.sh
source "$EMUDECKGIT"/functions/RemotePlayClientScripts/remotePlayShadow.sh
source "$EMUDECKGIT"/functions/RemotePlayClientScripts/remotePlaySteamLink.sh


source "$EMUDECKGIT"/functions/cloudSyncHealth.sh

