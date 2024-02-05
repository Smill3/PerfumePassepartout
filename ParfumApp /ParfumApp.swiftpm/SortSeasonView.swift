import SwiftUI

struct SortSeasonView: View {
    @State private var animationIndex = 0
    @State private var randomAssetIndex = 0
    @State private var animationCount = 0
    let totalAnimationCounts = 3 // Número de vezes que a animação passará por todos os assets
    @State private var isIntroViewActive = false
    @State private var isAnimationFinished = false
    let assetNames = ["ocaWinter", "ocaSpring", "ocaFall", "ocaSummer"]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("backGroundA")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Image(self.assetNames[self.animationIndex])
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
                        .animation(.easeInOut(duration: 0.3))
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
                                withAnimation {
                                    self.animationIndex += 1
                                    if self.animationIndex == self.assetNames.count {
                                        self.animationIndex = 0
                                        self.animationCount += 1
                                    }
                                }
                                if self.animationCount == self.totalAnimationCounts && self.animationIndex == self.randomAssetIndex {
                                    timer.invalidate()
                                    self.isAnimationFinished = true // Ativa o botão ao fim da animação
                                    OccasionAndSeason.selectedSeason = self.assetNames[self.randomAssetIndex]
                                }
                            }
                    }
                }
                
                if self.isAnimationFinished {
                    Button(action: {
                        self.isIntroViewActive = true
                    }) {
                        Image("botaoCima")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.9)
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 50)))
                        .padding(.top, -geometry.size.height * 0.25)
                        .position(x: geometry.size.width / 2, y: geometry.size.height * 1.13)
                        .fullScreenCover(isPresented: $isIntroViewActive) {
                            PerfumeSelectView()
                        }
                }
            }
        }
        .onAppear {
            self.randomAssetIndex = Int.random(in: 0..<self.assetNames.count)
        }
    }
}

//.position(y: geometry.size.height * 0.9)
