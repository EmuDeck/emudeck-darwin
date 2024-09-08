#!/bin/bash
configEmuFP(){

	local name=$1
	setMSG "Updating $name Config"
	rsync -avhpL --mkpath "$EMUDECKGIT/configs/${name}/" "$HOME/Library/Application Support/${name}/"

}
