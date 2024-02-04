import SwiftUI

struct SeasonsView: View {
    @State private var isIntroViewActive = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("backGroundA")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            VStack{
                Image("caixaEstacoes2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
                
                
                Button(action: {
                    isIntroViewActive = true
                }) {
                    Image("botaoCima")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                }
                .position(x: geometry.size.width / 2, y: geometry.size.height * 0.6)
                
                Text("Next")
                    .foregroundColor(.white)
                    .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 50)))
                    .padding(.top, -geometry.size.height * 0.25)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.5)
                
            }
            
            
            
        }
        .fullScreenCover(isPresented: $isIntroViewActive) {
            PerfumesView()
        }
    }
}
#Preview {
    SeasonsView()
}
