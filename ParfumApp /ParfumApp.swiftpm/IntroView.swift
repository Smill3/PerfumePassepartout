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

                        Image("caixaTexto1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)

                        Spacer()
                    }

                    Text("First we need to understand the fragrancies and in what scenario which one fits the most.")
                        .foregroundColor(.white)
                        .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 30)))
                        .padding(.top, -geometry.size.height * 0.15)

                    Image("botaoCima")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: min(geometry.size.width * 0.3, 200), height: min(geometry.size.width * 0.3, 200))
                        .padding()
                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0.5)

                    HStack {
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.custom("Baskic8", size: min(geometry.size.width * 0.1, 50)))
                            .padding(.top, -geometry.size.height * 0.25)
                            .position(x: geometry.size.width / 2, y: geometry.size.height * 0.4)
                    }

                    Spacer()
                }
            }
        }
    }
}
