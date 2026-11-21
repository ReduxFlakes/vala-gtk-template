namespace MyApp {
    public class Application : Adw.Application {
        public Application () {
            Object (application_id: "com.example.myapp",
                    flags: ApplicationFlags.DEFAULT_FLAGS);
        }

        public override void activate () {
            base.activate ();
            var window = new Window (this);
            window.present ();
        }
    }
}

int main (string[] args) {
    var app = new MyApp.Application ();
    return app.run (args);
}
