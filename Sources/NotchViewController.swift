import AppKit

/// View controller for the dynamic notch UI with Spotify controls
class NotchViewController: NSViewController {
    
    // MARK: - UI Components
    
    private let spotifyPlayButton = NSButton()
    private let spotifyNextButton = NSButton()
    private let spotifyPrevButton = NSButton()
    private let trackLabel = NSTextField()
    private let artistLabel = NSTextField()
    private let containerView = NSView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        let containerView = NSView()
        containerView.wantsLayer = true
        containerView.layer?.backgroundColor = NSColor.black.cgColor
        containerView.layer?.cornerRadius = 8
        self.view.addSubview(containerView)
        
        // Play/Pause Button
        setupButton(spotifyPlayButton, title: "▶", action: #selector(togglePlayPause), x: 10)
        containerView.addSubview(spotifyPlayButton)
        
        // Previous Button
        setupButton(spotifyPrevButton, title: "⏮", action: #selector(previousTrack), x: 50)
        containerView.addSubview(spotifyPrevButton)
        
        // Next Button
        setupButton(spotifyNextButton, title: "⏭", action: #selector(nextTrack), x: 90)
        containerView.addSubview(spotifyNextButton)
        
        // Track Label
        trackLabel.stringValue = "No track playing"
        trackLabel.isEditable = false
        trackLabel.isBezeled = false
        trackLabel.backgroundColor = .clear
        trackLabel.textColor = .white
        trackLabel.frame = NSRect(x: 140, y: 20, width: 250, height: 20)
        containerView.addSubview(trackLabel)
        
        // Artist Label
        artistLabel.stringValue = ""
        artistLabel.isEditable = false
        artistLabel.isBezeled = false
        artistLabel.backgroundColor = .clear
        artistLabel.textColor = NSColor.lightGray
        artistLabel.frame = NSRect(x: 140, y: 0, width: 250, height: 20)
        containerView.addSubview(artistLabel)
        
        containerView.frame = NSRect(x: 0, y: 0, width: 400, height: 50)
    }
    
    private func setupButton(_ button: NSButton, title: String, action: Selector, x: Int) {
        button.title = title
        button.action = action
        button.target = self
        button.frame = NSRect(x: x, y: 15, width: 30, height: 30)
        button.bezelStyle = .rounded
        button.isBordered = true
    }
    
    // MARK: - Spotify Controls
    
    @objc private func togglePlayPause() {
        SpotifyController.togglePlayPause()
        updateTrackInfo()
    }
    
    @objc private func nextTrack() {
        SpotifyController.nextTrack()
        updateTrackInfo()
    }
    
    @objc private func previousTrack() {
        SpotifyController.previousTrack()
        updateTrackInfo()
    }
    
    private func updateTrackInfo() {
        let track = SpotifyController.getCurrentTrack()
        let artist = SpotifyController.getCurrentArtist()
        trackLabel.stringValue = track.isEmpty ? "No track playing" : track
        artistLabel.stringValue = artist
    }
}
