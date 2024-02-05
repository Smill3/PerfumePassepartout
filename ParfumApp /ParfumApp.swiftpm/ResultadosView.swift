
import SwiftUI

struct ResultadosView: View {
    @State private var isIntroViewActive = false
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                Image("backGroundA")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                switch (OccasionAndSeason.selectedOccasion, OccasionAndSeason.selectedSeason, OccasionAndSeason.selectedPerfume) {
                case ("ocaDate", "ocaFall", "perfumeAmadeirado"),
                     ("ocaDate", "ocaWinter", "perfumeAmadeirado"),
                     ("ocaPark", "ocaFall", "perfumeFloral"),
                     ("ocaPark", "ocaSpring", "perfumeFloral"),
                     ("ocaParty", "ocaFall", "perfumeSpicy"),
                     ("ocaParty", "ocaWinter", "perfumeSpicy"),
                     ("ocaWork", "ocaFall", "perfumeAmadeirado"),
                     ("ocaWork", "ocaWinter", "perfumeAmadeirado"):
                    Image("caixaWin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
                    
                case ("ocaDate", "ocaSpring", "perfumeFloral"),
                     ("ocaDate", "ocaSummer", "perfumeCitrico"),
                     ("ocaPark", "ocaSummer", "perfumeCitrico"),
                    ("ocaPark", "ocaWinter", "perfumeAmadeirado"),
                     ("ocaParty", "ocaSpring", "perfumeAmadeirado"),
                     ("ocaParty", "ocaSummer", "perfumeAmadeirado"),
                     ("ocaWork", "ocaSpring", "perfumeFloral"),
                     ("ocaWork", "ocaSummer", "perfumeCitrico"):
                    Image("caixaWin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
                    
                default:
                    Image("caixaFail")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
                    Button(action: {
                        //OccasionAndSeason.selectedPerfume = perfumeSelecionado
                        self.isIntroViewActive = true
                    }) {
                        Image("botaoCima")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.9)
                
                Text("Retry")
                    .foregroundColor(.white)
                    .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 50)))
                    .padding(.top, -geometry.size.height * 0.25)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 1.13)
                    
                }
            }
            .fullScreenCover(isPresented: $isIntroViewActive) {
                SortOcaView()
                }
            }
        }
    }

#Preview {
    ResultadosView()
}
