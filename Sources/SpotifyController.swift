import Foundation

/// Controller for Spotify media playback using AppleScript
class SpotifyController {
    /// Play/Pause the current track
    static func togglePlayPause() {
        executeAppleScript("tell application \"Spotify\" to playpause")
    }
    
    /// Play next track
    static func nextTrack() {
        executeAppleScript("tell application \"Spotify\" to next track")
    }
    
    /// Play previous track
    static func previousTrack() {
        executeAppleScript("tell application \"Spotify\" to previous track")
    }
    
    /// Get current playing track name
    static func getCurrentTrack() -> String {
        let result = executeAppleScriptWithResult("tell application \"Spotify\" to get name of current track")
        return result.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Get current artist name
    static func getCurrentArtist() -> String {
        let result = executeAppleScriptWithResult("tell application \"Spotify\" to get artist of current track")
        return result.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Check if Spotify is playing
    static func isPlaying() -> Bool {
        let result = executeAppleScriptWithResult("tell application \"Spotify\" to get player state")
        return result.contains("playing")
    }
    
    /// Execute AppleScript command
    private static func executeAppleScript(_ script: String) {
        guard let appleScript = NSAppleScript(source: script) else { return }
        var error: NSDictionary?
        appleScript.executeAndReturnError(&error)
    }
    
    /// Execute AppleScript and get result
    private static func executeAppleScriptWithResult(_ script: String) -> String {
        guard let appleScript = NSAppleScript(source: script) else { return "" }
        var error: NSDictionary?
        let result = appleScript.executeAndReturnError(&error)
        return result?.stringValue ?? ""
    }
}
