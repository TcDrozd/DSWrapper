import SwiftUI

@main
struct WebWrapperApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 400, minHeight: 800)
        }
        .windowStyle(.titleBar)
        .windowResizability(.contentSize)
        .commands {
            // Remove default "New Window" option
            CommandGroup(replacing: .newItem) {}
            // Add custom reload command
            CommandGroup(after: .appInfo) {
                Button("Reload") {
                    NotificationCenter.default.post(name: .reloadWebView, object: nil)
                }.keyboardShortcut("r")
            }
        }
    }
}

// Notification for reloading the web view
extension Notification.Name {
    static let reloadWebView = Notification.Name("reloadWebView")
}
