![Signed](https://img.shields.io/badge/Signed-Yes-00AA00)
![Number of downloads](https://img.shields.io/badge/dynamic/json?query=downloads&url=https%3A%2F%2Fopenplanet.dev%2Fapi%2Fplugin%2F473&label=Downloads&color=purple)
![Version](https://img.shields.io/badge/dynamic/json?query=version&url=https%3A%2F%2Fopenplanet.dev%2Fapi%2Fplugin%2F473&label=Version&color=red)
![Game Trackmania](https://img.shields.io/badge/Game-Trackmania-blue)

# Mod Disabler

There is an in-game setting to disable Texture Mod downloads, but this doesn't do anything if a mod is already loaded. This plugin lets you disable mods altogether if you're unhappy with them, for instance when you play COTD, get used to the map during the qualifier, then suddenly in rounds you have to play with a mod which makes the map look totally different.

This plugin works simply by creating a folder called `C:/Users/USERNAME/Documents/Trackmania/Skins/Stadium/ModWork`. When this folder exists, the game thinks you're creating your own mod, so it disables the loading of any others. This plugin also handles the case where you already have this folder, and will rename it to "ModWork_Backup" so your contents are not lost.

## Regarding other plugins

### Skid Marks Manager
SMM uses the ModWork folder to apply skids, and therefore disables texture mods on its own. If you use SMM, using Mod Disabler adds the benefit of preserving the contents of the ModWork folder (SMM deletes everything when removing all custom skids).

### Modless Skids
Since MS does not use the ModWork folder, those skids will be unaffected by Mod Disabler.

### Better Texture Mod
BTM can be set to use ModWork or not, therefore it may or may not be affected by Mod Disabler.

![image](images/mod-disabler.png)
