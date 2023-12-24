# Mod Disabler

There is an in-game setting to disable Texture Mod downloads, but this doesn't do anything if a mod is already loaded. This plugin lets you disable mods altogether if you're unhappy with any that have loaded, for instance when you play COTD, get used to the map during the qualifier, then suddenly in rounds you have to play with a mod.

This plugin works simply by creating a folder called, "C:/Users/USERNAME/Documents/Trackmania/Skins/Stadium/ModWork". When this folder exists, the game thinks you're creating your own mod, so it disables the loading of any others. This plugin also handles the case where you already have this folder, and will rename it to "ModWork_Backup" so your contents are not lost.