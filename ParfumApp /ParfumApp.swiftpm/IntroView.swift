import SwiftUI

struct IntroView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("backGroundA")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Image("caixaTexto")
                            .resizable()
                            .scaledToFit()
                            .frame(width: min(geometry.size.width * 0.7, 700), height: min(geometry.size.height * 0.4, 600))
                            .alignmentGuide(.leading) { _ in geometry.size.width / 10 }
                            .offset(y: -50)
                        
                        Spacer()
                    }
                    
                    Text("First we need to do")
                        .foregroundColor(.white)
                        .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 50)))
                        .padding(.top, -450)
                    
                    // Estrutura responsiva em grade
                    HStack(spacing: 16) {
                        ForEach(0..<4) { index in
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: (geometry.size.width - 64) / 4, height: 100)
                        }
                    }
                    .padding(16)
                    
                    Spacer()
                }
            }
        }
    }
}
