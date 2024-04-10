{{flutter_build_config}}
{{flutter_js}}

const loadingSpan = document.querySelector('#loading-text');
document.body.style.backgroundColor = "#6BDFFF";
loadingSpan.textContent = "Loading the application...";

_flutter.loader.load({
    onEntrypointLoaded: (engineInitializer) => {
        loadingSpan.textContent = "Application initialization...";
        engineInitializer.initializeEngine().then((appRunner) => {
            loadingSpan.textContent = "Launching the application...";
            appRunner.runApp().then((_) => {
                window.setTimeout(() => document.body.style.backgroundColor = "#fff", 500);
            });
        });
    }
});