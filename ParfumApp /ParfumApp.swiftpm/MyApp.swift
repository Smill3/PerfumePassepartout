import SwiftUI

@main
struct MyApp: App {
    static var songPlaying = false
    init() {
            MyFonts.registerFonts()
        }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
