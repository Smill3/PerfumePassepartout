
import SwiftUI

struct ResultadosView: View {
    @State private var isIntroViewActive = false
    @State private var changeScreen = false

    
    @Environment(\.dismiss) var dismiss
    
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
                    VStack {
                        Image("caixaWinNew")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
                        
                        Button(action: {
                            self.changeScreen = true
                            
                        }) {
                            
                            Image("botaoCima")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                                .overlay{
                                    Text("Title Screen")
                                        .foregroundColor(.white)
                                        .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 35)))
                                    
                                }
                                .frame(alignment: .center)
                                .frame(maxWidth: .infinity)
                            
                        }
                        .frame(alignment: .center)
                        .frame(maxWidth: .infinity)
                        
                    }
                    .fullScreenCover(isPresented: $changeScreen) {
                        ContentView()
                    }
                    
                    
                    
                    
                case ("ocaDate", "ocaSpring", "perfumeFloral"),
                    ("ocaDate", "ocaSummer", "perfumeCitrico"),
                    ("ocaPark", "ocaSummer", "perfumeCitrico"),
                    ("ocaPark", "ocaWinter", "perfumeAmadeirado"),
                    ("ocaParty", "ocaSpring", "perfumeAmadeirado"),
                    ("ocaParty", "ocaSummer", "perfumeAmadeirado"),
                    ("ocaWork", "ocaSpring", "perfumeFloral"),
                    ("ocaWork", "ocaSummer", "perfumeCitrico"):
                    VStack {
                        Image("caixaWinNew")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
                        
                        
                        
                        //                    Spacer()
                        Button(action: {
                            self.changeScreen = true
                            
                        }) {
                            
                            Image("botaoCima")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                                .overlay{
                                    Text("Title Screen")
                                        .foregroundColor(.white)
                                        .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 35)))
                                    
                                }
                                .frame(alignment: .center)
                                .frame(maxWidth: .infinity)
                            
                        }
                        .frame(alignment: .center)
                        .frame(maxWidth: .infinity)
                        
                    }
                    .fullScreenCover(isPresented: $changeScreen) {
                        ContentView()
                    }
                    
                default:
                    Image("caixaFail")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2.4)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            //OccasionAndSeason.selectedPerfume = perfumeSelecionado
                            self.isIntroViewActive = true
                        }) {
                            ZStack {
                                Image("botaoCima")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                                    .overlay{
                                        Text("Sort Again")
                                            .foregroundColor(.white)
                                            .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 40)))
                                    }
                            }
                        }
                        Spacer()
                        Button(action: {
                            //OccasionAndSeason.selectedPerfume = perfumeSelecionado
                            //                            self.changeScreen = true
                            dismiss()
                        }) {
                            ZStack {
                                Image("botaoCima")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                                    .overlay{
                                        Text("Try Again")
                                            .foregroundColor(.white)
                                            .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 40)))
                                    }
                                
                            }
                            
                        }
                        Spacer()
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.85)
                }
            }
            .fullScreenCover(isPresented: $isIntroViewActive) {
                SortOcaView()
            }
        }
    }
}

#Preview("teste") {
    OccasionAndSeason.selectedOccasion = "ocaDate"
    OccasionAndSeason.selectedSeason = "ocaFall"
    OccasionAndSeason.selectedPerfume = "perfumeAmadeirado"
    
    return ResultadosView()
}
