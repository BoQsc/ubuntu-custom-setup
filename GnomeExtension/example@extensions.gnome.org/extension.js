// Gnome Seed - namespace and modules importer
// https://wiki.gnome.org/Projects/Seed
// https://github.com/GNOME/seed
// https://developer.gnome.org/seed/stable/seed-importer.html
// https://gi.readthedocs.io/en/latest/#gobject-introspection
const St = imports.gi.St; // GObject-Introspection namespace/st
const Main = imports.ui.main; // https://gitlab.gnome.org/GNOME/gnome-shell/tree/master/js/ui/main.js
const Tweener = imports.ui.tweener; // https://gitlab.gnome.org/GNOME/gnome-shell/tree/master/js/ui/tweener.js



//Gtk is the basic part of any GNOME application, which lets you create windows and widgets and tie them together.
//GLib is a helper library, which lets us do things like tell GNOME where the hellognome.html file we created is.
//And Webkit is a web rendering engine, which we'll use to basically create a browser window to open our HTML file with.
// https://developer.gnome.org/gnome-devel-demos/stable/hellognome.js.html.en
/*
const GLib = imports.gi.GLib;
const Gtk = imports.gi.Gtk;
const Webkit = imports.gi.WebKit2;
*/

let text, button;

function _hideHello() {
    Main.uiGroup.remove_actor(text);
    text = null;
}

function _showHello() {
    if (!text) {
        text = new St.Label({ style_class: 'helloworld-label', text: "Hello, world!" });
        Main.uiGroup.add_actor(text);
    }

    text.opacity = 255;

    let monitor = Main.layoutManager.primaryMonitor;

    text.set_position(monitor.x + Math.floor(monitor.width / 2 - text.width / 2),
                      monitor.y + Math.floor(monitor.height / 2 - text.height / 2));

    Tweener.addTween(text,
                     { opacity: 0,
                       time: 2,
                       transition: 'easeOutQuad',
                       onComplete: _hideHello });
}

function init() {
    button = new St.Bin({ style_class: 'panel-button',
                          reactive: true,
                          can_focus: true,
                          x_fill: true,
                          y_fill: false,
                          track_hover: true });
    let icon = new St.Icon({ icon_name: 'system-run-symbolic',
                             style_class: 'system-status-icon' });

    button.set_child(icon);
    button.connect('button-press-event', _showHello);
}

function enable() {
    Main.panel._rightBox.insert_child_at_index(button, 0);
}

function disable() {
    Main.panel._rightBox.remove_child(button);
}
