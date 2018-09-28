/**
 * The extension.js file is simply a JavaScript file; it must however have a function called init, 
 * which will be invoked at most once directly after your source JS file is loaded. 
 * You should modify all user interfaces in a separate enable function, and remove all custom functionality in a disable function.
 *
 * _______________________________________________________________________________________________________________________________*/

 /**
  * Useful links
  * @name API documentation for writing GNOME applications in JavaScript.
  * @see http://devdocs.baznga.org/
  *
  * @name Gnome Application Development book:
  * @see http://devernay.free.fr/cours/IHM/GTK/GGAD.pdf
  * 
  * @name Additional Code explanation:
  * @see https://wiki.gnome.org/Projects/GnomeShell/Extensions/EcoDoc/FirstExtension#Hello_World_Code_Sample
  */
  
  
 /** @name Gnome Seed - Namespace and Modules Importer 
  *  @see https://wiki.gnome.org/Projects/Seed
  *  @see https://github.com/GNOME/seed
  *  @see https://gi.readthedocs.io/en/latest/#gobject-introspection
  *  @see https://developer.gnome.org/gi/stable/overview.html
  *  @example Gnome Javascript (Gjs) engine <- Gnome Seed importer <- C libraries
  */
  
  

 /** @name Importing Native Modules 
  *  @see https://developer.gnome.org/seed/stable/seed-importer.html
     @see https://krakensden.com/p/1473028762 for mainloops
     @see http://smasue.github.io/gnome-shell-tw#tocAnchor-1-7-3
  */
const Mainloop = imports.mainloop;
 
/** @name Importing GObject-Introspection namespaces
 *  Gtk is the basic part of any GNOME application, which lets you create windows and widgets and tie them together.
 *  GLib is a helper library, which lets us do things like tell GNOME where the hellognome.html file we created is.
 *  And Webkit is a web rendering engine, which we'll use to basically create a browser window to open our HTML file with.
 *  @see https://developer.gnome.org/gnome-devel-demos/stable/hellognome.js.html.en
 */
const Gtk = imports.gi.Gtk; // https://en.wikipedia.org/wiki/GLib#/media/File:GTK%2B_software_architecture.svg
const GLib = imports.gi.GLib;
const Webkit = imports.gi.WebKit2;

const St = imports.gi.St; // Gnome Shell toolkit ( https://developer.gnome.org/st/stable/ )



/** @name About the Clutter
 *  The GNOME Shell uses Clutter to lay out its graphical components.
 *  The GNOME Shell does not use Clutter animation framework, but uses Tweener instead.
 *  @see
 */
const Clutter = imports.gi.Clutter;
 
/** @name Importing Gnome-Shell UI
 *  Javascript files that can be manipulated to change Gnome User Interface.
 *  @see https://gitlab.gnome.org/GNOME/gnome-shell 
 */
const Main = imports.ui.main; /** @returns https://gitlab.gnome.org/GNOME/gnome-shell/tree/master/js/ui/main.js */
const Tweener = imports.ui.tweener; /** @returns https://gitlab.gnome.org/GNOME/gnome-shell/tree/master/js/ui/tweener.js */



/* ____________________________________________________________________________________ 
                                 Gnome Seed Importer End
   ____________________________________________________________________________________ 
*/


let text, button;

function _hideHello() {
    Main.uiGroup.remove_actor(text);
    text = null;
}


// Show text actor, this function is executed after clicking a button.
function _showHello() {
    if (!text) {
        text = new St.Label({ style_class: 'helloworld-label', text: "Hello, world!" });
        Main.uiGroup.add_actor(text);
    }

    text.opacity = 255;

    let monitor = Main.layoutManager.primaryMonitor;

    // Calculate center of the monitor for text placement.
    text.set_position(monitor.x + Math.floor(monitor.width / 2 - text.width / 2),
                      monitor.y + Math.floor(monitor.height / 2 - text.height / 2));

    
    // Use Tweener ease out animation to lower opacity in 2 seconds 
    // and then execute _hideHello to remove text actor from the User Interface
    Tweener.addTween(text,
                     { opacity: 0,
                       time: 2,
                       transition: 'easeOutQuad',
                       onComplete: _hideHello });
}


// Init() function is first function that will be initialized, then enable() and disable() will follow. 
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
    
    
/*
The Signals section of the ClutterActor documentation lists all of the events emitted by an actor.
We can associate each event with one actor and a function that will be called when the event occurs, and will carry out what we want to happen when the event occurs (like move the actor when we click it, change its opacity when we hover it, etc.). This association is called "connect".
So, to connect one actor to one event: actor.connect(eventName, functionToCallWhenEventOccurs);
*/

    
    
    // LINKING button to a function.
    // After button object creation, connect button to a callback function
    //... When the button is pressed - execute following function...
    // in the enable() function we then assign button to the panel right box.
    button.connect('button-press-event', _showHello);
}

// What will happen when you enable extension by either Gnome Tweaks or gsettings.
function enable() {
    // Use panel from Main namespace to insert button at the beginning of panel's right box.
    Main.panel._rightBox.insert_child_at_index(button, 0);
}

// What will happen when you disable extension by either Gnome Tweaks or gsettings.
function disable() {
    Main.panel._rightBox.remove_child(button);
}
















