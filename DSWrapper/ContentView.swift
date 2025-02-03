import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        WebView(url: URL(string: "http://localhost:3000")!)
            .frame(
                            minWidth: 800,
                            maxWidth: .infinity,
                            minHeight: 600,
                            maxHeight: .infinity
                        )
    }
}

// MARK: - WebView Implementation
struct WebView: NSViewRepresentable {
    let url: URL
    
    func makeNSView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        
        // Handle reload notifications
        NotificationCenter.default.addObserver(forName: .reloadWebView, object: nil, queue: .main) { _ in
            webView.reload()
        }
        
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {}
    
    // Coordinator for handling navigation
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        // Add navigation handling here if needed
    }
}
