pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "EpicMickeyAndroid"

include(
    ":app",            // Android Launcher
    ":core:common",
    ":engine",         // native core: renderer, input bus, PAK reader, backend registry
    ":importer",       // Game Importer
    ":backend:em1",    // Epic Mickey 1 Backend
    ":backend:em2",    // Epic Mickey 2 Backend
    ":controls",       // Touch Controls + layouts
    ":editor",         // Layout Editor
    ":graphics",       // Graphics Manager
    ":save",           // Save Manager
    ":audio",          // Audio Manager
    ":settings",       // Settings
)
