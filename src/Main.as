// c 2023-12-24
// m 2025-02-22

bool modWorkContents = false;
bool modWorkExists = false;
string modWorkFolder = IO::FromUserGameFolder("Skins/Stadium/ModWork").Replace("\\", "/");
string modWorkFolderBackup = IO::FromUserGameFolder("Skins/Stadium/ModWork_Backup").Replace("\\", "/");
string title = "\\$F55" + Icons::Road + "\\$G Mod Disabler";

[Setting category="General" name="Enabled"]
bool S_Enabled = false;

void RenderMenu() {
    if (UI::MenuItem(title, "", S_Enabled))
        SetEnabled(!S_Enabled);
}

void SetEnabled(bool enable) {
    modWorkExists = IO::FolderExists(modWorkFolder);
    modWorkContents = false;
    if (modWorkExists)
        modWorkContents = IO::IndexFolder(modWorkFolder, false).Length > 0;

    if (enable) {
        if (modWorkContents) {
            Notify("ModWork exists already and has contents\n(mods should be disabled)");
        } else {
            if (IO::FolderExists(modWorkFolderBackup)) {
                if (modWorkExists) {
                    trace("Deleting ModWork (empty)...");
                    IO::DeleteFolder(modWorkFolder);
                }

                Notify("ModWork_Backup exists, renaming to ModWork...");
                IO::Move(modWorkFolderBackup, modWorkFolder);
            } else {
                trace("Creating ModWork...");
                IO::CreateFolder(modWorkFolder);
                IO::File file(modWorkFolder + "/mod_disabler.txt", IO::FileMode::Write);
                file.Close();
            }

            Notify("Mods disabled, exit and rejoin the map to apply changes!");
        }
    } else {
        if (modWorkContents) {
            Notify("ModWork has contents, renaming to ModWork_Backup...");

            if (IO::FolderExists(modWorkFolderBackup)) {
                if (IO::IndexFolder(modWorkFolderBackup, false).Length > 0) {
                    Notify("ModWork_Backup already exists and has contents, please check " + modWorkFolderBackup, vec4(0.9f, 0.3f, 0.1f, 0.5f), 10000);
                    return;
                } else {
                    trace("Deleting ModWork_Backup (empty)...");
                    IO::DeleteFolder(modWorkFolderBackup);
                }
            }

            IO::Move(modWorkFolder, modWorkFolderBackup);
        } else {
            if (modWorkExists) {
                trace("Deleting ModWork (empty)...");
                IO::DeleteFolder(modWorkFolder);
            }
        }

        Notify("Mods enabled, exit and rejoin the map to apply changes!");
    }

    S_Enabled = !S_Enabled;
}

void Notify(const string &in msg, vec4 color = vec4(0.9f, 0.6f, 0.1f, 0.5f), int time = 5000) {
    UI::ShowNotification(title, msg, color, time);
    trace(msg);
}
