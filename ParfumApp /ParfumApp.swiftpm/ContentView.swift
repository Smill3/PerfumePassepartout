import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isIntroViewActive = false
    var soundManager = SoundManager()
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Image("displayName")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: min(geometry.size.width * 0.7, 700), height: min(geometry.size.height * 0.4, 600))
                            .padding(.top, 200)
                        
                        Button(action: {
                            isIntroViewActive = true
                        }) {
                            Image("botaoCima")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                                .padding()
                        }
                        .fullScreenCover(isPresented: $isIntroViewActive) {
                            IntroView()
                        }
                        
                        Text("Start")
                            .foregroundColor(.white)
                            .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 50)))
                            .padding(.top, -140)
                        
                        Spacer()
                        
//                        Text("An Experience made by: Christian.  2024 Brazil")
//                            .foregroundColor(.pink)
//                            .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 50)))
                        
                        // Estrutura responsiva em grade
                        VStack {
                            ForEach(0..<4) { rowIndex in
                                HStack {
                                    ForEach(0..<4) { colIndex in
                                        // Text("Item (\(rowIndex * 4 + colIndex))")
                                        // .frame(width: geometry.size.width / 4,
                                        //      height: geometry.size.height / 4)
                                    }
                                }
                            }
                        }
                    }
                    .frame(width: geometry.size.width)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .background(
                Image("backGroundA")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            
            .onAppear(){
                if !MyApp.songPlaying {
                    soundManager.loadSound(fileNamed: "BGM")
                    MyApp.songPlaying = true
                }
                
            }
        }

      
    }
}


#Preview {
    ContentView()
}
