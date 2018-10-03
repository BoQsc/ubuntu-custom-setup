// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions dropped in to a system
// location, or those owned by the application
lockPref("extensions.autoDisableScopes", 0);
pref("extensions.autoDisableScopes", 0);

// Don't display the one-off addon selection dialog when
// upgrading from a version of Firefox older than 8.0
pref("extensions.shownSelectionUI", true);


defaultPref("browser.tabs.drawInTitlebar", true);
pref("browser.tabs.drawInTitlebar", true);
lockPref("browser.tabs.drawInTitlebar", true);
