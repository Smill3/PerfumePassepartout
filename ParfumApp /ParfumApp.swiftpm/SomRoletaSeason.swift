import AVFoundation

class SoundRoletaEstacao {
    var audioPlayer: AVAudioPlayer?

    func loadSound(fileNamed: String) {
        if let path = Bundle.main.path(forResource: fileNamed, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.volume = 0.1
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
