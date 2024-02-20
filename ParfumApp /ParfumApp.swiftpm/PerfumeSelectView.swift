
import SwiftUI

struct PerfumeSelectView: View {
    @State var caixaFrases = "caixaTextoPerfumeVazia2"
    @State var opacityAmadeirado = 1.0
    @State var opacityCitrico = 1.0
    @State var opacityFloral = 1.0
    @State var opacitySpicy = 1.0
    @State var perfumeSelecionado = ""
    @State private var isIntroViewActive = false
    @State var bannerSize : CGFloat = 0
    @State var bannerPadding: CGFloat = 0
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                Image("backGroundA")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    
                    Image(OccasionAndSeason.selectedOccasion)

                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: bannerSize, height: bannerSize)
                        .padding(.top, 10) // Mova um pouco para cima
                        .padding(.leading, 1)
                    // Mova um pouco para a direita
                    Spacer()
                     // Nova imagem no canto superior direito
                    Image(OccasionAndSeason.selectedSeason)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: bannerSize, height: bannerSize)
                        .padding(.top, 10) // Mova um pouco para cima
                        .padding(.trailing, bannerPadding) // Mova um pouco para a direita
                    Spacer()
                }
                Image(caixaFrases)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.4)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
                
                VStack {
                    HStack(spacing: 30) {
                        Button {
                            perfumeSelecionado = "perfumeAmadeirado"
                            caixaFrases = "caixaAmadeirado"
                            opacityAmadeirado = 1.0
                            opacityCitrico = 0.3
                            opacityFloral = 0.3
                            opacitySpicy = 0.3
                        } label: {
                            Image("perfumeAmadeirado")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .opacity(opacityAmadeirado)
                        }
                        
                        Spacer()
                        
                        Button {
                            perfumeSelecionado = "perfumeCitrico"
                            caixaFrases = "caixaCitrico"
                            opacityAmadeirado = 0.3
                            opacityCitrico = 1.0
                            opacityFloral = 0.3
                            opacitySpicy = 0.3
                        } label: {
                            Image("perfumeCitrico")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .opacity(opacityCitrico)
                        }
                        
                        Spacer()
                        
                        Button {
                            perfumeSelecionado = "perfumeFloral"
                            caixaFrases = "caixaFloral"
                            opacityAmadeirado = 0.3
                            opacityCitrico = 0.3
                            opacityFloral = 1.0
                            opacitySpicy = 0.3
                        } label: {
                            Image("perfumeFloral")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .opacity(opacityFloral)
                        }
                        
                        Spacer()
                        
                        Button {
                            perfumeSelecionado = "perfumeSpicy"
                            caixaFrases = "caixaSpicy"
                            opacityAmadeirado = 0.3
                            opacityCitrico = 0.3
                            opacityFloral = 0.3
                            opacitySpicy = 1.0
                        } label: {
                            Image("perfumeSpicy")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .opacity(opacitySpicy)
                        }
                        
                    }
                    .padding(.horizontal, 100)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.42)
                    
                    Button(action: {
                        OccasionAndSeason.selectedPerfume = perfumeSelecionado
                        self.isIntroViewActive = true
                    }) {
                        Image("botaoCima")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                    }
                .position(x: geometry.size.width / 2, y: geometry.size.height * 0.5)
                
                Text("Next")
                    .foregroundColor(.white)
                    .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 50)))
                    .padding(.top, -geometry.size.height * 0.25)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.4)
                    
                }
            }
            .fullScreenCover(isPresented: $isIntroViewActive) {
                ResultadosView()
            }
            .onAppear() {
        
                self.resizeBanner(size: geometry)
            }
        }
    }
    func resizeBanner(size: GeometryProxy){
        if size.size.height >= 1150 {
            bannerSize = 350
            bannerPadding = 20
        } else {
            bannerSize = 300
            bannerPadding = 60
        }
    }
}
#Preview {
    PerfumeSelectView()
}
