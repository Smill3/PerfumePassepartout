import AVFoundation

class SoundManager {
    
    var audioPlayer: AVAudioPlayer?

    func loadSound(fileNamed: String) {
        if let path = Bundle.main.path(forResource: fileNamed, ofType: "wav") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.volume = 0.2
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print("Error loading sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found")
        }
    }
    
    func stopSound() {
            audioPlayer?.stop()
        }
}
