import SwiftUI

struct IntroView: View {
    @State private var isShowingFirstText = true
    @State private var imageName = "caixaTextoComTexto"
    @State private var isNavigating = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("backGroundA")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    if isShowingFirstText {
                        Image("caixaTextoComTexto")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
                    } else {
                        Image("caixaTextoComTexto2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
                    }
                    
                    Button(action: {
                        isShowingFirstText.toggle()
                    }) {
                        Image("botaoCima")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                            .padding()
                            .position(x: geometry.size.width / 2, y: geometry.size.height * 0.5)
                        
                    }
                    
                    HStack {
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 50)))
                            .padding(.top, -geometry.size.height * 0.25)
                            .position(x: geometry.size.width / 2, y: geometry.size.height * 0.4)
                            .onTapGesture {
                                if isShowingFirstText {
                                    isShowingFirstText.toggle()
                                } else {
                                    isNavigating = true
                                }
                            }
                            .fullScreenCover(isPresented: $isNavigating, content: {
                                ScenariosView()
                            })
                    }
                    
                    Spacer()
                }
            }
        }
    }
}
#Preview {
    IntroView()
}
