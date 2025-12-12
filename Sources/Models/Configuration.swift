import Foundation

/// Configuration structure for Nudge application settings
struct NudgeConfiguration: Codable {
    /// General settings
    var general: GeneralSettings = GeneralSettings()
    /// Display settings
    var display: DisplaySettings = DisplaySettings()
    /// Notification settings
    var notifications: NotificationSettings = NotificationSettings()
    
    /// Save configuration to disk
    func save(to url: URL) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(self)
        try data.write(to: url)
    }
    
    /// Load configuration from disk
    static func load(from url: URL) throws -> NudgeConfiguration {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(NudgeConfiguration.self, from: data)
    }
}

/// General application settings
struct GeneralSettings: Codable {
    var appName: String = "Nudge"
    var version: String = "1.0.0"
    var launchAtLogin: Bool = false
}

/// Display and UI settings
struct DisplaySettings: Codable {
    var theme: String = "system" // "light", "dark", "system"
    var opacity: Double = 1.0
    var animationDuration: Double = 0.3
    var cornerRadius: Double = 16.0
}

/// Notification settings
struct NotificationSettings: Codable {
    var enableNotifications: Bool = true
    var soundEnabled: Bool = true
    var notificationPosition: String = "top" // "top", "center", "bottom"
}
