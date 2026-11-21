namespace MyApp {
    [GtkTemplate (ui = "/com/example/myapp/window.ui")]
    public class Window : Adw.ApplicationWindow {
        [GtkChild] private unowned Gtk.Label mylabel;

        public Window (Adw.Application app) {
            Object (application: app);
        }

        construct {
           mylabel.label = "Hello World :3";
        }
    }
}
