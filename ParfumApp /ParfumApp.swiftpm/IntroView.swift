import SwiftUI

struct IntroView: View {
    @State private var isShowingFirstText = true

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("backGroundA")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    
//                        Spacer()

                        Image("caixaTexto1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)

//                        Spacer()
                    

                    if isShowingFirstText {
                        Text("Welcome to Perfume Passepartout your ultimate guide in perfumes. Here you will learn what is the best type of perfume to use in certain ocasions.")
                            .foregroundColor(.white)
                            .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 50)))
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal, 100)
                            .padding(.top, 150)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .frame(maxHeight: .infinity) // Removendo limite de altura
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.1)
                    } else {
                        Text("To teach you we will cover:\n \n• 4 Scenarios \n• 4 seasons of the year \n• 4 Types of perfume  ")
                            .foregroundColor(.white)
                            .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 30)))
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal, 100)
                            .padding(.top, 150)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .frame(maxHeight: .infinity) // Removendo limite de altura
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.1)
                    }

                    Image("botaoCima")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                        .padding()
                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0.4)
                        .onTapGesture {
                            isShowingFirstText.toggle()
                        }

                    HStack {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 50)))
                            .padding(.top, -geometry.size.height * 0.25)
                            .position(x: geometry.size.width / 2, y: geometry.size.height * 0.38)
                    }

                    Spacer()
                }
            }
        }
    }
}
