import Foundation
import AppKit

/// Main entry point for the Nudge macOS application
struct NudgeApp {
    static func main() {
        // Initialize the application
        let app = NSApplication.shared
        
        // Create the app delegate
        let delegate = AppDelegate()
        app.delegate = delegate
        
        // Run the application
NSApplication.shared.run() 
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    private var window: NSWindow?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Set up the main window
        setupMainWindow()
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    private func setupMainWindow() {
        let mainWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 600, height: 400),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        
        mainWindow.title = "Nudge - macOS Dynamic Notch"
        mainWindow.center()
        mainWindow.makeKeyAndOrderFront(nil)
        
        // Set content view
        let contentView = NSView(frame: mainWindow.contentView?.frame ?? .zero)
        contentView.wantsLayer = true
        contentView.layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor
        mainWindow.contentView = contentView
        
        self.window = mainWindow

                // Setup Notch Controller
        let notchVC = NotchViewController()
        notchVC.view.frame = NSRect(x: 0, y: 0, width: 400, height: 50)
        self.window?.contentView?.addSubview(notchVC.view)
    }
}

// Entry point
NudgeApp.main()
