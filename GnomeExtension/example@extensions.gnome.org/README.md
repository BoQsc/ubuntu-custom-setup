# Example Extension named: example@extensions.gnome.org

## GObject-Introspection

Introspection is a way of finding out what an object is and what it contains at runtime. In some languages this is more necessary than others. Python which is dynamically typed (that is to say, an object can gain attributes and methods at runtime) uses introspection to find out an object's current status.

Now onto GObjects and GObject-based libraries. They're in C and in C you don't get all this lovely fluffy managed code nonsense, you get performance. This means built-in introspection isn't there and that means it's harder to maintain an external binding.

Bindings are an API between things in different languages that allow them to work together. In order for that to work you need a common API and in this case that API is GObject. But for this to work, the caller binding has to know what's available to it. Until GObject Introspection this has had to be hard-coded into the bindings and that means maintaining a hand-written list on each set of bindings.

GObject Introspection essentially provides a scanner that can hunt through the current source of the GObject you're working with and provides you with XML binding information. This is then processed by the bindings and you end up with an API that just works, all the time.

https://askubuntu.com/a/108180
